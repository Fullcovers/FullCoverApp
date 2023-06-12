import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Providers/ClubProvider.dart';

import 'package:venq_assessment/Services/Club_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Clubs/ClubDetail.dart';
import 'package:venq_assessment/widgets/BookingScreen/FooterButtons.dart';
import 'package:venq_assessment/widgets/EventsScreen/EventsFooterButtons.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/BottonNavBar.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/TopNavBar.dart';

import '../../Models/Clubs.dart';
import '../../Providers/ClubProvider.dart';
import '../../widgets/ClubsScreen/ClubsFooterButtons.dart';
import '../../widgets/RestaurantsPage/Mycard.dart';

class ClubsScreen extends StatefulWidget {
  const ClubsScreen({Key? key}) : super(key: key);

  @override
  State<ClubsScreen> createState() => _ClubsScreenState();
}

class _ClubsScreenState extends State<ClubsScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Future.delayed(Duration(milliseconds: 500), () {
      ClubServices().getAllClubs(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final clubprovider = Provider.of<ClubProvider>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double overlapFraction = 0.5; // Adjust the overlap fraction as desired
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColorfigma,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topnavigationbar(height, width,false),
            FractionalTranslation(
              translation: const Offset(0, -1),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: Text("Clubs",
                      style: GoogleFonts.bebasNeue(
                        fontSize: width / 10.275,
                        color: Color(0xFFB59F68),
                      )),
                ),
              ),
            ),
            FractionalTranslation(
              translation: const Offset(0, -0.1),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 0.0, left: width / 20.55, right: 20.0),
                child: Container(
                    height: 4.8 * height / 8.4,
                    width: width,
                    decoration: BoxDecoration(color: backgroundColorfigma),
                    child: FutureBuilder<List<ClubModel>>(
                      future: ClubServices().getAllClubs(context: context),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: SizedBox(
                              height: height / 21.675,
                              width: width / 10.275,
                              child: const CircularProgressIndicator(),
                            ),
                          ); // Show a loading indicator while data is being fetched
                        } else if (snapshot.hasError) {
                          return Text(
                              'Error: ${snapshot.error}'); // Show an error message if an error occurred
                        } else {
                          // Data retrieval is successful
                          final clubsData = snapshot.data!;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: width / 1.3,
                              height: height / 1.85,
                              child: ListView.builder(
                                itemCount: 3,
                                itemBuilder: (BuildContext context, int index) {
                                  final ClubModel club = clubsData[index];
                                  return Column(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ClubDetail(
                                                        club: club,
                                                      )),
                                            );
                                          },
                                          child: mycard(height, width, club)),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          );
                          // return ListView.builder(
                          //   itemCount: clubsData.length,
                          //   itemBuilder: (context, index) {
                          //     final ClubModel club = clubsData[index];
                          //     return Padding(
                          //       padding: const EdgeInsets.only(top: 5.0),
                          //       child: Card(
                          //         color: const Color(0xFF2C2F33),
                          //         shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(20.0),
                          //         ),
                          //         child: Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceEvenly,
                          //           children: [
                          //             Container(
                          //               height: height / 10,
                          //               width: 4 * width / 10,
                          //               decoration: const BoxDecoration(
                          //                 color: Color(0xFFD9D9D9),
                          //                 borderRadius: BorderRadius.all(
                          //                     Radius.circular(20.0)),
                          //               ),
                          //               // Display club name
                          //               child: Center(child: Text(club.name)),
                          //             ),
                          //             Container(
                          //               height: height / 10,
                          //               width: 4 * width / 10,
                          //               decoration: const BoxDecoration(
                          //                 color: Color(0xFFD9D9D9),
                          //                 borderRadius: BorderRadius.all(
                          //                     Radius.circular(20.0)),
                          //               ),
                          //               // Display club description
                          //               child: Center(
                          //                   child: Text(club.description)),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // );
                        }
                      },
                    )),
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottomnavbar(height: height, width: width),
      ),
    );
  }
}
