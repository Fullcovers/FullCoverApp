// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterButtons extends StatelessWidget {
  const FooterButtons(
      {Key? key,
      required this.width,
      required this.colorb,
      required this.textcolor})
      : super(key: key);

  final double width;
  final Color colorb;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Container(
              width: 2 * width / 5,
              decoration: BoxDecoration(
                color: colorb,
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(100)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Center(
                    child: Text("CLUBS",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 30,
                          color: textcolor,
                        ))),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Container(
              width: 2 * width / 5,
              decoration: BoxDecoration(
                color: colorb,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Center(
                    child: Text(
                  "EVENTS",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 30,
                    color: textcolor,
                  ),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
