import 'package:flutter/material.dart';
import 'package:venq_assessment/screens/Clubs/ClubDetail.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Events2.dart';
import 'package:venq_assessment/screens/Events/EventDetail.dart';
import 'package:venq_assessment/screens/Tickets/TicketConfirming.dart';
import 'package:venq_assessment/screens/Tickets/TicketSending.dart';
import 'package:venq_assessment/screens/Bookings/bookings_screen.dart';
import 'package:venq_assessment/screens/Clubs/clubs_screen.dart';
import 'package:venq_assessment/screens/Events/events_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Events2(),
    );
  }
}
