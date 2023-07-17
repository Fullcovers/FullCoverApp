import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Clubs/ClubDetail.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/CustumPageRoute.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/BottonNavBar.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/Mycard.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/TopNavBar.dart';

class Restrobars extends StatefulWidget {
  const Restrobars({super.key});

  @override
  State<Restrobars> createState() => _RestrobarsState();
}

class _RestrobarsState extends State<Restrobars> {  List<ClubModel> clubsData = Constants.allclubs;

  @override
  Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double overlapFraction = 0.5;
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
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    topnavigationbar(
                        height: height, width: width, iscolor: false),
                    FractionalTranslation(
                      translation: const Offset(0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: Text("Restrobars",
                              style: GoogleFonts.bebasNeue(
                                fontSize: width / 10.275,
                                color: Color(0xFFB59F68),
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 0.0, left: width / 20.55, right: 20.0),
                      child: Container(
                          height: 4.8 * height / 6,
                          width: width,
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: ListView.builder(itemCount: 1,
                            // future: ClubServices.getAllClubs(context: context),
                            itemBuilder: (context, snapshot) {
                              // if (snapshot.connectionState ==
                              //     ConnectionState.waiting) {
                              //   return Center(
                              //     child: SizedBox(
                              //       height: height / 21.675,
                              //       width: width / 10.275,
                              //       child: Constants.mycircularProgressIndicator()
                              //     ),
                              //   ); // Show a loading indicator while data is being fetched
                              // } else if (snapshot.hasError) {
                              //   return Text(
                              //       'Error: ${snapshot.error}'); // Show an error message if an error occurred
                              // } else {
                              // Data retrieval is successful
                              // final clubsData = snapshot.data!;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: width / 1.3,
                                  height: height /1.4,
                                  child: ListView.builder(
                                    itemCount: clubsData.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final ClubModel club = clubsData[index];
                                      return Column(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  ScaleTransitionPageRoute(
                                                      child: ClubDetail(
                                                    club: club,
                                                  )),
                                                );
                                              },
                                              child:
                                                  mycard(height, width, club)),
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
                              // }
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ),
            // bottomNavigationBar: bottomnavbar(
            //   height: height,
            //   width: width,
            //   isclub: true,
            //   isevent: false,
            //   initialindex: 0,
            // ),
          ),
        ],
      ),
    );;
  }
}