import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Models/UserModel.dart';
import 'package:venq_assessment/Providers/UserProvider.dart';
import 'package:venq_assessment/Services/BTS_Services/Club_Services.dart';
import 'package:venq_assessment/Services/User_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Profile/CarouselPage.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Profile/Myclub.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Profile/Ticketsbts.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Profile/editprofilebts.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';

class BTSProfile extends StatefulWidget {
  const BTSProfile({super.key});

  @override
  State<BTSProfile> createState() => _BTSProfileState();
}

@override
class _BTSProfileState extends State<BTSProfile> {
  UserData user = Constants.btsprofile;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final userprovider = Provider.of<UserProvider>(context);

    return SafeArea(
        child: Stack(
      children: [
        Image.asset(
          Constants.backgroundimage,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: backgroundColortransperent,
            body: SingleChildScrollView(
              child: Column(children: [
                HeaderContent(title: "Profile"),
                Constants.btsprofile.image.isNotEmpty ||
                        Constants.btsprofile.image != ""
                    ? Container(
                        height: height / 10,
                        child: Image.network( 
                          Constants.btsprofile.image,
                          scale: 1.5,
                        ),
                      )
                    : Container(
                        height: height / 10,
                        child: Image.asset(
                          "assets/images/profile.png",
                          scale: 1.5,
                        ),
                      ),
                Text(
                  user.name.firstName + " " + user.name.lastName,
                  style: GoogleFonts.bebasNeue(
                      fontWeight: FontWeight.w500,
                      fontSize: 40,
                      color: offwhite),
                ),

                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => BTSEditProfile()));
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 18.0),
                //     child: Container(
                //       width: width / 3,
                //       height: 50,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(25),
                //           border: Border.all(),
                //           color: Color.fromARGB(255, 133, 132, 132)),
                //       child: Center(
                //           child: Text(
                //         "Edit Profile",
                //         style: GoogleFonts.sairaCondensed(
                //             fontWeight: FontWeight.w500,
                //             fontSize: 20,
                //             color: backgroundColorfigma),
                //       )),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Phone Number",
                      style: GoogleFonts.sairaCondensed(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: offwhite),
                    ),
                    Text(
                      user.phoneNumber.isNotEmpty ? user.phoneNumber : "",
                      style: GoogleFonts.sairaCondensed(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: offwhite),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Email",
                      style: GoogleFonts.sairaCondensed(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: offwhite),
                    ),
                    Text(
                      user.email,
                      style: GoogleFonts.sairaCondensed(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: offwhite),
                    ),
                  ],
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BTSTicket()));
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/ticket.png",
                            color: Colors.white,
                            scale: 14,
                          ),
                          Text(
                            "Ticket",
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
                              builder: (context) => const MyClub()));
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/club.png",
                            color: Colors.white,
                            scale: 14,
                          ),
                          Text(
                            "My Club",
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
                              builder: (context) => const CarouselPage()));
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.image,
                            color: offwhite,
                          ),
                          Text(
                            "Carousel",
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
                InkWell(
                  onTap: () {
                    userprovider.deleteToken();
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login', (route) => false);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: height / 20,
                      left: width / 5.0,
                      right: width / 5.0,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.logout_sharp,
                            color: offwhite,
                          ),
                          Text(
                            "Log Out",
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
              ]),
            )),
      ],
    ));
  }
}
