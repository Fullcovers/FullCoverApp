import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Models/Events.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Events/EventDetail3.dart';
import 'package:venq_assessment/widgets/TicketBookingScreen/DateButton.dart';

class EventDetail2 extends StatefulWidget {
  EventDetail2({super.key, required this.event, required this.club});
  Event event;
  ClubModel club;
  @override
  State<EventDetail2> createState() => _EventDetail2State();
}

class _EventDetail2State extends State<EventDetail2> {
      int stagcount = 0;
    int stagentryprice = 999;
    int couplecount = 0;
    int coupleentrypricce = 999;
    int femalecount = 0;
    int femaleentryprice = 999;
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
  Widget build(BuildContext context) {
    int totalprice = (stagcount * stagentryprice) +
        (femalecount * femaleentryprice) +
        (couplecount * coupleentrypricce);

    bool check = false;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE0E0E0),
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
                      child: Text(
                        widget.event.name,
                        style: GoogleFonts.bebasNeue(
                          color: Colors.black,
                          fontSize: height / 23,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width / 20.55),
                      child: Text(
                        "Pune",
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
                    child: Text(
                      "19:00 Hrs : 23.45 Hrs",
                      style: GoogleFonts.sairaCondensed(
                        color: Colors.black,
                        fontSize: height / 43.35,
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
                    widget.club.address,
                    style: GoogleFonts.sairaCondensed(
                      fontSize: height / 61.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
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
              padding: EdgeInsets.only(left: width / 13, right: width / 13),
              child: Container(
                height: 3.2 * height / 10,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Color(0xFFE0E0E0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: height / 10,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3
                          ,
                            color: const Color(0XFF979797),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Stag",
                              style: GoogleFonts.mavenPro(
                                color: Colors.black,
                                fontSize: height / 43.35,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Rs. $stagentryprice",
                              style: GoogleFonts.sairaCondensed(
                                color: Colors.black,
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
                                            if (stagcount > 0) {
                                              stagcount--;
                                            }
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
                                      height: 32,
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
                                          stagcount
                                              .toString(), // Use the dynamic count value
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
                                              stagcount++;
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
                    Container(
                      height: height / 10,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: const Color(0XFF979797),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Couple",
                              style: GoogleFonts.mavenPro(
                                color: Colors.black,
                                fontSize: height / 43.35,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Rs. $coupleentrypricce",
                              style: GoogleFonts.sairaCondensed(
                                color: Colors.black,
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
                                            if (couplecount > 0) {
                                              couplecount--;
                                            }
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
                                      height: 32,
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
                                          couplecount
                                              .toString(), // Use the dynamic count value
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
                                              couplecount++;
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
                    Container(
                      height: height / 10,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: const Color(0XFF979797),
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Female",
                              style: GoogleFonts.mavenPro(
                                color: Colors.black,
                                fontSize: height / 43.35,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Rs. $femaleentryprice",
                              style: GoogleFonts.sairaCondensed(
                                color: Colors.black,
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
                                            if (femalecount > 0) {
                                              femalecount--;
                                            }
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
                                          femalecount
                                              .toString(), // Use the dynamic count value
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
                                              femalecount++;
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
                  ],
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
                          icon: Icon(
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
                                color: Color(0xFFE0E0E0),
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
                                color: Color(0xFFE0E0E0),
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
                                builder: (context) => EventDetail3(
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
                                      totalprice: totalprice, event: widget.event,
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
    ;
  }
}
