import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Styles/Colors.dart';

Widget eventcard(double height, double width, String eventname, String date,double fonts) {
  return Card(
    color: backgroundColortransperent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: Color(0xFF9B804A), width: 3)),
    child: Container(
      height: height / 7.677,
      width: width / 1.25,
      child: Row(children: [
        Card(
          color: Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: height / 7,
            width: width / 4.17,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(eventname,
                style:
                    GoogleFonts.bebasNeue(fontSize: 32, color: Colors.white)),
            Text(date,
                style: GoogleFonts.sairaCondensed(
                    fontSize: fonts,
                    color: Colors.white,
                    fontWeight: FontWeight.bold))
          ],
        )
      ]),
    ),
  );
}
