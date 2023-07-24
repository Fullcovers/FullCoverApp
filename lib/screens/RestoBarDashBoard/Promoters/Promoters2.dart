import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/utils/Constants.dart';

import '../../../widgets/ClubDashBoard/HeaderContent.dart';
import '../../../widgets/ClubDashBoard/PeopleList.dart';
import '../../../widgets/ClubDashBoard/SearchPeople.dart';
import '../../../widgets/ClubDashBoard/TicketMoneyStatus.dart';

class Promoters2 extends StatefulWidget {
  const Promoters2({super.key});

  @override
  State<Promoters2> createState() => _Promoters2State();
}

class _Promoters2State extends State<Promoters2> {
  DateTime? selectedDate; // Track the selected date

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

  String formatDate(DateTime? date) {
    if (date != null) {
      final DateFormat formatter = DateFormat('E d MMM, yyyy');
      return formatter.format(date);
    }
    return 'Select Date';
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
            children: [
               Padding(
                padding: EdgeInsets.all(10.0),
                child: HeaderContent(title: "PROMOTERS"),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20, bottom: 20, left: 60, right: 60),
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
                                : "Select Date",
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
              const TicketMoneyStatus(ticket: "1080", money: "1080000"),
              const Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 0),
                child: Divider(
                  height: 20,
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
              const SearchPeople(
                title: 'Search People',
              ),
              // PeopleList(
              //   sdate: formatDate(selectedDate),
              // ),
            ],
      ),
    ),
          ],
        ));
  }
}
