import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';

class CoinsScreen extends StatelessWidget {
  const CoinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColorfigma,
      body: Column(children: [
        HeaderContent(title: "Coins"),
        Padding(
          padding: EdgeInsets.only(
            top: height / 20,
            left: width / 10,
            right: width / 10,
          ),
          child: Container(
            width: width - width / 5,
            height: height / 10,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total cover coins earned",
                        style: GoogleFonts.sairaCondensed(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: offwhite),
                      ),
                      Text(
                        "INR 300",
                        style: GoogleFonts.sairaCondensed(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: offwhite),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/coinlogo.png",
                          scale: 7,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: width / 10, top: 15),
            child: Row(
              children: [
                Container(
                  width: (width - width / 4),
                  height: height / 15,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/coinlogo.png",
                          scale: 15,
                        ),
                        Text(
                          "Orila Coin",
                          style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: offwhite),
                        ),
                        Text(
                          "400",
                          style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: offwhite),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: width / 10, top: 15),
            child: Row(
              children: [
                Container(
                  width: (width - width / 4) ,
                  height: height / 15,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/coinlogo.png",
                          scale: 15,
                        ),
                        Text(
                          "Barrel & Co Coin",
                          style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: offwhite),
                        ),
                        Text(
                          "400",
                          style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: offwhite),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ]),
    ));
  }
}
