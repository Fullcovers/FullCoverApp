import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:venq_assessment/Services/BTS_Services/Order_Services.dart';
import 'package:venq_assessment/Services/BTS_Services/Table_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Tables/TableAddTickets.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/TableCardonline.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/Tablecard.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/searchbar.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/sliding.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  bool loded = false;
  bool lodedonline = false;
  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ??
          DateTime
              .now(), // Use selectedDate if available, else use current date
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate; // Update selectedDate if a date was picked
      });
    }
  }

  var tables;  var tablesonline;

  loadtables() async {
    final DateFormat formatter = DateFormat('yyyy-M-dd');
    var date = formatter.format(DateTime.now());
    tables = await BTStable.getalltables(context: context, date: date);
    print(tables);
    setState(() {
      loded = true;
    });
  }

  loadonlinetables() async {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    var date = formatter.format(DateTime.now());
    print(date);
    tablesonline = await BTStable.getallonlinetables(context: context, date: date);
    print(tablesonline['data'].length);
    setState(() {
      lodedonline = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadtables();
    loadonlinetables();
  }

  String formatDate(DateTime? date) {
    if (date != null) {
      final DateFormat formatter = DateFormat('E d MMM, yyyy');
      return formatter.format(date);
    }
    return 'Select Date';
  }

  bool ashow = true;
  bool oshow = false;
  bool wshow = false;
  bool show = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Stack(
          children: [Image.asset(
            Constants.backgroundimage,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
            Scaffold(
      backgroundColor: backgroundColortransperent,
      body: loded && lodedonline
              ? Column(children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: HeaderContent(
                      title: "Tables",
                      rought: const TableAddTicket(),
                      icon: const Icon(
                        Icons.settings_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding:
                  //       EdgeInsets.only(top: 20, bottom: 20, left: 60, right: 60),
                  //   child: Container(
                  //     height: height / 20,
                  //     width: double.maxFinite,
                  //     decoration: BoxDecoration(
                  //       color: const Color.fromRGBO(34, 34, 34, 0.37),
                  //       borderRadius: BorderRadius.circular(15.0),
                  //       border: Border.all(
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //             left: 20.0,
                  //           ),
                  //           child: Text(
                  //               selectedDate != null
                  //                   ? formatDate(selectedDate)
                  //                   : formatDate(DateTime.now()),
                  //               style: GoogleFonts.sairaCondensed(
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w600,
                  //                 color: Colors.white,
                  //               )),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(right: 10.0),
                  //           child: IconButton(
                  //             onPressed: () {
                  //               _selectDate(
                  //                   context); // Show the date picker on icon press
                  //             },
                  //             icon: const Icon(
                  //               Icons.calendar_today_outlined,
                  //               color: Colors.white,
                  //               size: 20,
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: height / 30,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //       height: height / 15,
                  //       width: width / 1.15,
                  //       child: SearchBar(
                  //         searchtext: 'Search Bookings',
                  //       )),
                  // ),
                  FractionalTranslation(
                    translation: const Offset(0, 0.5),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0, left: 20, right: 20),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ashow = !ashow;
                                      oshow = false;
                                      wshow = false;
                                      show = !show;
                                    });
                                  },
                                  child: Text(
                                    "All Bookings ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontFamily:
                                          FontAwesomeIcons.solidCircle.fontFamily,
                                    ),
                                  )),
                            ),
                            ashow
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
                                  top: 0, left: 20, right: 20),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ashow = false;
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
                                  top: 0, left: 20, right: 20),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ashow = false;
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
                  wshow
                      ? Expanded(
                          child: ListView.builder(
                              itemCount:  tables['data'].length==null?0:tables['data'].length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    TableCard(thistable: tables['data'][index]),
                                  ],
                                );
                              }),
                        )
                      : Container(),
                      oshow
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: tablesonline['data'].length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    TableCardonline(thistable: tablesonline['data'][index]),
                                  ],
                                );
                              }),
                        )
                      : Container(),
                ])
              : Center(child: CircularProgressIndicator()),
    ),
          ],
        ));
  }
}
