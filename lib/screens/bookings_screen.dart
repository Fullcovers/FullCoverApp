import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:venq_assessment/widgets/BookingScreen/FooterButtons.dart';

import 'package:venq_assessment/widgets/BookingScreen/NewBookings.dart';

import '../widgets/BookingScreen/Balancecard.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/BookingScreen/BookingsFooterButtons.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2C2F33),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: height / 10,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    // color: Colors.white,
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 50,
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
                            Icons.group_sharp,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 50,
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
                            Icons.person_outline_sharp,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Balancecard(height: height),
            SizedBox(
              height: height / 50,
            ),
            Flexible(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) => SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 2),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
                child: check
                    ? Flexible(
                        key: UniqueKey(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0)),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Center(
                                        child: Text(
                                          "MY BOOKINGS",
                                          style: GoogleFonts.bebasNeue(
                                              fontSize: 35),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Container(
                                        height: 90,
                                        width: 100,
                                        decoration: const ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20.0),
                                            ),
                                          ),
                                          color: Color(0xFF2C2F33),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            height: 10,
                                            width: 5,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25.0)),
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  check = !check;
                                                });
                                              },
                                              icon: const Icon(
                                                CryptoFontIcons.BTC,
                                                size: 50,
                                                color: Color.fromARGB(
                                                    255, 191, 150, 26),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Flexible(child: NewBookings()),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Flexible(
                        key: UniqueKey(),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                height: 3 * height / 10,
                                width: 8 * width / 10,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF2C2F33)),
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Card(
                                        color: const Color(0xFFD9D9D9),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
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
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                height: height / 23,
                                width: width / 2,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 191, 150, 26),
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
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Container(
                                  width: double.maxFinite,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20.0))),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 90,
                                            color: Colors.white,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 30),
                                                  child: Center(
                                                    child: Text(
                                                      "MY BOOKINGS",
                                                      style:
                                                          GoogleFonts.bebasNeue(
                                                              fontSize: 35),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0),
                                                  child: Container(
                                                    height: 90,
                                                    width: 90,
                                                    decoration:
                                                        const ShapeDecoration(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                        ),
                                                      ),
                                                      color: Color(0xFF2C2F33),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Container(
                                                        height: 10,
                                                        width: 5,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          25.0)),
                                                        ),
                                                        child: IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              check = !check;
                                                            });
                                                          },
                                                          icon: const Icon(
                                                            CryptoFontIcons.BTC,
                                                            size: 50,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    191,
                                                                    150,
                                                                    26),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment: const Alignment(0, 1),
                                            child: FractionalTranslation(
                                              translation: const Offset(0, 1.1),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 0.0),
                                                child: Container(
                                                  height: 60,
                                                  width: 60,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xFFFBFBFB),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(25),
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.white,
                                                        blurRadius: 10,
                                                        spreadRadius: -2,
                                                        offset: Offset(-2, -2),
                                                      ),
                                                      BoxShadow(
                                                        color: Colors.black,
                                                        blurRadius: 5,
                                                        spreadRadius: -2,
                                                        offset: Offset(2, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  child: IconButton(
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.qr_code_scanner,
                                                        size: 45,
                                                      )),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      BookingsFooterButtons(
                                        width: width,
                                        colorb: const Color(0xFF2C2F33),
                                        textcolor: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
