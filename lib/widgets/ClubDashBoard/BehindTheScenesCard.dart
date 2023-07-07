import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget mycard(double height, double width, Color scardcolor, String text,
    Color bordercolor,String image) {
  return Card(
    color: Color(0xFFD9D9D9),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Container(
      height: height / 7,
      width: width / 2.55,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Card(
        //   color: scardcolor,
        //   shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(5),
        //       side: BorderSide(color: bordercolor, width: 2)),
        //   child: Container(
        //     height: height / 28.6,
        //     width: width / 13.555,
        //   ),

        // ),
        Container(height: height / 28.6,
            width: width / 13.555,
            child: Image.asset(image),),
        SizedBox(
          height: height / 41.3,
        ),
        Text(
          text,
          style: GoogleFonts.bebasNeue(fontSize: 28),
        )
      ]),
    ),
  );
}