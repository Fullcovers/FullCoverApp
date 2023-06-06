import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/BottonNavBar.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/TopNavBar.dart';

import '../../widgets/RestaurantsPage/Mycard.dart';

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double overlapFraction = 0.5;
    
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFF2C2F33),
          body: Column(
            children: [
              topnavigationbar(height, width),
              FractionalTranslation(
                translation: const Offset(0, -0.5),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(
                    child: Text("Restaurants",
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
                          mycard(height, width),
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
          bottomNavigationBar: bottomnavbar(height, width)),
    );
  }
}



