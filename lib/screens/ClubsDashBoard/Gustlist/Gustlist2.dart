import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:venq_assessment/Services/BTS_Services/Gustlist_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/PeopleList.dart';

class Gustlist2 extends StatefulWidget {
  const Gustlist2({super.key});

  @override
  State<Gustlist2> createState() => _Gustlist2State();
}

class _Gustlist2State extends State<Gustlist2> {
  DateTime? selectedDate;
  bool loded = false;

  String formatDate(DateTime? date) {
    if (date != null) {
      final DateFormat formatter = DateFormat('E d MMM, yyyy');
      return formatter.format(date);
    }
    return 'Select Date';
  }

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
      isloded = false;
    });
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    var date = formatter.format(pickedDate!);
    getguestlist(date);
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate; // Update selectedDate if a date was picked
      });
    }
  }
bool isloded=false;
  var orders;
  getguestlist(String date) async {
    orders = await Gustlist_Services.getguestlist(context: context, date: date);
    print(orders);
    setState(() {
      isloded=true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getguestlist(formatDate(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: HeaderContent(title: "GustList"),
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
             isloded? PeopleList(
                orders: orders['data'],
                count: orders['count'],
              ):Constants.mycircularProgressIndicator()
            ],
          ),
        )
      ],
    ));
  }
}
