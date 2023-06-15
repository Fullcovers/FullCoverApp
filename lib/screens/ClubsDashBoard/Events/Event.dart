import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Events/CreateEvent.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/BottomButton.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/eventcard.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFF2C2F33),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: HeaderContent(title: "EVENTS"),
          ),
          SizedBox(
            height: height / 25,
          ),
          eventcard(height, width, "Event name", "Sat 13 May, 2023", 15),
          SizedBox(
            height: height / 42,
          ),
          eventcard(height, width, "Event name", "Sat 13 May, 2023", 15),
          SizedBox(
            height: height / 42,
          ),
          eventcard(height, width, "Event name", "Sat 13 May, 2023", 15),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: width / 5, right: width / 5, bottom: width / 20),
        child: bottombutton(
          "Create Event",
          const Icon(
            Icons.add,
            size: 35,
          ),context,rought:CreateEvent()
        ),
      ),
    ));
  }
}
