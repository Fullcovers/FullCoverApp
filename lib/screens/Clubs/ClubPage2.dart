import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// import 'package:jiffy/jiffy.dart';

import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Models/UserModel.dart';
import 'package:venq_assessment/Services/BTS_Services/Table_Services.dart';
import 'package:venq_assessment/Services/Promoters_Services.dart';
import 'package:venq_assessment/Services/Ticket_Services.dart';
import 'package:venq_assessment/Services/User_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Clubs/ClubPage3.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/TicketBookingScreen/DateButton.dart';
import 'package:venq_assessment/widgets/TicketBookingScreen/TicketCount.dart';

import '../../Models/Ticket.dart';
import '../../utils/Utils.dart';
import '../../widgets/TicketBookingScreen/TimeButton.dart';

class ClubsPage2 extends StatefulWidget {
  ClubsPage2(
      {super.key,
      required this.club,
      required this.tickets,
      required this.orderticketscount,required this.tabletickets,required this.tableticketscount});
  final ClubModel club;  Map<Ticket, int> tableticketscount = {};  List<Ticket> tabletickets = [];


  List<Ticket> tickets;
  Map<Ticket, int> orderticketscount;
  @override
  State<ClubsPage2> createState() => _ClubsPage2State();
}

class _ClubsPage2State extends State<ClubsPage2> {
  late UserData user;
  getuser() async {
    user = await UserServices.getprofileinfo();
  }

  var promoter;

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
  bool loded = false;

 

  @override
  void initState() {
    TicketServices().getClubsTickets(context: context, clubId: widget.club.id);
    super.initState();
    getuser();
  }

  TimeOfDay time =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
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

  TimeOfDay endtime =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  double totaltableamount1 = 0;
  double totalorderticketamount1 = 0;
  bool promocodeloded = false;

  @override
  Widget build(BuildContext context) {
    double totaltableamount = 0;
    double totalorderticketamount = 0;

    // print(fourdayaftertommorow.day);

    for (var i = 0; i < widget.tableticketscount.length; i++) {
      totaltableamount =
          (widget.tableticketscount[widget.tabletickets[i]]! * widget.tabletickets[i].current) +
              totaltableamount;
    }
    for (var i = 0; i < widget.orderticketscount.length; i++) {
      totalorderticketamount = (widget.orderticketscount[widget.tickets[i]]! *
              widget.tickets[i].current) +
          totalorderticketamount;
    }
    var cmonth = DateFormat.MMM().format(DateTime.now());

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final hoursend = endtime.hour.toString().padLeft(2, "0");
    final minuteend = endtime.minute.toString().padLeft(2, "0");
    print(widget.orderticketscount.entries.toList());
    veryfypromocode(String code) async {
      promoter = await PromotersServices.verifypromocode(
          code: code, clubId: widget.club.id, context: context);
      // ignore: use_build_context_synchronously
      showSnackBar(context, !promoter.isNotEmpty ? "invalid code" : "Applied");
      if (promoter.isNotEmpty) {
        setState(() {
          print("setstate0");
          totaltableamount1 = booktable
              ? totaltableamount * (100-promoter['data']['discount']) / 100
              : totaltableamount;
          totalorderticketamount1 = !booktable
              ? totalorderticketamount * (100-promoter['data']['discount']) / 100
              : totalorderticketamount;
          print(totalorderticketamount1);
          promocodeloded = true;
        });
        print(promocodeloded);
      }
    }

    return SafeArea(
      child: Stack(
        children: [
           Image.asset(
            Constants.backgroundimage,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: backgroundColortransperent,
            resizeToAvoidBottomInset: true,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height / 40,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 0, left: width / 20.55),
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
                                    padding: EdgeInsets.only(
                                        top: 0.0, left: width / 20.55),
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
                                padding:
                                    const EdgeInsets.only(right: 20.0, top: 16.0),
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
                      ),
                      Row(
                        children: [
                          FractionalTranslation(
                            translation: Offset(0, -0.4),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.location_on_outlined),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FractionalTranslation(
                              translation: const Offset(-0.05, 0),
                              child: SizedBox(
                                height: height / 10,
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
                                padding: const EdgeInsets.only(
                                    top: 10, left: 20.0, bottom: 10),
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
                                padding: const EdgeInsets.only(
                                    top: 10, right: 20.0, bottom: 10),
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
                                bottom: 18,
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

                                          colorbuttonnormal =
                                              colorbuttonnormal == golden
                                                  ? backgroundColorfigma
                                                  : golden;
                                          coloruntap = colorbuttonnormal == golden
                                              ? Colors.black
                                              : Colors.white;
                                          colorbuttonnormal1 = colorbuttonnormal2 =
                                              colorbuttonnormal3 =
                                                  colorbuttonnormal4 =
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
                                          selected = tomorrow.day;

                                          colorbuttonnormal1 =
                                              colorbuttonnormal1 == golden
                                                  ? backgroundColorfigma
                                                  : golden;
                                          coloruntap1 = colorbuttonnormal1 == golden
                                              ? Colors.black
                                              : Colors.white;
                                          colorbuttonnormal = colorbuttonnormal2 =
                                              colorbuttonnormal3 =
                                                  colorbuttonnormal4 =
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
                                          date: (tomorrow.day).toString(),
                                          color: colorbuttonnormal1,
                                          colortext: coloruntap1),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selected = dayaftertommorow.day;

                                          colorbuttonnormal2 =
                                              colorbuttonnormal2 == golden
                                                  ? backgroundColorfigma
                                                  : golden;
                                          coloruntap2 = colorbuttonnormal2 == golden
                                              ? Colors.black
                                              : Colors.white;
                                          colorbuttonnormal1 = colorbuttonnormal =
                                              colorbuttonnormal3 =
                                                  colorbuttonnormal4 =
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
                                          date: (dayaftertommorow.day).toString(),
                                          color: colorbuttonnormal2,
                                          colortext: coloruntap2),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selected = twodayaftertommorow.day;

                                          colorbuttonnormal3 =
                                              colorbuttonnormal3 == golden
                                                  ? backgroundColorfigma
                                                  : golden;
                                          coloruntap3 = colorbuttonnormal3 == golden
                                              ? Colors.black
                                              : Colors.white;
                                          colorbuttonnormal1 = colorbuttonnormal2 =
                                              colorbuttonnormal =
                                                  colorbuttonnormal4 =
                                                      colorbuttonnormal5 =
                                                          colorbuttonnormal6 =
                                                              backgroundColorfigma;
                                          coloruntap1 = coloruntap2 = coloruntap =
                                              coloruntap4 = coloruntap5 =
                                                  coloruntap6 = Colors.white;
                                          selectedday =
                                              twodayaftertommorowsdayOfWeek;
                                        });
                                      },
                                      child: DateButton(
                                          weekday: twodayaftertommorowsdayOfWeek,
                                          date:
                                              (twodayaftertommorow.day).toString(),
                                          color: colorbuttonnormal3,
                                          colortext: coloruntap3),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selected = threedayaftertommorow.day;

                                          colorbuttonnormal4 =
                                              colorbuttonnormal4 == golden
                                                  ? backgroundColorfigma
                                                  : golden;
                                          coloruntap4 = colorbuttonnormal4 == golden
                                              ? Colors.black
                                              : Colors.white;
                                          colorbuttonnormal1 = colorbuttonnormal2 =
                                              colorbuttonnormal3 =
                                                  colorbuttonnormal =
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
                                          date: (threedayaftertommorow.day)
                                              .toString(),
                                          color: colorbuttonnormal4,
                                          colortext: coloruntap4),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selected = fourdayaftertommorow.day;

                                          colorbuttonnormal5 =
                                              colorbuttonnormal5 == golden
                                                  ? backgroundColorfigma
                                                  : golden;
                                          coloruntap5 = colorbuttonnormal5 == golden
                                              ? Colors.black
                                              : Colors.white;
                                          colorbuttonnormal1 = colorbuttonnormal2 =
                                              colorbuttonnormal3 =
                                                  colorbuttonnormal4 =
                                                      colorbuttonnormal =
                                                          colorbuttonnormal6 =
                                                              backgroundColorfigma;
                                          coloruntap1 = coloruntap2 = coloruntap3 =
                                              coloruntap4 = coloruntap =
                                                  coloruntap6 = Colors.white;
                                          selectedday =
                                              fourdayaftertommorowsdayOfWeek;
                                        });
                                      },
                                      child: DateButton(
                                          weekday: fourdayaftertommorowsdayOfWeek,
                                          date:
                                              (fourdayaftertommorow.day).toString(),
                                          color: colorbuttonnormal5,
                                          colortext: coloruntap5),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selected = fivedayaftertommorow.day;

                                          colorbuttonnormal6 =
                                              colorbuttonnormal6 == golden
                                                  ? backgroundColorfigma
                                                  : golden;
                                          coloruntap6 = colorbuttonnormal6 == golden
                                              ? Colors.black
                                              : Colors.white;
                                          colorbuttonnormal1 = colorbuttonnormal2 =
                                              colorbuttonnormal3 =
                                                  colorbuttonnormal4 =
                                                      colorbuttonnormal5 =
                                                          colorbuttonnormal =
                                                              backgroundColorfigma;
                                          coloruntap1 = coloruntap2 = coloruntap3 =
                                              coloruntap4 = coloruntap5 =
                                                  coloruntap = Colors.white;
                                          selectedday =
                                              fivedayaftertommorowsdayOfWeek;
                                        });
                                      },
                                      child: DateButton(
                                          weekday: fivedayaftertommorowsdayOfWeek,
                                          date:
                                              (fivedayaftertommorow.day).toString(),
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
                      SizedBox(
                        height: height / 50,
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        child: booktable
                            ? SizedBox(
                                height: 3.5 * height / 8,
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
                                            left: width / 13,
                                            right: width / 13,
                                            bottom: height / 40),
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
                                                style: GoogleFonts.bebasNeue(
                                                  fontSize: 20,
                                                  
                                                  color: golden,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0.0, left: 10),
                                        child: Text(
                                          "Select Time",
                                          style: GoogleFonts.sairaCondensed(
                                            color: const Color(0XFFBABABA),
                                            fontSize: height / 54,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        height: height / 20,
                                        width: width / 2,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              34, 34, 34, 0.37),
                                          borderRadius: BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 20.0,
                                              ),
                                              child: Text("$hoursend:$minuteend",
                                                  style: GoogleFonts.sairaCondensed(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: IconButton(
                                                onPressed: () async {
                                                  TimeOfDay? newtime =
                                                      await showTimePicker(
                                                          context: context,
                                                          initialTime: time);
                                                  if (newtime == null) {
                                                    return;
                                                  }
                                                  setState(() {
                                                    endtime = newtime;
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.alarm,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: width / 13,
                                          right: width / 13,
                                          top: height / 30),
                                      child: Container(
                                        height:
                                            (height / 14) * widget.tabletickets.length +
                                                20 * widget.tabletickets.length,
                                        child: ListView.builder(physics:
                                                      NeverScrollableScrollPhysics(),
                                          itemCount: 1,
                                          itemBuilder: (context, snapshot) {
                                            if (widget.tabletickets == []) {
                                              return const SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                  child: Center(
                                                      child:
                                                          CircularProgressIndicator()));
                                            } else {
                                              return Container(
                                                height:
                                                 (height / 14) *
                                                       widget. tabletickets.length +
                                                    20 * widget.tabletickets.length,
                                                width: double.maxFinite,
                                               
                                                child: ListView.builder(
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemCount: widget.tabletickets.length,
                                                  itemBuilder: (context, index) {
                                                    Ticket ticket =
                                                        widget.tabletickets[index];
                                                    print(ticket.name);
                                                  
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(8.0),
                                                      child: Container(
                                                        height: height / 14,
                                                        width: double.maxFinite,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                              width: 1,
                                                              color: const Color(
                                                                  0XFF979797),
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .all(
                                                                    Radius.circular(
                                                                        10.0))),
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Text(
                                                                ticket.name,
                                                                style: GoogleFonts
                                                                    .mavenPro(
                                                                  color: const Color(
                                                                      0XFFFFFFFF),
                                                                  fontSize: height /
                                                                      43.35,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              Text(
                                                                "Rs. ${ticket.current}",
                                                                style: GoogleFonts
                                                                    .sairaCondensed(
                                                                  color: const Color(
                                                                      0XFFFFFFFF),
                                                                  fontSize: height /
                                                                      43.35,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              Container(
                                                                height: 32,
                                                                width: 100,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Color(
                                                                      0XFFB59F68),
                                                                  borderRadius: BorderRadius
                                                                      .all(Radius
                                                                          .circular(
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
                                                                                0,
                                                                                0.05),
                                                                        child:
                                                                            IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            setState(
                                                                                () {
                                                                              widget.tableticketscount[ticket] =
                                                                                 widget. tableticketscount[ticket]! - 1;promocodeloded=false;
                                                                            });
                                                                          },
                                                                          icon:
                                                                              Icon(
                                                                            Icons
                                                                                .remove,
                                                                            size: width /
                                                                                25,
                                                                          ),
                                                                          color: Colors
                                                                              .black,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            height /
                                                                                27,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border(
                                                                            top:
                                                                                BorderSide(
                                                                              color: Colors
                                                                                  .black
                                                                                  .withOpacity(0.2),
                                                                              width:
                                                                                  2,
                                                                              style:
                                                                                  BorderStyle.solid,
                                                                            ),
                                                                            left:
                                                                                BorderSide(
                                                                              color: Colors
                                                                                  .black
                                                                                  .withOpacity(0.2),
                                                                              width:
                                                                                  2,
                                                                              style:
                                                                                  BorderStyle.solid,
                                                                            ),
                                                                            right:
                                                                                BorderSide(
                                                                              color: Colors
                                                                                  .black
                                                                                  .withOpacity(0.2),
                                                                              width:
                                                                                  2,
                                                                              style:
                                                                                  BorderStyle.solid,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                           widget. tableticketscount[ticket]
                                                                                .toString(),
                                                                            style: const TextStyle(
                                                                                color:
                                                                                    Colors.black),
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
                                                                                0,
                                                                                0.05),
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              IconButton(
                                                                            onPressed:
                                                                                () {
                                                                              setState(
                                                                                  () {
                                                                               widget. tableticketscount[ticket] =
                                                                                   widget. tableticketscount[ticket]! + 1;
                                                                                   promocodeloded=false;
                                                                              });
                                                                            },
                                                                            icon: const Icon(
                                                                                Icons.add),
                                                                            color: Colors
                                                                                .black,
                                                                            iconSize:
                                                                                width /
                                                                                    25,
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
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: width / 13,
                                          right: width / 13,
                                          top: 10),
                                      child: SizedBox(
                                        height: height / 14*widget.tickets.length+20*widget.tickets.length,
                                        child: ListView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: widget.tickets.length,
                                          itemBuilder: (context, index) {
                                            Ticket ticket = widget.tickets[index];

                                
                                            return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
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
                                                                    setState(() {
                                                                      widget.orderticketscount[
                                                                              ticket] =
                                                                          widget.orderticketscount[
                                                                                  ticket]! -
                                                                              1;promocodeloded=false;
                                                                    });
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
                                                                    widget
                                                                        .orderticketscount[
                                                                            ticket]
                                                                        .toString(),
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
                                                                      setState(() {
                                                                        widget.orderticketscount[
                                                                                ticket] =
                                                                            widget.orderticketscount[ticket]! +
                                                                                1;promocodeloded=false;
                                                                      });
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
                                              ),
                                            );
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
                                            left: width / 13,
                                            right: width / 13,
                                            bottom: height / 40),
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
                                                style: GoogleFonts.bebasNeue(
                                                  fontSize: 20,
                                                  
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
                      Divider(
                        height: 1,
                        color: Color(0XFF444444),
                        thickness: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width / 13,
                          right: width / 13,
                          top: height / 40,
                        ),
                        child: SizedBox(
                          height: height / 10,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: height / 40),
                                    child: Text(
                                      "Promoters",
                                      style: GoogleFonts.sairaCondensed(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    height: height / 25,
                                    width: width / 2.5,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(10.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 13,left:10),
                                      child: Center(
                                        child: TextFormField(
                                          controller: promocodecontroller,
                                          style: GoogleFonts.sairaCondensed(
                                            color: const Color(0XFFFFFFFF),
                                            fontSize: width/25,
                                          ),
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            hintStyle: GoogleFonts.sairaCondensed(
                                              color: const Color.fromARGB(
                                                  255, 124, 123, 123),
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    if (promocodeloded) {
                                      promocodecontroller.text = "";
                                      setState(() {
                                        promocodeloded=false;
                                      });
                                    } else {
                                      veryfypromocode(promocodecontroller.text);
                                    }
                                  },
                                  child: Text(
                                    promocodeloded ? "Remove" : "Verify",
                                    style: GoogleFonts.mavenPro(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: golden,
                                    ),
                                  ),
                                ),
                              )
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
                      SizedBox(
                        height: height / 5,
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: height / 8,
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
                              padding: const EdgeInsets.only(left: 20.0, top: 20),
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
                                promocodeloded
                                    ? booktable
                                        ? totaltableamount1.toString()
                                        : totalorderticketamount1.toString()
                                    : booktable
                                        ? totaltableamount.toString()
                                        : totalorderticketamount.toString(),
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
                                          promopersent: promocodeloded
                                              ? booktable
                                                  ? (totaltableamount1 -
                                                          totaltableamount)
                                                      .toInt()
                                                  : (totalorderticketamount1 -
                                                          totalorderticketamount)
                                                      .toInt()
                                              : 0,
                                          orderticketscount:
                                              widget.orderticketscount,
                                          thisuser: user,
                                          bookingtable: booktable,
                                          time: "${endtime.hour}:${endtime.minute}",
                                          tableticketscount: widget.tableticketscount,
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
                                          totalprice: promocodeloded
                                              ? booktable
                                                  ? double.parse(
                                                      totaltableamount1.toString())
                                                  : double.parse(
                                                      totalorderticketamount1
                                                          .toString())
                                              : booktable
                                                  ? double.parse(
                                                      totaltableamount.toString())
                                                  : double.parse(
                                                      totalorderticketamount
                                                          .toString()),
                                                          totalpricewithoutcode:booktable
                                                  ? double.parse(
                                                      totaltableamount.toString())
                                                  : double.parse(
                                                      totalorderticketamount
                                                          .toString()) ,
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
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
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
