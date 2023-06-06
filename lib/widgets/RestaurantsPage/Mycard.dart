import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget mycard(double height, double width) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Container(
      width: width / 1.3,
      height: height / 6.2,
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            "assets/images/Restaurants.jpg",
            fit: BoxFit.cover,
            width: width / 1.3,
            height: height / 5.97,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Opacity(
            opacity: 0.5,
            child: Image.asset(
              fit: BoxFit.cover,
              "assets/images/black.png",
              width: width / 1.2,
              height: height / 5.97,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 14, left: 10),
            child: Text("FREQ",
                style: GoogleFonts.bebasNeue(
                  fontSize: 48,
                  color: Colors.white,
                )),
          ),
        )
      ]),
    ),
  );
}
