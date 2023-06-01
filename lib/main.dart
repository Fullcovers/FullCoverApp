import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/screens/Auth/Login.dart';
import 'package:venq_assessment/screens/Auth/Register.dart';
import 'package:venq_assessment/screens/Clubs/ClubDetail.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Bar/BarMain.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Bar/BarMenu.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/BehindThe%20Scenes/BehindTheScenes.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Events/Event.dart';
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

import 'Providers/UserProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final userProvider = UserProvider();
  await userProvider.loadToken();
  await userProvider.loadId();

  runApp(
    ChangeNotifierProvider.value(
      value: userProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final userprovider = Provider.of<UserProvider>(context);
    userprovider.deleteToken();
    String userDetails = userprovider.getId();
    print(userDetails);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/barmenu': (context) => const BarMenu(),
        '/register': (context) => const SignUp(),
        '/login': (context) => const LoginPage(),
      },
      home: userprovider.token.isEmpty
          ? const LoginPage()
          : const BookingsScreen(),
    );
  }
}
