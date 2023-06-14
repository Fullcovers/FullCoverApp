import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Bookings/bookinghistory.dart';
import 'package:venq_assessment/screens/profile/coins.dart';
import 'package:venq_assessment/screens/profile/editprofile.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColorfigma,
      body: Column(children: [
        HeaderContent(title: "Profile"),
        Image.asset(
          "assets/images/profile.png",
          scale: 1.5,
        ),
        Text(
          'zee you',
          style: GoogleFonts.bebasNeue(
              fontWeight: FontWeight.w500, fontSize: 40, color: offwhite),
        ),
        InkWell(  onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  EditProfile()));
            },
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Container(
              width: width / 3,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(),
                  color: Color.fromARGB(255, 133, 132, 132)),
              child: Center(
                  child: Text(
                "Edit Profile",
                style: GoogleFonts.sairaCondensed(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: backgroundColorfigma),
              )),
            ),
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Align(
        //     alignment: Alignment.centerLeft,
        //     child: Text(
        //       'Bio',
        //       style: GoogleFonts.bebasNeue(
        //           fontWeight: FontWeight.w500, fontSize: 25, color: offwhite),
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text(
        //     'Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima veniam illum asperiores corrupti vitae voluptate porro fugiat voluptatibus, accusamus omnis!',
        //     style: GoogleFonts.sairaCondensed(
        //         fontWeight: FontWeight.w500, fontSize: 15, color: offwhite),
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.only(left: 18.0, right: 18, top: 8),
          child: const FractionalTranslation(
            translation: Offset(0, 6),
            child: Divider(
              height: 1,
              color: Color(0XFF444444),
              thickness: 1,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: height / 20,
            left: width / 5.0,
            right: width / 5.0,
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CoinsScreen()));
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/coinlogo.png",
                    scale: 12,
                  ),
                  Text(
                    "Coins",
                    style: GoogleFonts.sairaCondensed(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: offwhite),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: offwhite,
                  )
                ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: height / 20,
            left: width / 5.0,
            right: width / 5.0,
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BookingHistory()));
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.branding_watermark_rounded,
                    color: offwhite,
                  ),
                  Text(
                    "bookings",
                    style: GoogleFonts.sairaCondensed(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: offwhite),
                  ),
                  Icon(
                    Icons.navigate_next,
                    color: offwhite,
                  )
                ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: height / 20,
            left: width / 5.0,
            right: width / 5.0,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(
              Icons.logout_sharp,
              color: offwhite,
            ),
            Text(
              "Log Out",
              style: GoogleFonts.sairaCondensed(
                  fontWeight: FontWeight.w500, fontSize: 25, color: offwhite),
            ),
            Icon(
              Icons.navigate_next,
              color: offwhite,
            )
          ]),
        ),
      ]),
    ));
  }
}
