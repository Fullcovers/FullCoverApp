import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Providers/EventProvider.dart';
import 'package:venq_assessment/Providers/FetchUserProvider.dart';
import 'package:venq_assessment/Providers/OrderProvider.dart';
import 'package:venq_assessment/Providers/TicketProvider.dart';
import 'package:venq_assessment/screens/Auth/Login.dart';
import 'package:venq_assessment/screens/Auth/Register.dart';
import 'package:venq_assessment/screens/Bookings/MyBookingPage.dart';
import 'package:venq_assessment/screens/Bookings/bookings_screen.dart';
import 'package:venq_assessment/screens/Clubs/ClubDetail.dart';
import 'package:venq_assessment/screens/Clubs/ClubPage.dart';
import 'package:venq_assessment/screens/Clubs/ClubsPage2.dart';
import 'package:venq_assessment/screens/Clubs/clubs_screen.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Bar/BarMain.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Bar/BarMenu.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/BehindThe%20Scenes/BehindTheScenes.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Events/Event.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Events/Events2.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Promoters/Promoters.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Promoters/Promoters2.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Tables/Tables.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Tickets/Tickets.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Walkins/Walkins.dart';
import 'package:venq_assessment/screens/Events/EventDetail.dart';
import 'package:venq_assessment/screens/Events/events_screen.dart';
import 'package:venq_assessment/screens/QrScanner/Demo.dart';
import 'package:venq_assessment/screens/QrScanner/QrScanner.dart';
import 'package:venq_assessment/screens/Restaurants/Restaurants.dart';
import 'package:venq_assessment/screens/Tickets/TicketConfirming.dart';
import 'package:venq_assessment/screens/Tickets/TicketSending.dart';
import 'package:venq_assessment/widgets/BookingScreen/NewBookings.dart';

import 'Providers/ClubProvider.dart';
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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<ClubProvider>(create: (_) => ClubProvider()),
        ChangeNotifierProvider<EventProvider>(create: (_) => EventProvider()),
        ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
        ChangeNotifierProvider<FetchUser>(create: (_) => FetchUser()),
        ChangeNotifierProvider<TicketProvider>(create: (_) => TicketProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/barmenu': (context) => const BarMenu(),
          '/register': (context) => const SignUp(),
          '/login': (context) => const LoginPage(),
          '/qrscanner': (context) => const QrScanner(),
          '/allclubs': (context) => const ClubsScreen(),
          '/allevents': (context) => const EventsScreen(),
        },
        // home: userprovider.token.isEmpty ? const LoginPage() : const QrScanner(),
        home:
            userprovider.token.isEmpty ? const LoginPage() : const QrScanner(),

        // home: QrScanner(),
      ),
    );
  }
}
