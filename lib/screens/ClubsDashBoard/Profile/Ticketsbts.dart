import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:venq_assessment/Services/Ticket_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';

class BTSTicket extends StatefulWidget {
  const BTSTicket({super.key});

  @override
  State<BTSTicket> createState() => _BTSTicketState();
}

class _BTSTicketState extends State<BTSTicket> {
  gettickets() async {
    TicketServices.getclubTickets(context: context);
  }

  @override
  void initState() {
    super.initState();
    gettickets();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColorfigma,
      body: Column(children: [
        HeaderContent(title: "Tickets"),
      ]),
    ));
  }
}
