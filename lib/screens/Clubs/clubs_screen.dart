import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Providers/ClubProvider.dart';

import 'package:venq_assessment/Services/Club_Services.dart';
import 'package:venq_assessment/widgets/BookingScreen/FooterButtons.dart';
import 'package:venq_assessment/widgets/EventsScreen/EventsFooterButtons.dart';

import '../../Models/Clubs.dart';
import '../../Providers/ClubProvider.dart';
import '../../widgets/ClubsScreen/ClubsFooterButtons.dart';

class ClubsScreen extends StatefulWidget {
  const ClubsScreen({Key? key}) : super(key: key);

  @override
  State<ClubsScreen> createState() => _ClubsScreenState();
}

class _ClubsScreenState extends State<ClubsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ClubServices().getAllClubs(context: context);
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
        backgroundColor: const Color(0xFF2C2F33),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height / 10,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: height / 15,
                    width: width / 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF2C2F33),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      color: const Color.fromARGB(255, 252, 248, 248),
                      icon: const Icon(
                        Icons.group_sharp,
                        size: 35,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 3,
                  ),
                  Container(
                    height: height / 15,
                    width: width / 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF2C2F33),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      color: const Color.fromARGB(255, 252, 248, 248),
                      icon: const Icon(
                        Icons.person_outline_sharp,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, -overlapFraction),
              child: FractionalTranslation(
                translation: Offset(0, -overlapFraction),
                child: Container(
                  height: height / 10,
                  width: 3 * width / 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2C2F33),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: height / 19,
                          width: width / 6,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(30.0, 30.0),
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.search,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: height / 19,
                          width: width / 6,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(30.0, 30.0),
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.location_on_outlined,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FractionalTranslation(
              translation: const Offset(0, -1),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: Text("ALL CLUBS",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 30,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            FractionalTranslation(
              translation: const Offset(0, -0.09),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
                child: Container(
                  height: 4.8 * height / 10,
                  width: width,
                  decoration: const BoxDecoration(color: Color(0xFF2C2F33)),
                  child: ListView.builder(
                    itemCount: clubprovider.clubsData.length,
                    itemBuilder: (context, index) {
                      final ClubModel club = clubprovider.clubsData[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Card(
                          color: const Color(0xFF2C2F33),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: height / 10,
                                width: 4 * width / 10,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFD9D9D9),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                                // Display club name
                                child: Center(child: Text(club.name)),
                              ),
                              Container(
                                height: height / 10,
                                width: 4 * width / 10,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFD9D9D9),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                                // Display club description
                                child: Center(child: Text(club.description)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            ClubsFooterButtons(
                width: width,
                colorb: Colors.white,
                textcolor: const Color(0xFF2C2F33)),
          ],
        ),
      ),
    );
  }
}
