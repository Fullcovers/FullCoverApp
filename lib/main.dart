import 'package:flutter/material.dart';
import 'package:venq_assessment/screens/Clubs/ClubDetail.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Bar/BarMain.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Bar/BarMenu.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Events/Events2.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Promoters/Promoters2.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Tickets/Tickets.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Walkins/Walkins.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/barmenu': (context) => const BarMenu(),
      },
      home: const Walkins(),
    );
  }
}
