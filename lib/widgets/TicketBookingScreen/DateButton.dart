import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class DateButton extends StatelessWidget {
  const DateButton({
    Key? key,
    required this.date,
    required this.color,
    required this.colortext,
  }) : super(key: key);
  final String date;
  final Color color;
  final Color colortext;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: height / 12,
      width: width / 5,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: Color(0XFF979797),
          ),
          color: color,
          borderRadius: BorderRadius.circular(15.0)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sat",
              style: GoogleFonts.sairaCondensed(
                color: colortext,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              date,
              style: GoogleFonts.sairaCondensed(
                color: colortext,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
