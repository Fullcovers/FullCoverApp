import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Services/BTS_Services/Club_Services.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Events/Event.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Profile/Profile.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Promoters/Promoters.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Tables/Tables.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Tickets/Tickets.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Walkins/Walkins.dart';
import 'package:venq_assessment/screens/QrScanner/QrScanner.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/BehindTheScenesCard.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/BottomButton.dart';

class BehindTheScenesPage extends StatefulWidget {
  const BehindTheScenesPage({super.key});

  @override
  State<BehindTheScenesPage> createState() => _BehindTheScenesPageState();
}

class _BehindTheScenesPageState extends State<BehindTheScenesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  load() async {
    await BTSClubServices.btsgetSingleClub(context: context);
  }

  Color textc = const Color(0xFFB59F68);
  bool forAndroid = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF2C2F33),
        body: SingleChildScrollView(
          child: Column(
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
                          style:
                              GoogleFonts.bebasNeue(color: textc, fontSize: 48),
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
                        decoration: const BoxDecoration(
                          boxShadow: [
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
                          color: Color(0xFF2C2F33),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BTSProfile()));
                          },
                          color: const Color.fromARGB(255, 252, 248, 248),
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
              Switch(
                value: forAndroid,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() => forAndroid = value);
                },
              ),
              Wrap(
                runSpacing: height / 54.21,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Tickets()));
                    },
                    child: mycard(height, width, const Color(0XB3D09494),
                        "Reservations", const Color(0XFFD09494)),
                  ),
                  SizedBox(
                    width: width / 19.57,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Events()));
                    },
                    child: mycard(height, width, const Color(0XB3A094D0),
                        "Events", const Color(0XFFA094D0)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Promoters()));
                    },
                    child: mycard(height, width, const Color(0XB3B2D094),
                        "Promoters", const Color(0XFFB2D094)),
                  ),
                  SizedBox(
                    width: width / 19.57,
                  ),
                  mycard(height, width, const Color(0XB394D0C5), "Guestlist",
                      const Color(0XFF94D0C5)),
                  SizedBox(
                    width: width / 19.57,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Walkins()));
                    },
                    child: mycard(height, width, const Color(0XB3B2D094),
                        "Walkins", const Color(0XFFB2D094)),
                  ),
                  SizedBox(
                    width: width / 19.57,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TablePage()));
                    },
                    child: mycard(
                        height,
                        width,
                        const Color.fromARGB(255, 148, 159, 208),
                        "Tables",
                        Color.fromARGB(255, 148, 159, 208)),
                  ),
                ],
              ),
            ],
          ),
        ),
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
                decoration: const BoxDecoration(
                  boxShadow: [
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
                  color: Color(0xFF2C2F33),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      color: const Color.fromARGB(255, 252, 248, 248),
                      icon: const Icon(
                        Icons.qr_code_2_outlined,
                        size: 35,
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
    );
  }
}
