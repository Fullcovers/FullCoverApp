import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/searchbar.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/sliding.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
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

  String formatDate(DateTime? date) {
    if (date != null) {
      final DateFormat formatter = DateFormat('E d MMM, yyyy');
      return formatter.format(date);
    }
    return 'Select Date';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFF2C2F33),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: HeaderContent(title: "Tables"),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 60, right: 60),
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
        SizedBox(
          height: height / 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container( 
              height: height / 15,
              width: width / 1.15,
              child: SearchBar(
                searchtext: 'Search Bookings',
              )),
        ),

        SlidingSectionsPage(height: height,width: width,),
        Row(
          children: [
            Column(
              children: [
                Text("All Bookings"),
                 SizedBox(
                  height: 10.0,
                  child:  Center(
                    child:  Container(
                      margin:  EdgeInsetsDirectional.only(
                          start: 1.0, end: 1.0),
                      height: 5.0,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ]),
    ));
  }
}
