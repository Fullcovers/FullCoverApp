import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Coins extends StatelessWidget {
  const Coins({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            height: 3 * height / 10,
            width: 8 * width / 10,
            decoration: const BoxDecoration(color: Color(0xFF2C2F33)),
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Card(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      height: height / 20,
                      width: width / 5,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Orillia Coins",
                            style: GoogleFonts.mavenPro(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Text("300",
                              style: GoogleFonts.bebasNeue(
                                fontSize: 32,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Container(
            height: height / 23,
            width: width / 2,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 191, 150, 26),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text("Redeem",
                  style: GoogleFonts.sairaCondensed(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
