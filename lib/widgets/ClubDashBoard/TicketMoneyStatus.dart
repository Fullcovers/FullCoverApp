import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TicketMoneyStatus extends StatelessWidget {
  final String money;
  final String ticket;
  const TicketMoneyStatus(
      {super.key, required this.money, required this.ticket});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final int moneyint = int.tryParse(money) ?? 0;
    final indianCurrencyFormat =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);
    final formattedAmount = indianCurrencyFormat.format(moneyint);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height / 7,
            width: 4 * width / 10,
            decoration: BoxDecoration(
              color: const Color(0XFFB59F68),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      ticket,
                      style: GoogleFonts.bebasNeue(
                        fontSize: 36,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Total Tickets Sold",
                    style: GoogleFonts.sairaCondensed(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFFD9D9D9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height / 7,
            width: 4 * width / 10,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(155, 128, 74, 0.24),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                width: 2,
                color: const Color(0XFFB59F68),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: FittedBox(
                      child: Text(
                        formattedAmount,
                        style: GoogleFonts.bebasNeue(
                          fontSize: 36,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Total Money Collected",
                    style: GoogleFonts.sairaCondensed(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0XFFD9D9D9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
