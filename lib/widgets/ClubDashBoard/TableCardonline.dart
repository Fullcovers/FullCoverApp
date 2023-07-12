import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Services/BTS_Services/Table_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';

bool expanded = true;

class TableCardonline extends StatefulWidget {
  var thistable;

  TableCardonline({super.key, required this.thistable});

  @override
  State<TableCardonline> createState() => _TableCardonlineState();
}

class _TableCardonlineState extends State<TableCardonline> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          setState(() {
            expanded = !expanded;
          });
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Color(0xA9D9D9D9),
          child: Column(children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.thistable['user']['name'].toString().isEmpty
                                ? " "
                                : widget.thistable['user']['name']['firstName'].toString()+" "+widget.thistable['user']['name']['lastName'].toString(),
                            style: GoogleFonts.sairaCondensed(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Colors.black),
                          ),
                          Text(
                            widget.thistable['send_to']['phoneNumber'] == null
                                ? " "
                                : widget.thistable['send_to']['phoneNumber'].toString(),
                            style: GoogleFonts.sairaCondensed(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          Text(
                            widget.thistable['send_to']['email'] == null
                                ? " "
                                : widget.thistable['send_to']['email'].toString(),
                            style: GoogleFonts.sairaCondensed(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          Text(
                            widget.thistable['cover'] == null
                                ? "Cover Coins :-"
                                : "Cover Coins :-${widget.thistable['cover']}",
                            style: GoogleFonts.sairaCondensed(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: golden),
                          ),
                          Text(
                            widget.thistable['total'] == null
                                ? "₹ "
                                : "₹${widget.thistable['total']}",
                            style: GoogleFonts.sairaCondensed(
                                fontWeight: FontWeight.w600,
                                fontSize: 28,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.thistable['date'].toString().substring(0,10),
                            style: GoogleFonts.sairaCondensed(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: golden),
                          ),
                          Text(
                            widget.thistable['time'].toString(),
                            style: GoogleFonts.sairaCondensed(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: golden),
                          ),
                          // Row(
                          //   children: [
                          //     const Icon(Icons.account_circle_outlined),
                          //     Text(
                          //       widget.thistable['number_of_people'].toString(),
                          //       style: GoogleFonts.sairaCondensed(
                          //           fontWeight: FontWeight.w600,
                          //           fontSize: 28,
                          //           color: Colors.black),
                          //     ),
                          //   ],
                          // ),
                          // Text(
                          //   widget.thistable['table_number'] == null
                          //       ? "Table Number:- "
                          //       : "Table Number:- ${widget.thistable['table_number']}",
                          //   style: GoogleFonts.sairaCondensed(
                          //       fontWeight: FontWeight.w600,
                          //       fontSize: 15,
                          //       color: Colors.black),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [],
                  ),
                )
              ]),
            ),
            expanded
                ?widget.thistable['isValid']=="pending"? Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: InkWell(
                            onTap: () {
                              BTStable.accepttableTickets(
                                  context: context,
                                  orderid: widget.thistable['_id']);
                            },
                            child: Container(
                              height: 40,
                              width: 130,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("Accept")),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: const Color(0xFF7BC598),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: InkWell(onTap: () {
                              BTStable.declinetableTickets(
                                  context: context,
                                  orderid: widget.thistable['_id']);
                            },
                            child: Container(
                              height: 40,
                              width: 130,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("Decline")),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: const Color(0xFFB06B6B),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ):Center(
                          child: InkWell(
                            onTap: () {
                              
                            },
                            child: Container(
                              height: 40,
                              width: 130,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("Accepted")),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: const Color(0xFF7BC598),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        )
                : Container()
          ]),
        ),
      ),
    );
  }
}
