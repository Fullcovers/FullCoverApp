import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/TopNavBar.dart';

import '../../Models/Events.dart';
import '../../Providers/ClubProvider.dart';

class EventDetail extends StatefulWidget {
  late ClubModel? club;
  late Event event;

  EventDetail({required this.event});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  void initState() {
    final clubprovider = Provider.of<ClubProvider>(context, listen: false);
    widget.club = clubprovider.getClubDetails(widget.event.clubId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double overlapFraction = 0.5;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColorfigma,
        body: Column(
          children: [
            topnavigationbar(height, width),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FractionalTranslation(
                      translation: const Offset(0, -0.2),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 25.0, left: 20, right: 20.0),
                        child: Container(
                          height: height / 5,
                          width: width,
                          decoration: BoxDecoration(
                              color: const Color(0XFFD9D9D9),
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
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
                                  widget.event.name,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat('EE, d MMMM y')
                                      .format(widget.event.date),
                                  style: GoogleFonts.sairaCondensed(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    DateFormat.jm().format(widget.event.date),
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
                          // SizedBox(
                          //   width: width / 6,
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text(
                              "21+",
                              style: GoogleFonts.bebasNeue(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 32,
                                  color: const Color(0XFFB59F68)),
                            ),
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
                                  widget.club!.name,
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
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 20.0),
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
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 5.0),
                              child: Text(
                                widget.event.description,
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
                          translation: const Offset(-0.15, -0.05),
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
                    FractionalTranslation(
                      translation: const Offset(0, 0),
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
                      translation: Offset(0, -10),
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
