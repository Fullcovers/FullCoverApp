import 'package:flutter/material.dart';
import 'package:venq_assessment/screens/ClubDetail.dart';
import 'package:venq_assessment/screens/DetailedEvent.dart';
import 'package:venq_assessment/screens/bookings_screen.dart';
import 'package:venq_assessment/screens/clubs_screen.dart';
import 'package:venq_assessment/screens/events_screen.dart';

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
      home: ClubDetail(),
    );
  }
}
