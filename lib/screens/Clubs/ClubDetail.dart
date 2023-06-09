import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Styles/Colors.dart';

class ClubDetail extends StatelessWidget {
  ClubDetail({super.key, required this.club});
  final ClubModel club;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColorfigma,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25.0, left: 20, right: 20.0),
            child: Container(
              height: height / 5,
              width: width,
              decoration: BoxDecoration(
                  color: Color(0XFFD9D9D9),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Text(
              "FREQ",
              style: GoogleFonts.bebasNeue(
                color: const Color(0XFFF0F0F3),
                fontSize: 36,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0, left: 20.0),
            child: Text(
              "Pune",
              style: GoogleFonts.sairaCondensed(
                color: const Color(0XFFB59F68),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const FractionalTranslation(
            translation: Offset(0, 6),
            child: Divider(
              height: 1,
              color: Color(0XFF444444),
              thickness: 1,
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                    child: Text(
                      "Tuesday - Sunday",
                      style: GoogleFonts.sairaCondensed(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 0.0),
                    child: Text(
                      "19:00 Hrs-23.45 Hrs",
                      style: GoogleFonts.sairaCondensed(
                        color: const Color(0XFFA7A7A7),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 12.0),
                child: Container(
                  width: 0.5, // Set the width of the divider
                  height: 70, // Set the height of the divider
                  color: Colors.white, // Set the color of the divider
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20), // Set horizontal margin
                ),
              ),
              // SizedBox(
              //   width: width / 5,
              // ),
              FractionalTranslation(
                translation: const Offset(-0.1, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Text(
                        "Dress Code",
                        style: GoogleFonts.sairaCondensed(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 0.0),
                      child: Text(
                        "Casual, Smart Casual",
                        style: GoogleFonts.sairaCondensed(
                          color: const Color(0XFFF0F0F3),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const FractionalTranslation(
            translation: Offset(0, 9),
            child: Divider(
              height: 1,
              color: Color(0XFF444444),
              thickness: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Text(
                      "About",
                      style: GoogleFonts.sairaCondensed(
                        color: const Color(0XFFA7A7A7),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                    child: Text(
                      "An Exclusive Audio-Visual performance by Psykovsky & friends",
                      style: GoogleFonts.sairaCondensed(
                        color: const Color(0XFFF0F0F3),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              FractionalTranslation(
                translation: const Offset(-0.10, -0.05),
                child: Padding(
                  padding: const EdgeInsets.only(right: 0.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Color(0XFFF0F0F3),
                      )),
                ),
              ),
            ],
          ),
          const FractionalTranslation(
            translation: Offset(0, 9),
            child: Divider(
              height: 1,
              color: Color(0XFF444444),
              thickness: 1,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14.0, left: 20.0),
                child: Text(
                  "Take me there",
                  style: GoogleFonts.sairaCondensed(
                      color: const Color(0XFFA7A7A7),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              FractionalTranslation(
                translation: const Offset(0, -0.14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "FREQ",
                        style: GoogleFonts.bebasNeue(
                          color: const Color(0XFFB59F68),
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            color: const Color(0XFFD9D9D9),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.location_on_outlined,
                              size: 40,
                            )),
                      ),
                    )
                  ],
                ),
              ),
              FractionalTranslation(
                translation: Offset(0, -0.55),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.location_on_outlined),
                    ),
                    FractionalTranslation(
                      translation: const Offset(-0.1, 0),
                      child: Text(
                        "Address Lorem ipsum",
                        style: GoogleFonts.sairaCondensed(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0XFFF0F0F3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const FractionalTranslation(
            translation: Offset(0, -24),
            child: Divider(
              height: 1,
              color: Color(0XFF444444),
              thickness: 1,
            ),
          ),
          FractionalTranslation(
            translation: const Offset(0, -0.35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Facilites",
                    style: GoogleFonts.sairaCondensed(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Container(
                          height: 2.5 * height / 100,
                          width: 2 * width / 10,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2C2F33),
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: const Center(
                              child: Text(
                            "Techno",
                            style: TextStyle(
                              color: Color(0XFFCBC1A8),
                            ),
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Container(
                          height: 2.5 * height / 100,
                          width: 2 * width / 10,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2C2F33),
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: const Center(
                              child: Text(
                            "Techno",
                            style: TextStyle(
                              color: Color(0XFFCBC1A8),
                            ),
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Container(
                          height: 2.5 * height / 100,
                          width: 2 * width / 10,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2C2F33),
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: const Center(
                              child: Text(
                            "Techno",
                            style: TextStyle(
                              color: Color(0XFFCBC1A8),
                            ),
                          )),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Container(
                          height: 2.5 * height / 100,
                          width: 2 * width / 10,
                          decoration: BoxDecoration(
                            color: const Color(0xFF2C2F33),
                            border: Border.all(
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: const Center(
                              child: Text(
                            "Techno",
                            style: TextStyle(
                              color: Color(0XFFCBC1A8),
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const FractionalTranslation(
            translation: Offset(0, -5),
            child: Divider(
              height: 1,
              color: Color(0XFF444444),
              thickness: 1,
            ),
          ),
          FractionalTranslation(
            translation: const Offset(0, -0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Terms",
                    style: GoogleFonts.sairaCondensed(
                        color: const Color(0XFFF0F0F3),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Color(0XFFF0F0F3),
                      )),
                ),
              ],
            ),
          ),
          const FractionalTranslation(
            translation: Offset(0, -15),
            child: Divider(
              height: 1,
              color: Color(0XFF444444),
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Center(
              child: Container(
                height: height / 15,
                width: width,
                decoration: BoxDecoration(
                    color: Color(0XFF3D4348),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                    border: Border.all(
                      color: Colors.white,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Starts at Rs.999",
                        style: GoogleFonts.sairaCondensed(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: Color(0XFFF0F0F3)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Container(
                        height: height / 28,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0XFFD9D9D9)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
