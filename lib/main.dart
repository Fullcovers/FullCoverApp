import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Providers/BTS_Providers/PromoterProvider.dart';
import 'package:venq_assessment/Providers/EventProvider.dart';
import 'package:venq_assessment/Providers/FetchUserProvider.dart';
import 'package:venq_assessment/Providers/OrderProvider.dart';
import 'package:venq_assessment/Providers/TicketProvider.dart';
import 'package:venq_assessment/screens/Auth/Login.dart';
import 'package:venq_assessment/screens/Auth/Register.dart';
import 'package:venq_assessment/screens/Bookings/MyBookingPage.dart';
import 'package:venq_assessment/screens/Clubs/clubs_screen.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Bar/BarMenu.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/BehindThe%20Scenes/BehindTheScenes.dart';
import 'package:venq_assessment/screens/Events/events_screen.dart';
import 'package:venq_assessment/screens/QrScanner/QrScanner.dart';
import 'package:venq_assessment/screens/Tickets/TicketConfirming.dart';
import 'package:venq_assessment/screens/Tickets/TicketSending.dart';
import 'package:venq_assessment/utils/Constants.dart';
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
    Constants.usertoken = userprovider.token;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        ChangeNotifierProvider<ClubProvider>(create: (_) => ClubProvider()),
        ChangeNotifierProvider<EventProvider>(create: (_) => EventProvider()),
        ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
        ChangeNotifierProvider<FetchUser>(create: (_) => FetchUser()),
        ChangeNotifierProvider<TicketProvider>(create: (_) => TicketProvider()),
        ChangeNotifierProvider<PromoterProvider>(
            create: (_) => PromoterProvider()),
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
          '/ticketsending': (context) => const TicketSending(),
          '/ticketconfirming': (context) => const TicketConfirming(),
          '/bookingsscreen': (context) => MyBookingPage(),
        },
        home: userprovider.token.isEmpty
            ? const LoginPage()
            : BehindTheScenesPage(),
        // home:
        //     userprovider.token.isEmpty ? const LoginPage() : const QrScanner(),
        // home: MyBookingPage(),
      ),
    );
  }
}
