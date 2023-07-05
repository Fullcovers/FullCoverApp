// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Models/Events.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Events/EventDetail3.dart';
import 'package:venq_assessment/widgets/CustumPageRoute.dart';
import 'package:venq_assessment/widgets/TicketBookingScreen/DateButton.dart';

import '../../Models/Ticket.dart';
import '../../Services/Ticket_Services.dart';

class EventDetail2 extends StatefulWidget {
  EventDetail2(
      {super.key,
      required this.event,
      required this.club,
      required this.etickets,
      required this.orderticketscount});
  Event event;
  Map<Ticket, int> orderticketscount;
  ClubModel club;
  List<Ticket> etickets;

  @override
  State<EventDetail2> createState() => _EventDetail2State();
}

class _EventDetail2State extends State<EventDetail2> {
  final promocodecontroller = TextEditingController();
  int stagcount = 0;
  int stagentryprice = 999;
  int couplecount = 0;
  int coupleentrypricce = 999;
  int femalecount = 0;
  int femaleentryprice = 999;
  String stagid = '';
  String coupleid = '';
  String femaleid = '';
  DateTime date = DateTime.now();
  int selected = DateTime.now().day;
  String getDayOfWeek(DateTime date) {
    List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    return daysOfWeek[date.weekday - 1];
  }

  late String todaysdayOfWeek = getDayOfWeek(date);

  late String selectedday = todaysdayOfWeek;

  var cmonth = DateFormat.MMM().format(DateTime.now());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int totalprice = (stagcount * stagentryprice) +
        (femalecount * femaleentryprice) +
        (couplecount * coupleentrypricce);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: eventbackgroundcolor,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height / 40,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height / 43.35, left: width / 20.55),
                      child: Container(width: width/1.6,
                        child: Text(textAlign: TextAlign.left,
                          widget.event.name,
                          style: GoogleFonts.bebasNeue(
                            color: Colors.black,
                            fontSize: height / 23,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width / 20.55),
                      child: Text(
                        widget.club.daddress.city,
                        style: GoogleFonts.sairaCondensed(
                          color: const Color(0XFFB59F68),
                          fontSize: height / 54.1875,
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
                    child: Container(width: width/4,
                      child: Text(textAlign:TextAlign.center,
                        "${widget.club.timings.opensAt != '' ? "${widget.club.timings.opensAt} Hrs" : '19:00 Hrs'} - ${widget.club.timings.closesAt != '' ? "${widget.club.timings.closesAt} Hrs" : "23.45 Hrs"}",
                        style: GoogleFonts.sairaCondensed(
                          color: Colors.black,
                          fontSize: height / 55,
                          fontWeight: FontWeight.w600,
                        ),
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
                  translation: const Offset(0, 0),
                  child: Container(
                    width: width / 1.2,
                    child: Text(
                      textAlign: TextAlign.left,
                      widget.club.address,
                      style: GoogleFonts.sairaCondensed(
                        fontSize: height / 61.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const FractionalTranslation(
              translation: Offset(0, 6),
              child: Divider(
                height: 1,
                color: Color(0XFFB9B9B9),
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
                      color: Colors.black,
                      fontSize: height / 54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 20.0),
                  child: Text(
                    "${selectedday} $selected ${cmonth}, ${date.year}",
                    style: GoogleFonts.sairaCondensed(
                      color: golden,
                      fontSize: height / 54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: width / 13, right: width / 13, top: 10),
              child: SizedBox(
                height: height / 14 * widget.etickets.length +
                    20 * widget.etickets.length,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.etickets.length,
                  itemBuilder: (context, index) {
                    Ticket ticket = widget.etickets[index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height / 14,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: const Color(0XFF979797),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0))),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                ticket.name,
                                style: GoogleFonts.mavenPro(
                                  color: blacktextcolor,
                                  fontSize: height / 43.35,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Rs. ${ticket.current}",
                                style: GoogleFonts.sairaCondensed(
                                  color: blacktextcolor,
                                  fontSize: height / 43.35,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                height: 32,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0XFFB59F68),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: FractionalTranslation(
                                        translation: const Offset(0, 0.05),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              widget.orderticketscount[ticket] =
                                                  widget.orderticketscount[
                                                          ticket]! -
                                                      1;
                                              // promocodeloded=false;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            size: width / 25,
                                          ),
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        height: height / 27,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              width: 2,
                                              style: BorderStyle.solid,
                                            ),
                                            left: BorderSide(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              width: 2,
                                              style: BorderStyle.solid,
                                            ),
                                            right: BorderSide(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              width: 2,
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            widget.orderticketscount[ticket]
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: FractionalTranslation(
                                        translation: const Offset(0, 0.05),
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                widget.orderticketscount[
                                                        ticket] =
                                                    widget.orderticketscount[
                                                            ticket]! +
                                                        1;
                                              });
                                            },
                                            icon: const Icon(Icons.add),
                                            color: Colors.black,
                                            iconSize: width / 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const FractionalTranslation(
              translation: Offset(0, 10),
              child: Divider(
                height: 1,
                color: Color(0XFFB9B9B9),
                thickness: 1,
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: width / 13, right: width / 13),
            //   child: SizedBox(
            //     height: height / 20,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           "Promoters",
            //           style: GoogleFonts.sairaCondensed(
            //               fontSize: 25, color: Colors.black),
            //         ),
            //         const SizedBox(width: 10),
            //         Container(
            //           height: 180,
            //           width: 180,
            //           decoration: BoxDecoration(
            //               border: Border.all(
            //                 color: Colors.black,
            //               ),
            //               borderRadius: BorderRadius.circular(10.0)),
            //           child: Padding(
            //             padding: const EdgeInsets.only(top: 13),
            //             child: Center(
            //               child: TextFormField(
            //                 controller: promocodecontroller,
            //                 style: GoogleFonts.sairaCondensed(
            //                   color: Colors.black,
            //                   fontSize: 20,
            //                 ),
            //                 keyboardType: TextInputType.text,
            //                 decoration: InputDecoration(
            //                   hintText: 'PROMOCODE',
            //                   hintStyle: GoogleFonts.sairaCondensed(
            //                     color: const Color.fromARGB(255, 14, 13, 13),
            //                   ),
            //                   border: InputBorder.none,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // const FractionalTranslation(
            //   translation: Offset(0, 10),
            //   child: Divider(
            //     height: 1,
            //     color: Color(0XFFB9B9B9),
            //     thickness: 1,
            //   ),
            // ),
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
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  FractionalTranslation(
                    translation: const Offset(0, 0.1),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 8.0),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: Colors.black,
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
                color: Color(0XFFB9B9B9),
                thickness: 1,
              ),
            ),
            Flexible(
              child: Container(
                height: height / 10,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: backgroundColorfigma,
                  borderRadius: const BorderRadius.only(
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
                          padding: const EdgeInsets.only(top: 8, left: 20.0),
                          child: Text(
                            "Total Amount",
                            style: GoogleFonts.sairaCondensed(
                                color: const Color(0xFFE0E0E0),
                                fontSize: width / 25.6875,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            ((stagcount * stagentryprice) +
                                    (femalecount * femaleentryprice) +
                                    (couplecount * coupleentrypricce))
                                .toString(),
                            style: GoogleFonts.sairaCondensed(
                                color: const Color(0xFFE0E0E0),
                                fontSize: width / 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            SlideTransitionPageRoute(direction: "up",
                                child:EventDetail3(
                                      club: widget.club,
                                      date: selected,
                                      weekday: selectedday,
                                      year: date.year,
                                      month: cmonth,
                                      femalecount: femalecount,
                                      femaleentryprice: femaleentryprice,
                                      stagcount: stagcount,
                                      stagentryprice: stagentryprice,
                                      couplecount: couplecount,
                                      coupleentrypricce: coupleentrypricce,
                                      totalprice: totalprice,
                                      event: widget.event,
                                      stagid: stagid,
                                      coupleid: coupleid,
                                      femaleid: femaleid,
                                      promocode: promocodecontroller.text,
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Container(
                          height: height / 24.77142857142857,
                          width: width / 2.74,
                          decoration: BoxDecoration(
                              color: const Color(0XFFB59F68),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Center(
                            child: Text(
                              "Proceed",
                              style: GoogleFonts.sairaCondensed(
                                  color: const Color(0XFF222222),
                                  fontSize: width / 20.55,
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

  String getCountByTicketName(String name) {
    if (name.toLowerCase() == "stag" || name.toLowerCase() == "Stag") {
      return stagcount.toString();
    } else if (name.toLowerCase() == "couple" ||
        name.toLowerCase() == "Couple") {
      return couplecount.toString();
    } else {
      return femalecount.toString();
    }
  }
}
