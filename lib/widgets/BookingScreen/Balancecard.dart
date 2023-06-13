// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Styles/Colors.dart';

class Balancecard extends StatelessWidget {
  const Balancecard({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 0.0, left: 20.0, right: 20.0, bottom: 20.0),
      child: Container(
        height: height / 5,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 202, 196, 196),
              blurRadius: 10,
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
          color: Color(0xFF2D3135),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "VIP Membership",
                    style: GoogleFonts.sairaCondensed(
                        color: golden,
                        fontSize: height / 54.1875,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Balance",
                    style: TextStyle(
                        color: Color.fromARGB(255, 121, 118, 109),
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only( left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("\$ 1260.50",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 30,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/coinlogo.png",
                        scale: 13,
                      ),
                       Text(
                        " 1385",
                        style: GoogleFonts.sairaCondensed(
                                      color: golden,
                                      fontSize: height / 30,
                                      fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
