import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Models/Ticket.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Tickets/Tickets.dart';

class HeaderContentWalkins extends StatelessWidget {
  const HeaderContentWalkins({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          Text(
            title,
            style: GoogleFonts.bebasNeue(
              fontSize: 28,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 Tickets()));
            },
            child: Text(
              "View Walkins",
              style: GoogleFonts.sairaCondensed(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color(0XFFB59F68),
              ),
            ),
          )
        ],
      ),
    );
  }
}
