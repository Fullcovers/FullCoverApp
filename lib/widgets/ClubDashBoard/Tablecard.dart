import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Styles/Colors.dart';
bool expanded = false;


class TableCard extends StatefulWidget {
  var thistable;
   TableCard({super.key,required this.thistable});

  @override
  State<TableCard> createState() => _TableCardState();
}

class _TableCardState extends State<TableCard> {
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
                          widget.thistable['name'].toString(),
                          style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Colors.black),
                        ),
                        Text(
                          widget.thistable['phone'].toString(),
                          style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        Text(
                          widget.thistable['email'].toString(),
                          style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        Text(
                          "Cover Coins :-"+widget.thistable['cover'].toString(),
                          style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: golden),
                        ),
                        Text(
                          
                         "₹"+ widget.thistable['price'].toString(),
                          style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.thistable['date'].toString(),
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
                        Row(
                      children: [
                        Icon(Icons.account_circle_outlined),
                        Text(
                          widget.thistable['number_of_people'].toString(),
                          style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Text(
                          "Table Number:- "+widget.thistable['table_number'].toString(),
                          style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Text(
                    //   "₹1,00,000",
                    //   style: GoogleFonts.sairaCondensed(
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: 28,
                    //       color: Colors.black),
                    // ),
                    
                  ],
                ),
              )
            ]),
          ),
          // expanded
          //     ? Padding(
          //         padding: const EdgeInsets.only(top: 4.0, bottom: 4),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             Center(
          //               child: Container(
          //                 height: 40,
          //                 width: 130,
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Center(child: Text("Accept")),
          //                 ),
          //                 decoration: BoxDecoration(
          //                   border: Border.all(),
          //                   color: const Color(0xFF7BC598),
          //                   borderRadius: BorderRadius.circular(20.0),
          //                 ),
          //               ),
          //             ),
          //             Center(
          //               child: Container(
          //                 height: 40,
          //                 width: 130,
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: Center(child: Text("Decline")),
          //                 ),
          //                 decoration: BoxDecoration(
          //                   border: Border.all(),
          //                   color: const Color(0xFFB06B6B),
          //                   borderRadius: BorderRadius.circular(20.0),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       )
          //     : Container()
        ]),
      ),
    ),
  );
  }
}