import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Styles/Colors.dart';

class ClubDetailPage2 extends StatelessWidget {
  const ClubDetailPage2({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // print(height);
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColorfigma,
      body: Column(children: [
        SizedBox(
          height: height / 12.042,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: width / 13.258,
                ),
                Text(
                  'FREQ',
                  style: GoogleFonts.bebasNeue(
                      fontWeight: FontWeight.w400,
                      fontSize: 36,
                      color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '19:00 Hrs - 23:45 Hrs',
                  style: GoogleFonts.sairaCondensed(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white),
                ),
                SizedBox(width: 25),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: width / 13.258,
                ),
                Text(
                  'Pune',
                  style: GoogleFonts.sairaCondensed(
                      fontWeight: FontWeight.w600, fontSize: 16, color: golden),
                ),
              ],
            ),

          ],
        ),
        SizedBox(height: 20,),
        Row()
      ]),
    ));
  }
}
