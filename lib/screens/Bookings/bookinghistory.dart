import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
       double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(child: Scaffold(
            backgroundColor: backgroundColorfigma,
            body: Column(children: [
        HeaderContent(title: "Bookings"),


            ]),

    ));
  }
}