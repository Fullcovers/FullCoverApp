import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailedEvent extends StatelessWidget {
  const DetailedEvent({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double overlapFraction = 0.5;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2C2F33),
        body: Column(
          children: [
            Container(
              height: height / 10,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Color(0XFFF0F0F3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: height / 15,
                    width: width / 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF2C2F33),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      color: const Color.fromARGB(255, 252, 248, 248),
                      icon: const Icon(
                        Icons.group_sharp,
                        size: 35,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 3,
                  ),
                  Container(
                    height: height / 15,
                    width: width / 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF2C2F33),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      color: const Color.fromARGB(255, 252, 248, 248),
                      icon: const Icon(
                        Icons.person_outline_sharp,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, -overlapFraction),
              child: FractionalTranslation(
                translation: Offset(0, -overlapFraction),
                child: Container(
                  height: height / 11,
                  width: 3 * width / 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2C2F33),
                    // color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: height / 19,
                          width: width / 6,
                          decoration: const BoxDecoration(
                            color: Color(0XFFF0F0F3),
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(30.0, 30.0),
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.search,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: height / 19,
                          width: width / 6,
                          decoration: const BoxDecoration(
                            color: Color(0XFFF0F0F3),
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(30.0, 30.0),
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.location_on_outlined,
                              size: 30,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FractionalTranslation(
              translation: const Offset(0, -0.2),
              child: Container(
                height: 2.18 * height / 10,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Color(0XFFD9D9D9),
                ),
                margin: EdgeInsets.zero,
              ),
            ),
            FractionalTranslation(
              translation: const Offset(0, -0.3),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PSYTRANCE PARTY",
                          style: GoogleFonts.bebasNeue(
                              color: Colors.white, fontSize: 35),
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
                                Radius.circular(20.0),
                              ),
                            ),
                            child: const Center(
                                child: Text(
                              "Techno",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              color: Color(0XFF444444),
              thickness: 1,
            ),
            FractionalTranslation(
              translation: const Offset(0, 0.13),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sun 28 May,2023 - Mon 29 May",
                          style: GoogleFonts.sairaCondensed(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            "19:00 Hrs Onwards",
                            style: GoogleFonts.sairaCondensed(
                              color: const Color(0XFFA7A7A7),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width / 6,
                  ),
                  Text(
                    "21+",
                    style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w400,
                        fontSize: 32,
                        color: const Color(0XFFB59F68)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              height: 1,
              color: Color(0XFF444444),
              thickness: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 20.0),
                  child: Text(
                    "Hosted by",
                    style: GoogleFonts.sairaCondensed(
                        color: const Color(0XFFA7A7A7),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
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
              translation: Offset(0, -25),
              child: Divider(
                height: 1,
                color: Color(0XFF444444),
                thickness: 1,
              ),
            ),
            FractionalTranslation(
              translation: const Offset(0, -0.3),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Line Up",
                          style: GoogleFonts.sairaCondensed(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const FractionalTranslation(
              translation: Offset(0, -0.1),
              child: Divider(
                height: 1,
                color: Color(0XFF444444),
                thickness: 1,
              ),
            ),
            SizedBox(
              height: height / 20,
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
      ),
    );
  }
}
