import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// import 'package:jiffy/jiffy.dart';

import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Services/Ticket_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Clubs/ClubPage3.dart';
import 'package:venq_assessment/widgets/TicketBookingScreen/DateButton.dart';
import 'package:venq_assessment/widgets/TicketBookingScreen/TicketCount.dart';

import '../../Models/Ticket.dart';
import '../../widgets/TicketBookingScreen/TimeButton.dart';

class ClubsPage2 extends StatefulWidget {
  const ClubsPage2({super.key, required this.club});
  final ClubModel club;

  @override
  State<ClubsPage2> createState() => _ClubsPage2State();
}

class _ClubsPage2State extends State<ClubsPage2> {
  var colorbuttonnormal = golden;
  var colorbuttonnormal1 = backgroundColorfigma;
  var colorbuttonnormal2 = backgroundColorfigma;
  var colorbuttonnormal3 = backgroundColorfigma;
  var colorbuttonnormal4 = backgroundColorfigma;
  var colorbuttonnormal5 = backgroundColorfigma;
  var colorbuttonnormal6 = backgroundColorfigma;

  var coloruntap = Colors.white;
  var coloruntap1 = Colors.white;
  var coloruntap2 = Colors.white;
  var coloruntap3 = Colors.white;
  var coloruntap4 = Colors.white;
  var coloruntap5 = Colors.white;
  var coloruntap6 = Colors.white;

  @override
  void initState() {
    TicketServices().getClubsTickets(context: context, clubId: widget.club.id);
    super.initState();
  }

  int stagcount = 0;
  int stagentryprice = 999;
  int couplecount = 0;
  int coupleentrypricce = 999;
  int femalecount = 0;
  int femaleentryprice = 999;
  int outsidecount = 0;
  int outsideprice = 9999;
  int insidecount = 0;
  int insideprice = 9999;
  String outsideid = '';
  String insideid = '';
  String stagid = '';
  String coupleid = '';
  String femaleid = '';
  int count = 0;
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
  late String tomorrowsdayOfWeek = getDayOfWeek(tomorrow);
  late String dayaftertommorowsdayOfWeek = getDayOfWeek(dayaftertommorow);
  late String twodayaftertommorowsdayOfWeek = getDayOfWeek(twodayaftertommorow);
  late String threetomorrowsdayOfWeek = getDayOfWeek(threedayaftertommorow);
  late String fourdayaftertommorowsdayOfWeek =
      getDayOfWeek(fourdayaftertommorow);
  late String fivedayaftertommorowsdayOfWeek =
      getDayOfWeek(fivedayaftertommorow);

  DateTime tomorrow = DateTime.now().add(Duration(days: 1));
  DateTime dayaftertommorow = DateTime.now().add(Duration(days: 2));
  DateTime twodayaftertommorow = DateTime.now().add(Duration(days: 3));
  DateTime threedayaftertommorow = DateTime.now().add(Duration(days: 4));
  DateTime fourdayaftertommorow = DateTime.now().add(Duration(days: 5));
  DateTime fivedayaftertommorow = DateTime.now().add(Duration(days: 6));
  late String selectedday = todaysdayOfWeek;
  final promocodecontroller = TextEditingController();
  bool booktable = false;
  DateTime startTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 10);
  int selectedTimeIndex = 0;

  List<DateTime> generateTimeSlots() {
    List<DateTime> timeSlots = [];
    DateTime currentTime = startTime;

    for (int i = 0; i < 7; i++) {
      timeSlots.add(currentTime);
      currentTime = currentTime.add(const Duration(hours: 1));
    }

    return timeSlots;
  }

  late List<DateTime> timeSlots;
  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    var cmonth = DateFormat.MMM().format(DateTime.now());
    int totalprice = (stagcount * stagentryprice) +
        (femalecount * femaleentryprice) +
        (couplecount * coupleentrypricce);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColorfigma,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(mainAxisAlignment:MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height / 40,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, left: width / 20.55),
                      child: Text(
                        widget.club.name,
                        style: GoogleFonts.bebasNeue(
                          color: const Color(0XFFF0F0F3),
                          fontSize: height / 23,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Align(
                      child: Padding(
                        padding:  EdgeInsets.only(top: 0.0, left: width / 20.55),
                        child: Text(
                          "Pune",
                          style: GoogleFonts.sairaCondensed(
                            color: const Color(0XFFB59F68),
                            fontSize: height / 54.1875,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                FractionalTranslation(
                  translation: const Offset(0, 0.5),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 16.0),
                    child: Text(
                      "${widget.club.timings.opensAt != '' ? "${widget.club.timings.opensAt} Hrs" : '19:00 Hrs'} - ${widget.club.timings.closesAt != '' ? "${widget.club.timings.closesAt} Hrs" : "23.45 Hrs"}",
                      style: GoogleFonts.sairaCondensed(
                        color: const Color(0XFFFFFFFF),
                        fontSize: height / 70,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FractionalTranslation(
                    translation: const Offset(-0.05, 0),
                    child: SizedBox(
                      width: width / 1.2,
                      child: Text(
                        textAlign: TextAlign.left,
                        widget.club.address,
                        style: GoogleFonts.sairaCondensed(
                          fontSize: height / 61.5,
                          fontWeight: FontWeight.w600,
                          color: const Color(0XFFBCBCBC),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const FractionalTranslation(
              translation: Offset(0, -3),
              child: Divider(
                height: 1,
                color: Color(0XFF444444),
                thickness: 1,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0, left: 20.0),
                      child: Text(
                        "Select Date",
                        style: GoogleFonts.sairaCondensed(
                          color: const Color(0XFFBABABA),
                          fontSize: height / 54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0, right: 20.0),
                      child: Text(
                        "$selectedday $selected $cmonth, ${date.year}",
                        style: GoogleFonts.sairaCondensed(
                          color: const Color(0XFFB59F68),
                          fontSize: height / 54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: width / 20.55,
                      left: width / 20.55,
                      bottom: 8,
                      top: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selected = date.day;

                                colorbuttonnormal = colorbuttonnormal == golden
                                    ? backgroundColorfigma
                                    : golden;
                                coloruntap = colorbuttonnormal == golden
                                    ? Colors.black
                                    : Colors.white;
                                colorbuttonnormal1 = colorbuttonnormal2 =
                                    colorbuttonnormal3 = colorbuttonnormal4 =
                                        colorbuttonnormal5 =
                                            colorbuttonnormal6 =
                                                backgroundColorfigma;
                                coloruntap1 = coloruntap2 = coloruntap3 =
                                    coloruntap4 = coloruntap5 =
                                        coloruntap6 = Colors.white;
                                selectedday = todaysdayOfWeek;
                              });
                            },
                            child: DateButton(
                                weekday: todaysdayOfWeek,
                                date: (date.day).toString(),
                                color: colorbuttonnormal,
                                colortext: coloruntap),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selected = date.day + 1;

                                colorbuttonnormal1 =
                                    colorbuttonnormal1 == golden
                                        ? backgroundColorfigma
                                        : golden;
                                coloruntap1 = colorbuttonnormal1 == golden
                                    ? Colors.black
                                    : Colors.white;
                                colorbuttonnormal = colorbuttonnormal2 =
                                    colorbuttonnormal3 = colorbuttonnormal4 =
                                        colorbuttonnormal5 =
                                            colorbuttonnormal6 =
                                                backgroundColorfigma;
                                coloruntap = coloruntap2 = coloruntap3 =
                                    coloruntap4 = coloruntap5 =
                                        coloruntap6 = Colors.white;
                                selectedday = tomorrowsdayOfWeek;
                              });
                            },
                            child: DateButton(
                                weekday: tomorrowsdayOfWeek,
                                date: (date.day + 1).toString(),
                                color: colorbuttonnormal1,
                                colortext: coloruntap1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selected = date.day + 2;

                                colorbuttonnormal2 =
                                    colorbuttonnormal2 == golden
                                        ? backgroundColorfigma
                                        : golden;
                                coloruntap2 = colorbuttonnormal2 == golden
                                    ? Colors.black
                                    : Colors.white;
                                colorbuttonnormal1 = colorbuttonnormal =
                                    colorbuttonnormal3 = colorbuttonnormal4 =
                                        colorbuttonnormal5 =
                                            colorbuttonnormal6 =
                                                backgroundColorfigma;
                                coloruntap1 = coloruntap = coloruntap3 =
                                    coloruntap4 = coloruntap5 =
                                        coloruntap6 = Colors.white;
                                selectedday = dayaftertommorowsdayOfWeek;
                              });
                            },
                            child: DateButton(
                                weekday: dayaftertommorowsdayOfWeek,
                                date: (date.day + 2).toString(),
                                color: colorbuttonnormal2,
                                colortext: coloruntap2),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selected = date.day + 3;

                                colorbuttonnormal3 =
                                    colorbuttonnormal3 == golden
                                        ? backgroundColorfigma
                                        : golden;
                                coloruntap3 = colorbuttonnormal3 == golden
                                    ? Colors.black
                                    : Colors.white;
                                colorbuttonnormal1 = colorbuttonnormal2 =
                                    colorbuttonnormal = colorbuttonnormal4 =
                                        colorbuttonnormal5 =
                                            colorbuttonnormal6 =
                                                backgroundColorfigma;
                                coloruntap1 = coloruntap2 = coloruntap =
                                    coloruntap4 = coloruntap5 =
                                        coloruntap6 = Colors.white;
                                selectedday = twodayaftertommorowsdayOfWeek;
                              });
                            },
                            child: DateButton(
                                weekday: twodayaftertommorowsdayOfWeek,
                                date: (date.day + 3).toString(),
                                color: colorbuttonnormal3,
                                colortext: coloruntap3),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selected = date.day + 4;

                                colorbuttonnormal4 =
                                    colorbuttonnormal4 == golden
                                        ? backgroundColorfigma
                                        : golden;
                                coloruntap4 = colorbuttonnormal4 == golden
                                    ? Colors.black
                                    : Colors.white;
                                colorbuttonnormal1 = colorbuttonnormal2 =
                                    colorbuttonnormal3 = colorbuttonnormal =
                                        colorbuttonnormal5 =
                                            colorbuttonnormal6 =
                                                backgroundColorfigma;
                                coloruntap1 = coloruntap2 = coloruntap3 =
                                    coloruntap = coloruntap5 =
                                        coloruntap6 = Colors.white;
                                selectedday = threetomorrowsdayOfWeek;
                              });
                            },
                            child: DateButton(
                                weekday: threetomorrowsdayOfWeek,
                                date: (date.day + 4).toString(),
                                color: colorbuttonnormal4,
                                colortext: coloruntap4),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selected = date.day + 5;

                                colorbuttonnormal5 =
                                    colorbuttonnormal5 == golden
                                        ? backgroundColorfigma
                                        : golden;
                                coloruntap5 = colorbuttonnormal5 == golden
                                    ? Colors.black
                                    : Colors.white;
                                colorbuttonnormal1 = colorbuttonnormal2 =
                                    colorbuttonnormal3 = colorbuttonnormal4 =
                                        colorbuttonnormal = colorbuttonnormal6 =
                                            backgroundColorfigma;
                                coloruntap1 = coloruntap2 = coloruntap3 =
                                    coloruntap4 =
                                        coloruntap = coloruntap6 = Colors.white;
                                selectedday = fourdayaftertommorowsdayOfWeek;
                              });
                            },
                            child: DateButton(
                                weekday: fourdayaftertommorowsdayOfWeek,
                                date: (date.day + 5).toString(),
                                color: colorbuttonnormal5,
                                colortext: coloruntap5),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selected = date.day + 6;

                                colorbuttonnormal6 =
                                    colorbuttonnormal6 == golden
                                        ? backgroundColorfigma
                                        : golden;
                                coloruntap6 = colorbuttonnormal6 == golden
                                    ? Colors.black
                                    : Colors.white;
                                colorbuttonnormal1 = colorbuttonnormal2 =
                                    colorbuttonnormal3 = colorbuttonnormal4 =
                                        colorbuttonnormal5 = colorbuttonnormal =
                                            backgroundColorfigma;
                                coloruntap1 = coloruntap2 = coloruntap3 =
                                    coloruntap4 =
                                        coloruntap5 = coloruntap = Colors.white;
                                selectedday = fivedayaftertommorowsdayOfWeek;
                              });
                            },
                            child: DateButton(
                                weekday: fivedayaftertommorowsdayOfWeek,
                                date: (date.day + 6).toString(),
                                color: colorbuttonnormal6,
                                colortext: coloruntap6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const FractionalTranslation(
              translation: Offset(0, 4),
              child: Divider(
                height: 1,
                color: Color(0XFF444444),
                thickness: 1,
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: booktable
                  ? SizedBox(
                      height: 3.5 * height / 10,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                booktable = !booktable;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: width / 13, right: width / 13, top: 10),
                              child: SizedBox(
                                height: height / 20,
                                child: Container(
                                  height: 100,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: golden,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xFF979797),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "BOOK A TABLE",
                                      style: GoogleFonts.mavenPro(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0, left: 20.0),
                                    child: Text(
                                      "Select Time",
                                      style: GoogleFonts.sairaCondensed(
                                        color: const Color(0XFFBABABA),
                                        fontSize: height / 54,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0, right: 20.0),
                                    child: Text(
                                      selectedTime,
                                      style: GoogleFonts.sairaCondensed(
                                        color: const Color(0XFFB59F68),
                                        fontSize: height / 54,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right: width / 20.55,
                                  left: width / 20.55,
                                  bottom: 8,
                                  top: 8,
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(timeSlots.length,
                                        (index) {
                                      DateTime timeSlot = timeSlots[index];
                                      bool isSelected =
                                          index == selectedTimeIndex;

                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedTimeIndex = index;
                                              selectedTime =
                                                  DateFormat('hh:mm a').format(
                                                      timeSlots[
                                                          selectedTimeIndex]);
                                            });
                                          },
                                          child: TimeButton(
                                            time: DateFormat('hh:mm a')
                                                .format(timeSlot),
                                            color: isSelected
                                                ? golden
                                                : backgroundColorfigma,
                                            colortext: isSelected
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 13, right: width / 13, top: 10),
                            child: SizedBox(
                              height: height / 8,
                              child: FutureBuilder<List<Ticket>>(
                                future: TicketServices().getClubsTickets(
                                  context: context,
                                  clubId: widget.club.id,
                                ),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: Center(
                                            child:
                                                CircularProgressIndicator()));
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else if (snapshot.hasData) {
                                    List<Ticket> tickets = snapshot.data!;
                                    return Container(
                                      height: 3.2 * height / 10,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        color: backgroundColorfigma,
                                      ),
                                      child: ListView.builder(
                                        itemCount: tickets.length,
                                        itemBuilder: (context, index) {
                                          Ticket ticket = tickets[index];
                                          if (ticket.name == 'Stag' ||
                                              ticket.name == 'stag') {
                                            stagid = ticket.id;
                                            stagentryprice = ticket.current;
                                          } else if (ticket.name == "couple" ||
                                              ticket.name == "Couple") {
                                            coupleid = ticket.id;
                                            coupleentrypricce = ticket.current;
                                          } else {
                                            femaleid = femaleid;
                                            femaleentryprice = ticket.current;
                                          }
                                          return Container(
                                            height: height / 14,
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0XFF979797),
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10.0))),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    ticket.name,
                                                    style: GoogleFonts.mavenPro(
                                                      color: const Color(
                                                          0XFFFFFFFF),
                                                      fontSize: height / 43.35,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Rs. ${ticket.current}",
                                                    style: GoogleFonts
                                                        .sairaCondensed(
                                                      color: const Color(
                                                          0XFFFFFFFF),
                                                      fontSize: height / 43.35,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 32,
                                                    width: 100,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0XFFB59F68),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0)),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          child:
                                                              FractionalTranslation(
                                                            translation:
                                                                const Offset(
                                                                    0, 0.05),
                                                            child: IconButton(
                                                              onPressed: () {
                                                                if (ticket.name ==
                                                                        "Stag" ||
                                                                    ticket.name ==
                                                                        "stag") {
                                                                  setState(() {
                                                                    if (stagcount >
                                                                        0) {
                                                                      stagcount--;
                                                                    }
                                                                  });
                                                                } else if (ticket
                                                                            .name ==
                                                                        'couple' ||
                                                                    ticket.name ==
                                                                        "Couple") {
                                                                  setState(() {
                                                                    if (couplecount >
                                                                        0) {
                                                                      couplecount--;
                                                                    }
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    if (femalecount >
                                                                        0) {
                                                                      femalecount--;
                                                                    }
                                                                  });
                                                                }
                                                              },
                                                              icon: Icon(
                                                                Icons.remove,
                                                                size:
                                                                    width / 25,
                                                              ),
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Container(
                                                            height: height / 27,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border(
                                                                top: BorderSide(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.2),
                                                                  width: 2,
                                                                  style:
                                                                      BorderStyle
                                                                          .solid,
                                                                ),
                                                                left:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.2),
                                                                  width: 2,
                                                                  style:
                                                                      BorderStyle
                                                                          .solid,
                                                                ),
                                                                right:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.2),
                                                                  width: 2,
                                                                  style:
                                                                      BorderStyle
                                                                          .solid,
                                                                ),
                                                              ),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                getCountByTicketName(
                                                                    ticket
                                                                        .name),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child:
                                                              FractionalTranslation(
                                                            translation:
                                                                const Offset(
                                                                    0, 0.05),
                                                            child: Center(
                                                              child: IconButton(
                                                                onPressed: () {
                                                                  if (ticket.name ==
                                                                          "Stag" ||
                                                                      ticket.name ==
                                                                          "stag") {
                                                                    setState(
                                                                        () {
                                                                      stagcount++;
                                                                    });
                                                                  } else if (ticket
                                                                              .name ==
                                                                          'couple' ||
                                                                      ticket.name ==
                                                                          "Couple") {
                                                                    setState(
                                                                        () {
                                                                      couplecount++;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      femalecount++;
                                                                    });
                                                                  }
                                                                },
                                                                icon: const Icon(
                                                                    Icons.add),
                                                                color: Colors
                                                                    .black,
                                                                iconSize:
                                                                    width / 25,
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
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    return const Text(
                                        'No tickets found'); // Show a message if no tickets are available
                                  }
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 3.5 * height / 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 13, right: width / 13, top: 10),
                            child: SizedBox(
                              height: height / 4,
                              child: FutureBuilder<List<Ticket>>(
                                future: TicketServices().getClubsTickets(
                                  context: context,
                                  clubId: widget.club.id,
                                ),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: Center(
                                            child:
                                                CircularProgressIndicator()));
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else if (snapshot.hasData) {
                                    List<Ticket> tickets = snapshot.data!;
                                    return Container(
                                      height: 3.2 * height / 10,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        color: backgroundColorfigma,
                                      ),
                                      child: ListView.builder(
                                        itemCount: tickets.length,
                                        itemBuilder: (context, index) {
                                          Ticket ticket = tickets[index];
                                          if (ticket.name == 'Stag' ||
                                              ticket.name == 'stag') {
                                            stagid = ticket.id;
                                            stagentryprice = ticket.current;
                                          } else if (ticket.name == "couple" ||
                                              ticket.name == "Couple") {
                                            coupleid = ticket.id;
                                            coupleentrypricce = ticket.current;
                                          } else {
                                            femaleid = femaleid;
                                            femaleentryprice = ticket.current;
                                          }
                                          return Container(
                                            height: height / 10,
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color:
                                                      const Color(0XFF979797),
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10.0))),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    ticket.name,
                                                    style: GoogleFonts.mavenPro(
                                                      color: const Color(
                                                          0XFFFFFFFF),
                                                      fontSize: height / 43.35,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Rs. ${ticket.current}",
                                                    style: GoogleFonts
                                                        .sairaCondensed(
                                                      color: const Color(
                                                          0XFFFFFFFF),
                                                      fontSize: height / 43.35,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 32,
                                                    width: 100,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0XFFB59F68),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20.0)),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          child:
                                                              FractionalTranslation(
                                                            translation:
                                                                const Offset(
                                                                    0, 0.05),
                                                            child: IconButton(
                                                              onPressed: () {
                                                                if (ticket.name ==
                                                                        "Stag" ||
                                                                    ticket.name ==
                                                                        "stag") {
                                                                  setState(() {
                                                                    if (stagcount >
                                                                        0) {
                                                                      stagcount--;
                                                                    }
                                                                  });
                                                                } else if (ticket
                                                                            .name ==
                                                                        'couple' ||
                                                                    ticket.name ==
                                                                        "Couple") {
                                                                  setState(() {
                                                                    if (couplecount >
                                                                        0) {
                                                                      couplecount--;
                                                                    }
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    if (femalecount >
                                                                        0) {
                                                                      femalecount--;
                                                                    }
                                                                  });
                                                                }
                                                              },
                                                              icon: Icon(
                                                                Icons.remove,
                                                                size:
                                                                    width / 25,
                                                              ),
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Container(
                                                            height: height / 27,
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border(
                                                                top: BorderSide(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.2),
                                                                  width: 2,
                                                                  style:
                                                                      BorderStyle
                                                                          .solid,
                                                                ),
                                                                left:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.2),
                                                                  width: 2,
                                                                  style:
                                                                      BorderStyle
                                                                          .solid,
                                                                ),
                                                                right:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.2),
                                                                  width: 2,
                                                                  style:
                                                                      BorderStyle
                                                                          .solid,
                                                                ),
                                                              ),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                getCountByTicketName(
                                                                    ticket
                                                                        .name),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child:
                                                              FractionalTranslation(
                                                            translation:
                                                                const Offset(
                                                                    0, 0.05),
                                                            child: Center(
                                                              child: IconButton(
                                                                onPressed: () {
                                                                  if (ticket.name ==
                                                                          "Stag" ||
                                                                      ticket.name ==
                                                                          "stag") {
                                                                    setState(
                                                                        () {
                                                                      stagcount++;
                                                                    });
                                                                  } else if (ticket
                                                                              .name ==
                                                                          'couple' ||
                                                                      ticket.name ==
                                                                          "Couple") {
                                                                    setState(
                                                                        () {
                                                                      couplecount++;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {
                                                                      femalecount++;
                                                                    });
                                                                  }
                                                                },
                                                                icon: const Icon(
                                                                    Icons.add),
                                                                color: Colors
                                                                    .black,
                                                                iconSize:
                                                                    width / 25,
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
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    return const Text(
                                        'No tickets found'); // Show a message if no tickets are available
                                  }
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                booktable = !booktable;
                                timeSlots = generateTimeSlots();
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: width / 13, right: width / 13),
                              child: SizedBox(
                                height: height / 20,
                                child: Container(
                                  height: 100,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: backgroundColorfigma,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xFF979797),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "BOOK A TABLE",
                                      style: GoogleFonts.mavenPro(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: golden,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            const FractionalTranslation(
              translation: Offset(0, 4),
              child: Divider(
                height: 1,
                color: Color(0XFF444444),
                thickness: 1,
              ),
            ),
            FractionalTranslation(
              translation: const Offset(0, 0.2),
              child: Padding(
                padding: EdgeInsets.only(left: width / 13, right: width / 13),
                child: SizedBox(
                  height: height / 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Promoters",
                        style: GoogleFonts.sairaCondensed(
                            fontSize: 25, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: Center(
                            child: TextFormField(
                              controller: promocodecontroller,
                              style: GoogleFonts.sairaCondensed(
                                color: const Color(0XFFFFFFFF),
                                fontSize: 20,
                              ),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'PROMOCODE',
                                hintStyle: GoogleFonts.sairaCondensed(
                                  color:
                                      const Color.fromARGB(255, 124, 123, 123),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                          left: 8.0, right: 8.0, bottom: 8.0),
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
                height: height / 10,
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
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Total Amount",
                            style: GoogleFonts.sairaCondensed(
                                color: const Color(0XFF222222),
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
                                color: const Color(0XFF222222),
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
                            MaterialPageRoute(
                                builder: (context) => ClubPage3(
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
