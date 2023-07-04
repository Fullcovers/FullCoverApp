import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Providers/UserProvider.dart';
import 'package:venq_assessment/Services/BTS_Services/Club_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Auth/Login.dart';
import 'package:venq_assessment/screens/Bookings/MyBookingPage.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/BehindThe%20Scenes/BehindTheScenes.dart';
import 'package:venq_assessment/utils/Constants.dart';

class SplashScreen extends StatefulWidget {
  var user;
  
  SplashScreen({super.key, required this.user});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  load()async{
    if(Constants.btsprofile.role != "user"){
        await BTSClubServices.btsgetSingleClub(context: context);}

   await Future.delayed(Duration(milliseconds: 500), () {
     widget.user
                ? Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()))
                : Constants.btsprofile.role == "user"
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  MyBookingPage()))
                    :  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const BehindTheScenesPage()));
    });
  }
  bool loded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         Image.asset(
            Constants.backgroundimage,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        Scaffold(
            backgroundColor: backgroundColortransperent,
            body: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    scale: 1.5,
                  ),
                  CircularProgressIndicator()
                ],
              ),
            )),
      ],
    );
  }
}
