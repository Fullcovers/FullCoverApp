import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class TimeButton extends StatelessWidget {
  const TimeButton({
    Key? key,
    required this.time,
    required this.color,
    required this.colortext,
  }) : super(key: key);

  final String time;
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
          color: const Color(0XFF979797),
        ),
        color: color,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Text(
          time,
          style: GoogleFonts.sairaCondensed(
            color: colortext,
            fontSize: height / 43.35,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
