import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/BottomButton.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/searchbar.dart';

class LoyaltyPage extends StatelessWidget {
  const LoyaltyPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2C2F33),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: HeaderContent(title: "Loyalty"),
            ),
            SizedBox(
              height: height / 50,
            ),
            Container(
                height: height / 15,
                width: width / 1.15,
                child: SearchBar(
                  searchtext: 'Search People',
                )),
            SizedBox(
              height: height / 50,
            ),
            Column(
              children: [
                mycard(width, height),
                mycard(width, height),
                mycard(width, height),
                mycard(width, height),
                mycard(width, height),
                mycard(width, height),
                mycard(width, height),
                
              ],
            ),
          ],
        ),
        bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: width / 5, right: width / 5, bottom: width / 20),
        child: bottombutton(
          "Add promoter",
          const Icon(
            Icons.add,
            size: 35,
          ),
        ),
      ),
      ),
    );
  }
}

Widget mycard(double width, double height) {
  return Card(
    color: const Color(0xFFD9D9D9),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    child: Padding(
      padding: const EdgeInsets.only(top: 13),
      child: Container(
        height: height / 14.91,
        width: width / 1.191,
        decoration: const BoxDecoration(
          color: Color(0xFFD9D9D9),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width / 31),
                child: Center(
                  child: Text(
                    "Ramesh Babu",
                    style: GoogleFonts.sairaCondensed(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: width / 17.125),
                child: Text("1000",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 28,
                    )),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
