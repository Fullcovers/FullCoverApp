import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Clubs/ClubPage2.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 20, right: 20.0),
              child: Container(
                height: height / 5,
                width: width,
                decoration: BoxDecoration(
                    color: const Color(0XFFD9D9D9),
                    borderRadius: BorderRadius.circular(20.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: club.carouselImages.isNotEmpty
                      ? Image.network(
                          club.carouselImages[1].imageUrl,
                          fit: BoxFit.cover,
                          width: width / 1.1,
                          height: height / 5.97,
                        )
                      : Image.asset(
                          "assets/images/Restaurants.jpg",
                          fit: BoxFit.cover,
                          width: width / 1.1,
                          height: height / 5.97,
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                club.name,
                style: GoogleFonts.bebasNeue(
                  color: const Color(0XFFF0F0F3),
                  fontSize: width / 11.41666666666667,
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
                  fontSize: width / 25.6875,
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
                      padding: EdgeInsets.only(
                          left: width / 20.55, top: width / 41.10),
                      child: Text(
                        "${club.daysOpen.from != '' ? club.daysOpen.from : "Tuesday"} - ${club.daysOpen.till != '' ? club.daysOpen.till : "Sunday"}",
                        style: GoogleFonts.sairaCondensed(
                          color: Colors.white,
                          fontSize: width / 20.55,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width / 20.55, top: 0.0),
                      child: Text(
                        "${club.timings.opensAt != '' ? "${club.timings.opensAt} Hrs" : '19:00 Hrs'} - ${club.timings.closesAt != '' ? "${club.timings.closesAt} Hrs" : "23.45 Hrs"}",
                        style: GoogleFonts.sairaCondensed(
                          color: const Color(0XFFA7A7A7),
                          fontSize: width / 29.35714285714286,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 20.55, top: 12.0),
                  child: Container(
                    width: 0.5,
                    height: height / 12.38571428571429,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
                FractionalTranslation(
                  translation: const Offset(-0.1, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 20.55, top: height / 43.35),
                        child: Text(
                          "Dress Code",
                          style: GoogleFonts.sairaCondensed(
                            color: Colors.white,
                            fontSize: width / 27.4,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width / 20.55, top: 0.0),
                        child: Text(
                          "Casual, Smart Casual",
                          style: GoogleFonts.sairaCondensed(
                            color: const Color(0XFFF0F0F3),
                            fontSize: width / 20.55,
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
                      padding: EdgeInsets.only(
                          left: width / 20.55, top: width / 20.55),
                      child: Text(
                        "About",
                        style: GoogleFonts.sairaCondensed(
                          color: const Color(0XFFA7A7A7),
                          fontSize: width / 29.35714285714286,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width / 20.55, top: 5.0),
                      child: Text(
                        club.description,
                        style: GoogleFonts.sairaCondensed(
                          color: const Color(0XFFF0F0F3),
                          fontSize: width / 29.35714285714286,
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
                        fontSize: width / 29.35714285714286,
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
                          club.name,
                          style: GoogleFonts.bebasNeue(
                            color: const Color(0XFFB59F68),
                            fontSize: width / 12.84375,
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
                  translation: const Offset(0, -0.55),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.location_on_outlined),
                      ),
                      FractionalTranslation(
                        translation: const Offset(-0.01, 0),
                        child: Text(
                          club.address,
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
                        fontSize: width / 29.35714285714286,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: width / 20.55, top: 5.0),
                      child: Row(
                        children: club.facilities.isNotEmpty
                            ? club.facilities.map((facility) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, right: 10),
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
                                    child: Center(
                                      child: Text(
                                        facility,
                                        style: TextStyle(
                                          fontSize: width / 40,
                                          color: const Color(0XFFCBC1A8),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList()
                            : [
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
                                    child: Center(
                                      child: Text(
                                        "Techno",
                                        style: TextStyle(
                                          fontSize: width / 40,
                                          color: const Color(0XFFCBC1A8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
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
                                    child: Center(
                                      child: Text(
                                        "Techno",
                                        style: TextStyle(
                                          fontSize: width / 40,
                                          color: const Color(0XFFCBC1A8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
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
                                    child: Center(
                                      child: Text(
                                        "Techno",
                                        style: TextStyle(
                                          fontSize: width / 40,
                                          color: const Color(0XFFCBC1A8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
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
                                    child: Center(
                                      child: Text(
                                        "Techno",
                                        style: TextStyle(
                                          fontSize: width / 40,
                                          color: const Color(0XFFCBC1A8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                      )),
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
              translation: const Offset(0, -0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 20.55, top: width / 20.55),
                        child: Text(
                          "Terms",
                          style: GoogleFonts.sairaCondensed(
                            color: const Color(0XFFA7A7A7),
                            fontSize: width / 29.35714285714286,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width / 20.55, top: 5.0),
                        child: Text(
                          club.termsAndCondition != ''
                              ? club.termsAndCondition
                              : '',
                          style: GoogleFonts.sairaCondensed(
                            color: const Color(0XFFF0F0F3),
                            fontSize: width / 29.35714285714286,
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
            ),
            const FractionalTranslation(
              translation: Offset(0, -15),
              child: Divider(
                height: 1,
                color: Color(0XFF444444),
                thickness: 1,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => ClubsPage2(
                            club: club,
                          )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Center(
                  child: Container(
                    height: height / 15,
                    width: width,
                    decoration: BoxDecoration(
                        color: const Color(0XFF3D4348),
                        borderRadius: const BorderRadius.all(
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
                                color: const Color(0XFFF0F0F3)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Container(
                            height: height / 28,
                            width: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0XFFD9D9D9)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
