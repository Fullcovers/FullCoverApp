import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget bottomnavbar(double height, double width) {
  return Row(
    children: [
      SizedBox(
        width: (width - width / 1.13) / 2,
      ),
      Container(
        height: height / 7.5,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height / 11,
                width: width / 1.13,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.white,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: width / 6,
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.wine_bar_outlined)),
                              Text("Clubs",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 15,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.restaurant)),
                              Text("Restraurants",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 15,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.mic_external_on_outlined)),
                              Text("Events",
                                  style: GoogleFonts.bebasNeue(
                                    fontSize: 15,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: height / 11,
                  width: width / 5,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0xFF2C2F33),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 120, 116, 116),
                            blurRadius: 20,
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
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFF2C2F33),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        color: const Color.fromARGB(255, 252, 248, 248),
                        icon: const Icon(
                          Icons.qr_code_2,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ],
  );
}
