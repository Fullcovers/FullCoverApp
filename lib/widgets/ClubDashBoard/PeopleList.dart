import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:venq_assessment/Styles/Colors.dart';

class PeopleList extends StatefulWidget {
  var orders;int count;
  PeopleList({super.key,  required this.orders,required this.count});

  @override
  State<PeopleList> createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  int selectedCardIndex = -1;
  bool isDropdownVisible = false;

  @override
  Widget build(BuildContext context) {
    int moneyint = 2000;
    final indianCurrencyFormat =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);
    final formattedAmount = indianCurrencyFormat.format(moneyint);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
      child: Container(
        height: 4 * height / 8,
        width: width,
        decoration:  BoxDecoration(color: backgroundColortransperent),
        child: ListView.builder(
          itemCount: widget.count,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedCardIndex == index) {
                          selectedCardIndex =
                              -1; // Deselect if already selected
                          isDropdownVisible = false;
                        } else {
                          selectedCardIndex = index; // Select the tapped card
                          isDropdownVisible = true;
                        }
                      });
                    },
                    child: Card(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        height: height / 15,
                        width: width,
                        decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius:
                                isDropdownVisible && index == selectedCardIndex
                                    ? const BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15.0),
                                      )
                                    : BorderRadius.circular(20.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                widget.orders[index]['user']['name']
                                            ['firstName']
                                        .toString() +
                                    " " +
                                    widget.orders[index]['user']['name']
                                        ['lastName'],
                                style: GoogleFonts.sairaCondensed(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                "₹"+widget.orders[index]['total'].toString(),
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                if (isDropdownVisible &&
                    index == selectedCardIndex) // Add this condition
                  FractionalTranslation(
                    translation: const Offset(0, -0.07),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Card(
                        color: const Color.fromRGBO(217, 217, 217, 0.33),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                        ),
                        child: Container(
                          height: height / 7,
                          width: width,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(217, 217, 217, 0.33),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tickets",
                                      style: GoogleFonts.sairaCondensed(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    widget.orders[index]['items'].length == 1
                                        ? Text(
                                            widget.orders[index]['items'][0]
                                                    ['ticket']['name'] +
                                                " x" +
                                                widget.orders[index]['items'][0]
                                                        ['qty']
                                                    .toString(),
                                            style: GoogleFonts.sairaCondensed(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          )
                                        : widget.orders[index]['items']
                                                    .length ==
                                                2
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.orders[index]
                                                                ['items'][0]
                                                            ['ticket']['name'] +
                                                        " x" +
                                                        widget.orders[index]
                                                                ['items'][0]
                                                                ['qty']
                                                            .toString(),
                                                    style: GoogleFonts
                                                        .sairaCondensed(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    widget.orders[index]
                                                                ['items'][1]
                                                            ['ticket']['name'] +
                                                        " x" +
                                                        widget.orders[index]
                                                                ['items'][1]
                                                                ['qty']
                                                            .toString(),
                                                    style: GoogleFonts
                                                        .sairaCondensed(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              )
                                            : Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.orders[index]
                                                                ['items'][0]
                                                            ['ticket']['name'] +
                                                        " x" +
                                                        widget.orders[index]
                                                                ['items'][0]
                                                                ['qty']
                                                            .toString(),
                                                    style: GoogleFonts
                                                        .sairaCondensed(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    widget.orders[index]
                                                                ['items'][1]
                                                            ['ticket']['name'] +
                                                        " x" +
                                                        widget.orders[index]
                                                                ['items'][1]
                                                                ['qty']
                                                            .toString(),
                                                    style: GoogleFonts
                                                        .sairaCondensed(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    widget.orders[index]
                                                                ['items'][2]
                                                            ['ticket']['name'] +
                                                        " x" +
                                                        widget.orders[index]
                                                                ['items'][2]
                                                                ['qty']
                                                            .toString(),
                                                    style: GoogleFonts
                                                        .sairaCondensed(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, top: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      widget.orders[index]['date']
                                          .toString()
                                          .substring(0, 10),
                                      style: GoogleFonts.sairaCondensed(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0XFFB59F68)),
                                    ),
                                    Text(
                                      widget.orders[index]['send_to']
                                          ['phoneNumber'],
                                      style: GoogleFonts.sairaCondensed(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      widget.orders[index]['send_to']['email'],
                                      style: GoogleFonts.sairaCondensed(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
