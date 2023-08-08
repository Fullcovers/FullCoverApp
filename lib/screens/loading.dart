import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Providers/UserProvider.dart';
import 'package:venq_assessment/Services/BTS_Services/Club_Services.dart';
import 'package:venq_assessment/Services/Club_Services.dart';
import 'package:venq_assessment/Services/RestoBar_Services.dart';
import 'package:venq_assessment/Services/Stories_Services.dart';
import 'package:venq_assessment/Services/User_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Auth/Login.dart';
import 'package:venq_assessment/screens/Bookings/MyBookingPage.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/BehindThe%20Scenes/BehindTheScenes.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  var user;

  SplashScreen({super.key, required this.user});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
    getclubs();

    _controller = VideoPlayerController.asset("assets/LogointroApp.mp4")
      ..initialize().then((_) {
        setState(() {
          _controller.setLooping(true);
          _controller.play();
        });
      });
  }

  getclubs() async {
    Constants.allrestobar =
        await RestobarServices.getAllRestobar(context: context);

    // ignore: use_build_context_synchronously
    Constants.allclubs = await ClubServices.getAllClubs(context: context);
    // Constants.allclubstories =
    //     // ignore: use_build_context_synchronously
    //     await StoriesServicesUser.getstories(context: context);
    // print(Constants.allclubstories);
    Constants.allclubstories =
        await StoriesServicesUser.getstories(context: context);

    widget.user ? null : UserServices.getprofileinfo();

    // setState(() {
    //   lodedclub = true;
    // });
  }

  load() async {
    // print("Constants.btsprofile.role");print(Constants.btsprofile.role);
    if (!widget.user) {
      if (Constants.btsprofile.role != "user") {
        await BTSClubServices.btsgetSingleClub(context: context);
      }
    }

    await Future.delayed(Duration(milliseconds: 9000), () {
      widget.user
          ? Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()))
          : Constants.btsprofile.role == "user"
              ? Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyBookingPage()))
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BehindTheScenesPage()));
    });
  }

  bool loded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //  Image.asset(
        //     Constants.backgroundimage,
        //     height: MediaQuery.of(context).size.height,
        //     width: MediaQuery.of(context).size.width,
        //     fit: BoxFit.cover,
        //   ),
        Scaffold(
            backgroundColor: backgroundColortransperent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   "assets/images/logo.png",
                  //   scale: 1.5,
                  // ),
                  Container(
                    // width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                  // Constants.mycircularProgressIndicator()
                ],
              ),
            )),
      ],
    );
  }
}
