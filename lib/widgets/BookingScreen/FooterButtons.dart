import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterButtons extends StatelessWidget {
  final Color textcolor;
  final Color colorb;
  const FooterButtons(
      {super.key, required this.colorb, required this.textcolor});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 8,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.white))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Container(
              width: 2 * width / 5,
              decoration: BoxDecoration(
                color: colorb,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(100),
                ),
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
          Align(
            alignment: const Alignment(0, -0.5),
            child: FractionalTranslation(
              translation: const Offset(0, -0.5),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: textcolor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 124, 120, 120),
                        blurRadius: 10,
                        spreadRadius: -2,
                        offset: Offset(-2, -2),
                      ),
                      // BoxShadow(
                      //   color: Colors.black,
                      //   blurRadius: 20,
                      //   spreadRadius: -2,
                      //   offset: Offset(2, 2),
                      // ),
                    ],
                  ),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.qr_code_scanner,
                        size: 45,
                        color: colorb,
                      )),
                ),
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
    ;
  }
}
