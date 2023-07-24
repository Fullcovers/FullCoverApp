import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Services/BTS_Services/Club_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Events/Event.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Gustlist/Gustlist.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Gustlist/Gustlist2.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Profile/Profile.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Promoters/Promoters.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Tables/Tables.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Tickets/Tickets.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Walkins/Walkins.dart';
import 'package:venq_assessment/screens/QrScanner/QrScanner.dart';
import 'package:venq_assessment/screens/RestoBarDashBoard/Profile/Profile.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/BehindTheScenesCard.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/BottomButton.dart';
import 'package:venq_assessment/widgets/CustumPageRoute.dart';

class RestoBehindTheScenesPage extends StatefulWidget {
  const RestoBehindTheScenesPage({super.key});

  @override
  State<RestoBehindTheScenesPage> createState() => _RestoBehindTheScenesPageState();
}

class _RestoBehindTheScenesPageState extends State<RestoBehindTheScenesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  bool loded = false;
  load() async {
    // await BTSClubServices.btsgetSingleClub(context: context);
    setState(() {
      loded = true;
    });
  }

  Color textc = golden;
  bool forAndroid = 
  // false;
  Constants.myrestobar!.isClubOpen;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
            resizeToAvoidBottomInset: false,
            backgroundColor: backgroundColortransperent,
            body: SingleChildScrollView(
                child: loded
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: height / 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Image.asset(
                                        "assets/images/coinlogo.png",
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "B",
                                      style: GoogleFonts.bebasNeue(
                                          color: textc, fontSize: 48),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'ehind',
                                            style: GoogleFonts.bebasNeue(
                                                color: textc, fontSize: 14)),
                                        TextSpan(
                                          text: "T",
                                          style: GoogleFonts.bebasNeue(
                                              color: textc, fontSize: 48),
                                        ),
                                        TextSpan(
                                            text: 'he ',
                                            style: GoogleFonts.bebasNeue(
                                                color: textc, fontSize: 14)),
                                        TextSpan(
                                          text: "S",
                                          style: GoogleFonts.bebasNeue(
                                              color: textc, fontSize: 48),
                                        ),
                                        TextSpan(
                                            text: 'cenes',
                                            style: GoogleFonts.bebasNeue(
                                                color: textc, fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              255, 120, 116, 116),
                                          blurRadius: 20,
                                          spreadRadius: -2,
                                          offset: Offset(-2, -2),
                                        ),
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 20,
                                          spreadRadius: -2,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: botoncolor,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const BTSRestoProfile()));
                                      },
                                      color: const Color.fromARGB(
                                          255, 252, 248, 248),
                                      icon: const Icon(
                                        Icons.person_outline_sharp,
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dancefloor entry",
                                style: GoogleFonts.bebasNeue(
                                    color: Colors.white, fontSize: 25),
                              ),
                              Switch(
                                value: forAndroid,
                                activeColor: Colors.green,
                                onChanged: (value) async {
                                  // var club =
                                  //     await BTSClubServices.clubopenandclose(
                                  //         context: context);
                                  // print(club['data']['is_club_open']);
                                  // setState(() => forAndroid = club.isNotEmpty
                                  //     ? club['data']['is_club_open']
                                  //     : value);
                                },
                              ),
                            ],
                          ),
                          Center(
                            child: Wrap(
                              runSpacing: height / 54.21,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        ScaleTransitionPageRoute(
                                            child: const Tickets()));
                                  },
                                  child: mycard(
                                      height,
                                      width,
                                      const Color(0XB3D09494),
                                      "Reservations",
                                      const Color(0XFFD09494),
                                      "assets/images/icons/reservation.png"),
                                ),
                                                              SizedBox(width: width/40,),

                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        ScaleTransitionPageRoute(
                                            child: const Events()));
                                  },
                                  child: mycard(
                                      height,
                                      width,
                                      const Color(0XB3A094D0),
                                      "Events",
                                      const Color(0XFFA094D0),
                                      "assets/images/icons/events.png"),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        ScaleTransitionPageRoute(
                                            child: const Promoters()));
                                  },
                                  child: mycard(
                                      height,
                                      width,
                                      const Color(0XB3B2D094),
                                      "Promoters",
                                      const Color(0XFFB2D094),
                                      "assets/images/icons/promoters.png"),
                                ),
                                                             SizedBox(width: width/40,),

                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        ScaleTransitionPageRoute(
                                            child: const Gustlist2()));
                                  },
                                  child: mycard(
                                      height,
                                      width,
                                      const Color(0XB394D0C5),
                                      "Guestlist",
                                      const Color(0XFF94D0C5),
                                      "assets/images/icons/guest-list.png"),
                                ),
                               
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        ScaleTransitionPageRoute(
                                            child: const TablePage()));
                                  },
                                  child: mycard(
                                      height,
                                      width,
                                      const Color.fromARGB(255, 148, 159, 208),
                                      "Tables",
                                      Color.fromARGB(255, 148, 159, 208),
                                      "assets/images/icons/table.png"),
                                ),
                                                          SizedBox(width: width/40,),

                                InkWell(
                                  onTap: () {},
                                  child: mycard(
                                      height,
                                      width,
                                      const Color(0xffD094B8),
                                      "Loyalty",
                                      const Color(0xffD094B8),
                                      "assets/images/icons/loyalty.png"),
                                ),
                               
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const Gustlist2()));
                                  },
                                  child: mycard(
                                      height,
                                      width,
                                      const Color(0XB3D0B194),
                                      "Bar",
                                      const Color(0XFFD0B194),
                                      "assets/images/icons/bar.png"),
                                ),
                                                           SizedBox(width: width/40,),

                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        ScaleTransitionPageRoute(
                                            child: const Walkins()));
                                  },
                                  child: mycard(
                                      height,
                                      width,
                                      const Color(0XB3B2D094),
                                      "Walkins",
                                      const Color(0XFFB2D094),
                                      "assets/images/icons/walkins.png"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Constants.mycircularProgressIndicator()),
            bottomNavigationBar: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/qrscanner');
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: width / 5, right: width / 5, bottom: width / 20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 58,
                    width: 190,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 120, 116, 116),
                          blurRadius: 20,
                          spreadRadius: -2,
                          offset: Offset(-2, -2),
                        ),
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 20,
                          spreadRadius: -2,
                          offset: Offset(2, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: botoncolor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.qr_code_2_outlined,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "SCAN QR CODE",
                          style: GoogleFonts.bebasNeue(
                              color: Colors.white, fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
