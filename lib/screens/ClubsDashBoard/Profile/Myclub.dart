import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Services/BTS_Services/Club_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';

class MyClub extends StatefulWidget {
  const MyClub({super.key});

  @override
  State<MyClub> createState() => _MyClubState();
}

class _MyClubState extends State<MyClub> {
  late ClubModel? club;
  bool isloded = false;
  loadclub() async {
    club = await BTSClubServices.btsgetSingleClub(context: context);
    setState(() {
      print("object");
      isloded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadclub();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColorfigma,
      body: isloded
          ? Column(
              children: [
                HeaderContent(title: "My Club"),
                Container(
                              width: width,
                              height: height / 5,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                color: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        club!.name,
                                        style: GoogleFonts.bebasNeue(
                                            fontSize: 30, color: golden),
                                      ),
                                      SizedBox(
                                        height: height / 40,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Club Address",
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                        fontSize: 15,
                                                        color: golden),
                                              ),
                                              Text(
                                                "Club Open At",
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                        fontSize: 15,
                                                        color: golden),
                                              ),
                                              Text(
                                                "Club Close At",
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                        fontSize: 15,
                                                        color: golden),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(width: width/1.7,
                                                child: Text(textAlign: TextAlign.left,
                                                  club!.address
                                                      ,
                                                  style:
                                                      GoogleFonts.sairaCondensed(
                                                          fontSize: 15,
                                                          color: golden),
                                                ),
                                              ),
                                              Text(
                                                club!.timings.opensAt.toString()
                                                    ,
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                        fontSize: 15,
                                                        color: golden),
                                              ),
                                              Text(
                                                club!.timings.closesAt.toString(),
                                                   
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                        fontSize: 15,
                                                        color: golden),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
              ],
            )
          : CircularProgressIndicator(),
    ));
  }
}
