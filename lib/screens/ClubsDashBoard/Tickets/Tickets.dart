import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:venq_assessment/Services/BTS_Services/Order_Services.dart';
import 'package:venq_assessment/Services/BTS_Services/WalkIns_Services.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/PeopleList2.dart';

import '../../../widgets/ClubDashBoard/HeaderContent.dart';
import '../../../widgets/ClubDashBoard/PeopleList.dart';
import '../../../widgets/ClubDashBoard/SearchPeople.dart';
import '../../../widgets/ClubDashBoard/TicketMoneyStatus.dart';

class Tickets extends StatefulWidget {
  const Tickets({super.key});

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  @override
  void initState() {
    super.initState();
    loadorders();
    loadwalkins();
  }

  bool oshow = true;
  bool wshow = false;
  bool show = true;
  DateTime? selectedDate; // Track the selected date
  var orders;
  var walkins;
  bool loded = false;
  bool lodedwalkins = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ??
          DateTime
              .now(), // Use selectedDate if available, else use current date
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    setState(() {
      loded = false;
    });
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    var date = formatter.format(pickedDate!);
    loadordersbydate(date);loadwalkinsbydate(date);
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate; // Update selectedDate if a date was picked
      });
    }
  }

  loadordersbydate(String date) async {
    orders =
        await BTSOrderServices.getallordersbydate(context: context, date: date);
    setState(() {
      loded = true;
    });
  }
  loadwalkinsbydate(String date) async {
    walkins =
        await BTSwalkins.getallWalkinsbydate(context: context, date: date);
    setState(() {
      lodedwalkins = true;
    });
  }

  String formatDate(DateTime? date) {
    if (date != null) {
      final DateFormat formatter = DateFormat('E d MMM, yyyy');
      return formatter.format(date);
    }
    return 'Select Date';
  }
  // final DateFormat formatter1 = DateFormat('E d MMM, yyyy');

// String todaydate=formatter1.format(DateTime.now());
  loadorders() async {
    orders = await BTSOrderServices.getallorders(context: context);
    setState(() {
      loded = true;
    });
  }

  loadwalkins() async {
    walkins = await BTSwalkins.getallWalkins(context: context);
    setState(() {
      lodedwalkins = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalmoney1 = 1000;

// if (loded == true) {
//         for (var i = 0; i < orders['data'].length; i++) {
//           totalmoney = totalmoney +
//                     orders['data'][i]['total'];

//       }
//     }

    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFF2C2F33),
      body: loded && lodedwalkins
          ? Column(
              children: [
                 Padding(
                  padding: EdgeInsets.all(10.0),
                  child: HeaderContent(title: "Reservations"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 60, right: 60),
                  child: Container(
                    height: height / 20,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(34, 34, 34, 0.37),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                          ),
                          child: Text(
                              selectedDate != null
                                  ? formatDate(selectedDate)
                                  : formatDate(DateTime.now()),
                              style: GoogleFonts.sairaCondensed(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: IconButton(
                            onPressed: () {
                              _selectDate(
                                  context); // Show the date picker on icon press
                            },
                            icon: const Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TicketMoneyStatus(
                    ticket: show
                        ? loded
                            ? orders['count']
                            : 0
                        : walkins['date'].length.toString(),
                    money: totalmoney1.toString()),
                FractionalTranslation(
                  translation: const Offset(0, 0.5),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 40, right: 40),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    oshow = !oshow;
                                    wshow = false;
                                    show = !show;
                                  });
                                },
                                child: Text(
                                  "Online ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily:
                                        FontAwesomeIcons.solidCircle.fontFamily,
                                  ),
                                )),
                          ),
                          oshow
                              ? Container(
                                  height: 2,
                                  width: 60,
                                  color: Colors.amber,
                                )
                              : Container(),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 40, right: 40),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    wshow = !wshow;
                                    oshow = false;
                                    show = !show;
                                  });
                                },
                                child: Text(
                                  "Walkins ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily:
                                        FontAwesomeIcons.solidCircle.fontFamily,
                                  ),
                                )),
                          ),
                          wshow
                              ? Container(
                                  height: 2,
                                  width: 60,
                                  color: Colors.amber,
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
                const FractionalTranslation(
                  translation: Offset(0, 0.3),
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 0),
                    child: Divider(
                      height: 2,
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                ),
                // show
                //     ? const SearchPeople(
                //         title: 'Search People',
                //       )
                //     : Container(),
                show
                    ? PeopleList(
                        orders: orders['data'],
                        count: orders['count'],
                      )
                    :
                    // Container()
                    PeopleList2(
                        walkins: walkins['date'],
                      )
              ],
            )
          : Center(child: CircularProgressIndicator()),
    ));
  }
}
