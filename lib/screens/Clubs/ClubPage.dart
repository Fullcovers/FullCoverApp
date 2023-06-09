import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/BottonNavBar.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/TopNavBar.dart';

import '../../widgets/RestaurantsPage/Mycard.dart';

class ClubPage extends StatelessWidget {
  const ClubPage({super.key});
  
  get height => null;

  @override
  Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double overlapFraction = 0.5;
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColorfigma,
          body: Column(
            children: [
              topnavigationbar(height, width),
              FractionalTranslation(
                translation: const Offset(0, -0.5),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(
                    child: Text("Clubs",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 40,
                          color: Color(0xFFB59F68),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: width / 1.3,
                  height: height / 1.85,
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          // mycard(height, width),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: bottomnavbar(height:height, width:width)),
    );
  }
}