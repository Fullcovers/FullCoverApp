import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/widgets/TicketBookingScreen/DateButton.dart';
import 'package:venq_assessment/widgets/TicketBookingScreen/TicketCount.dart';

class TicketConfirming extends StatelessWidget {
  const TicketConfirming({super.key});

  @override
  Widget build(BuildContext context) {
    bool check = false;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final colorbuttongold = Color(0XFFB59F68);
    final colorbuttonnormal = Color(0xFF2C2F33);
    final colorontap = Colors.black;
    final coloruntap = Color(0XFFB59F68);
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColorfigma,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: height / 40,
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
                      padding: const EdgeInsets.only(top: 0.0, left: 0.0),
                      child: Text(
                        "Pune",
                        style: GoogleFonts.sairaCondensed(
                          color: const Color(0XFFB59F68),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                FractionalTranslation(
                  translation: const Offset(0, 0.5),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 0.0),
                    child: Text(
                      "19:00 Hrs-23.45 Hrs",
                      style: GoogleFonts.sairaCondensed(
                        color: const Color(0XFFFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.location_on_outlined),
                ),
                FractionalTranslation(
                  translation: const Offset(-0.05, 0),
                  child: Text(
                    "Bisht Bhwan Compound, Tallital,Naintal",
                    style: GoogleFonts.sairaCondensed(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFFBCBCBC),
                    ),
                  ),
                ),
              ],
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text(
                    "Select Date",
                    style: GoogleFonts.sairaCondensed(
                      color: const Color(0XFFBABABA),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 20.0),
                  child: Text(
                    "Sat 13 May,2023",
                    style: GoogleFonts.sairaCondensed(
                      color: const Color(0XFFB59F68),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20.0, left: 20.0, bottom: 20.0, top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      check != check;
                    },
                    child: DateButton(
                        date: "13", color: golden, colortext: colorontap),
                  ),
                  DateButton(
                      date: "14",
                      color: colorbuttonnormal,
                      colortext: coloruntap),
                  DateButton(
                      date: "15",
                      color: colorbuttonnormal,
                      colortext: coloruntap),
                  DateButton(
                      date: "16",
                      color: colorbuttonnormal,
                      colortext: coloruntap),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Container(
                height: 3.2 * height / 10,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Color(0xFF2C2F33),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    TicketCount(title: "Stag", price: "999"),
                    TicketCount(title: "Couple", price: "999"),
                    TicketCount(title: "Female", price: "999"),
                  ],
                ),
              ),
            ),
            const FractionalTranslation(
              translation: Offset(0, 10),
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
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Text(
                      "Terms",
                      style: GoogleFonts.sairaCondensed(
                          color: const Color(0XFFF0F0F3),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  FractionalTranslation(
                    translation: const Offset(0, 0.1),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 8.0, top: 20.0),
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
            Flexible(
              child: Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Color(0XFFD9D9D9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                          child: Text(
                            "Total Amount",
                            style: GoogleFonts.sairaCondensed(
                                color: const Color(0XFF222222),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Rs. 2997",
                            style: GoogleFonts.sairaCondensed(
                                color: const Color(0XFF222222),
                                fontSize: 32,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/ticketsending');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Container(
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                              color: const Color(0XFFB59F68),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Center(
                            child: Text(
                              "Proceed",
                              style: GoogleFonts.sairaCondensed(
                                  color: const Color(0XFF222222),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
