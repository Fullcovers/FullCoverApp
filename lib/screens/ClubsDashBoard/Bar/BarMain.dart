import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/BarMainMoneyStatus.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';

class BarMain extends StatefulWidget {
  const BarMain({super.key});

  @override
  State<BarMain> createState() => _BarMainState();
}

class _BarMainState extends State<BarMain> {
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
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFF2C2F33),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderContent(title: "BAR"),
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
          const BarMoneyStatus(ticket: "1080", money: "1080000"),
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, bottom: 10.0, left: 80, right: 80),
            child: Container(
              height: 0.8 * height / 10,
              width: width,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(217, 217, 217, 0.12),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/barmenu');
                },
                child: Center(
                  child: Text("BAR MENU",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80, bottom: 10, right: 80),
            child: Container(
                height: 70,
                width: width,
                decoration: BoxDecoration(
                  color: const Color(0XFF35393E),
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF35393E),
                      Color(0xFF2D3135),
                    ],
                    stops: [0, 1],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4A4E53).withOpacity(0.7),
                      offset: const Offset(-6, -6),
                      blurRadius: 20,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: const Color(0xFF232527).withOpacity(0.9),
                      offset: const Offset(8, 8),
                      blurRadius: 30,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: const Color(0xFF232527).withOpacity(0.8),
                      offset: const Offset(2, 2),
                      blurRadius: 6,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: const Color(0xFF4A4E53).withOpacity(0.5),
                      offset: const Offset(-2, -2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.qr_code_scanner,
                            size: 45,
                            color: Colors.white,
                          )),
                    ),
                    Text(
                      "SCAN BAR QR CODE",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    ));
  }
}
