import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Models/Events.dart';
import 'package:venq_assessment/Styles/Colors.dart';

import '../../Services/Order_Services.dart';

class EventDetail3 extends StatefulWidget {
  EventDetail3(
      {super.key,
      required this.club,
      required this.event,
      required this.couplecount,
      required this.coupleentrypricce,
      required this.femalecount,
      required this.femaleentryprice,
      required this.stagcount,
      required this.stagentryprice,
      required this.totalprice,
      required this.date,
      required this.month,
      required this.weekday,
      required this.year,
      required this.stagid,
      required this.coupleid,
      required this.femaleid,
      required this.promocode});
  int stagcount;
  Event event;
  ClubModel club;
  int stagentryprice;
  int couplecount;
  int coupleentrypricce;
  int femalecount;
  int femaleentryprice;
  double totalprice;
  String weekday;
  int date;
  String month;
  int year;
  String stagid;
  String coupleid;
  String femaleid;
  String promocode;
  @override
  State<EventDetail3> createState() => _EventDetail3State();
}

class _EventDetail3State extends State<EventDetail3> {
  PanelController panelController = PanelController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double clubpersent = 0;
    String formattedDate = DateFormat('M/dd/yyyy').format(DateTime.now());

    double gst18 = widget.totalprice * clubpersent * 18 / 10000;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(40.0),
      topRight: Radius.circular(40.0),
    );
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: eventbackgroundcolor,
            body: SlidingUpPanel(
              borderRadius: radius,
              minHeight: height / 10,
              maxHeight: height / 1.65,
              controller: panelController,
              defaultPanelState: PanelState.CLOSED,
              panelSnapping: false,
              collapsed: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: backgroundColorfigma,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 3,
                          width: width / 4,
                          color: const Color(0XFFB59F68),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Padding(
                          //       padding:
                          //           const EdgeInsets.only(left: 20.0, top: 0.0),
                          //       child: Text(
                          //         "Pay Using",
                          //         style: GoogleFonts.sairaCondensed(
                          //             color: Colors.white,
                          //             fontSize: height / 54.1875,
                          //             fontWeight: FontWeight.w600),
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.only(left: 20.0),
                          //       child: Text(
                          //         "Google Pay",
                          //         style: GoogleFonts.sairaCondensed(
                          //             color: Colors.white,
                          //             fontSize: height / 33.34615384615385,
                          //             fontWeight: FontWeight.w600),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       left: width / 22.83333333333333,
                          //       top: height / 86.7),
                          //   child: Container(
                          //     height: height / 10,
                          //     width: 1.5,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(left: width / 13.7),
                            child: Container(
                              height: height / 19,
                              width: width / 2.163157894736842,
                              decoration: BoxDecoration(
                                  color: const Color(0XFFB59F68),
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: InkWell(
                                onTap: () {
                                  List<Map<String, dynamic>> tickets = [];

                                  if (widget.stagcount > 0) {
                                    tickets.add({
                                      "qty": widget.stagcount,
                                      "ticket": widget.stagid
                                    });
                                  }

                                  if (widget.couplecount > 0) {
                                    tickets.add({
                                      "qty": widget.couplecount,
                                      "ticket": widget.coupleid
                                    });
                                  }

                                  if (widget.femalecount > 0) {
                                    tickets.add({
                                      "qty": widget.femalecount,
                                      "ticket": widget.femaleid
                                    });
                                  }
                                  print(formattedDate);
                                  Map<String, dynamic> requestBody = {
                                    "tickets": tickets,
                                    "send_to": {
                                      "phoneNumber": phoneController.text,
                                      "email": emailController.text
                                    },
                                    "event": widget.event.id,
                                    "date": formattedDate,
                                    "promo_code": widget.promocode,
                                    "amount": 1
                                    // widget.totalprice +
                                    //     widget.totalprice * 4 / 100 +
                                    //     gst18.floor()
                                  };

                                  OrderServices.placeOrderforevent(
                                      context: context,
                                      requestbody: requestBody);
                                },
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Pay",
                                        style: GoogleFonts.sairaCondensed(
                                            color: offwhite,
                                            fontSize: height / 43.35,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        (widget.totalprice +
                                                widget.totalprice *
                                                    clubpersent /
                                                    100 +
                                                gst18.floor())
                                            .toString(),
                                        style: GoogleFonts.sairaCondensed(
                                            color: offwhite,
                                            fontSize: height / 28.9,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              panel: Container(
                color: backgroundColorfigma,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 3,
                          width: width / 4,
                          color: const Color(0XFFB59F68),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: height / 95),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width / 30, right: width / 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Passes",
                                      style: GoogleFonts.sairaCondensed(
                                          fontWeight: FontWeight.w800,
                                          fontSize: width / 14.67857142857143,
                                          color: offwhite)),
                                  Text("Rs.${widget.totalprice}",
                                      style: GoogleFonts.sairaCondensed(
                                          fontWeight: FontWeight.w800,
                                          fontSize: width / 14.67857142857143,
                                          color: offwhite))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width / 20, right: width / 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Stagx${widget.stagcount}",
                                      style: GoogleFonts.sairaCondensed(
                                          fontWeight: FontWeight.w600,
                                          fontSize: width / 22.83333333333333,
                                          color: offwhite)),
                                  Text(
                                      "Rs.${widget.stagentryprice * widget.stagcount}",
                                      style: GoogleFonts.sairaCondensed(
                                          fontWeight: FontWeight.w600,
                                          fontSize: width / 22.83333333333333,
                                          color: offwhite))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width / 20, right: width / 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Couplex${widget.couplecount}",
                                      style: GoogleFonts.sairaCondensed(
                                          fontWeight: FontWeight.w600,
                                          fontSize: width / 22.83333333333333,
                                          color: offwhite)),
                                  Text(
                                      "Rs.${widget.coupleentrypricce * widget.couplecount}",
                                      style: GoogleFonts.sairaCondensed(
                                          fontWeight: FontWeight.w600,
                                          fontSize: width / 22.83333333333333,
                                          color: offwhite))
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width / 20, right: width / 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Femalex${widget.femalecount}",
                                      style: GoogleFonts.sairaCondensed(
                                          fontWeight: FontWeight.w600,
                                          fontSize: width / 22.83333333333333,
                                          color: offwhite)),
                                  Text(
                                      "Rs.${widget.femaleentryprice * widget.femalecount}",
                                      style: GoogleFonts.sairaCondensed(
                                          fontWeight: FontWeight.w600,
                                          fontSize: width / 22.83333333333333,
                                          color: offwhite))
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Divider(
                                height: 2,
                                thickness: 2,
                                indent: 2,
                                endIndent: 0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 30, right: width / 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Convience Fees",
                                    style: GoogleFonts.sairaCondensed(
                                        fontWeight: FontWeight.w800,
                                        fontSize: width / 14.67857142857143,
                                        color: offwhite)),
                                Text(
                                    "Rs.${widget.totalprice * clubpersent / 100 + gst18.floor()}",
                                    style: GoogleFonts.sairaCondensed(
                                        fontWeight: FontWeight.w800,
                                        fontSize: width / 14.67857142857143,
                                        color: offwhite))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Integrated GST (IGST) 18%",
                                    style: GoogleFonts.sairaCondensed(
                                        fontWeight: FontWeight.w800,
                                        fontSize: width / 27.4,
                                        color: offwhite)),
                                Text("Rs.${gst18.floor()}",
                                    style: GoogleFonts.sairaCondensed(
                                        fontWeight: FontWeight.w800,
                                        fontSize: width / 27.4,
                                        color: offwhite))
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height / 80,
                            left: width / 20,
                            right: width / 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Stagx${widget.stagcount}",
                                style: GoogleFonts.sairaCondensed(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width / 22.83333333333333,
                                    color: offwhite)),
                            Text(
                                "Rs.${(widget.stagentryprice * widget.stagcount) * clubpersent / 100}",
                                style: GoogleFonts.sairaCondensed(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width / 22.83333333333333,
                                    color: offwhite))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Couplex${widget.couplecount}",
                                style: GoogleFonts.sairaCondensed(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width / 22.83333333333333,
                                    color: offwhite)),
                            Text(
                                "Rs.${widget.coupleentrypricce * widget.couplecount * clubpersent / 100}",
                                style: GoogleFonts.sairaCondensed(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width / 22.83333333333333,
                                    color: offwhite))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 20, right: width / 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Femalex${widget.femalecount}",
                                style: GoogleFonts.sairaCondensed(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width / 22.83333333333333,
                                    color: offwhite)),
                            Text(
                                "Rs.${widget.femaleentryprice * widget.femalecount * clubpersent / 100}",
                                style: GoogleFonts.sairaCondensed(
                                    fontWeight: FontWeight.w600,
                                    fontSize: width / 22.83333333333333,
                                    color: offwhite))
                          ],
                        ),
                      ),
                      const Divider(
                        height: 2,
                        thickness: 2,
                        indent: 2,
                        endIndent: 0,
                        color: Colors.white,
                      ),
                      Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: backgroundColorfigma,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: width / 20.55, top: 0.0),
                                        child: Text(
                                          "Pay Using",
                                          style: GoogleFonts.sairaCondensed(
                                              color: offwhite,
                                              fontSize: width / 25.6875,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          "Google Pay",
                                          style: GoogleFonts.sairaCondensed(
                                              color: offwhite,
                                              fontSize:
                                                  width / 15.80769230769231,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width / 22.83333333333333,
                                        top: height / 86.7),
                                    child: Container(
                                      height: height / 12,
                                      width: 1.5,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30.0),
                                    child: Container(
                                      height: height / 19.26666666666667,
                                      width: width / 2.163157894736842,
                                      decoration: BoxDecoration(
                                          color: const Color(0XFFB59F68),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Pay",
                                              style: GoogleFonts.sairaCondensed(
                                                  color:
                                                      const Color(0XFF222222),
                                                  fontSize: height / 43.35,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            FractionalTranslation(
                                              translation: height < 700
                                                  ? const Offset(0, -0.2)
                                                  : const Offset(0, 0),
                                              child: Text(
                                                (widget.totalprice +
                                                        widget.totalprice *
                                                            clubpersent /
                                                            100 +
                                                        gst18.floor())
                                                    .toString(),
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                        color: const Color(
                                                            0XFF222222),
                                                        fontSize: width / 13.7,
                                                        fontWeight:
                                                            FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ]),
              ),
              body: Column(children: [
                Container(
                  height: height / 4,
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: offwhite),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: height / 43.35, left: width / 20.55),
                                child: Text(
                                  widget.club.name,
                                  style: GoogleFonts.bebasNeue(
                                    color: backgroundColorfigma,
                                    fontSize: height / 24.77142857142857,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: height / 43.35, left: width / 20.55),
                                child: Text(
                                  widget.club.daddress.city,
                                  style: GoogleFonts.sairaCondensed(
                                    color: golden,
                                    fontSize: height / 54.1875,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.location_on_outlined),
                              ),
                              FractionalTranslation(
                                translation: const Offset(0, 0),
                                child: Container(
                                  width: width / 1.2,
                                  child: Text(
                                    textAlign: TextAlign.left,
                                    widget.club.address,
                                    style: GoogleFonts.sairaCondensed(
                                      fontSize: height / 61.92857142857143,
                                      fontWeight: FontWeight.w600,
                                      color: backgroundColorfigma,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 0.0, left: width / 20.55),
                                child: Text(
                                  "${widget.weekday} ${widget.date} ${widget.month}, ${widget.year}",
                                  style: GoogleFonts.sairaCondensed(
                                    color: golden,
                                    fontSize: width / 20.55,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width / 20.55, top: 0.0),
                                child: Text(
                                  "${widget.club.timings.opensAt != '' ? "${widget.club.timings.opensAt} Hrs" : '19:00 Hrs'} - ${widget.club.timings.closesAt != '' ? "${widget.club.timings.closesAt} Hrs" : "23.45 Hrs"}",
                                  style: GoogleFonts.sairaCondensed(
                                    color: backgroundColorfigma,
                                    fontSize: height / 61.92857142857143,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height / 43.35,
                      bottom: height / 43.35,
                      left: width / 10.275,
                      right: width / 10.275),
                  child: Container(
                    height: height / 4,
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Where should we send you tickets",
                          style: GoogleFonts.sairaCondensed(
                            color: backgroundColorfigma,
                            fontSize: height / 43.35,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: Container(
                            height: height / 15,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: offwhite,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  width: 3,
                                  color: backgroundColorfigma,
                                )),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: SingleChildScrollView(
                                child: Container(
                                  height: height / 15,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: offwhite,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Row(
                                    children: [
                                      FractionalTranslation(
                                        translation: const Offset(0, -0.5),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            '+91',
                                            style: GoogleFonts.sairaCondensed(
                                              color: backgroundColorfigma,
                                              fontSize: height / 43.35,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const VerticalDivider(
                                        color: Color(0XFF494E58),
                                        thickness: 1,
                                      ),
                                      Expanded(
                                        child: FractionalTranslation(
                                          translation: const Offset(0, -0.32),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: TextFormField(
                                              controller: phoneController,
                                              style: GoogleFonts.sairaCondensed(
                                                color: const Color(0XFFFFFFFF),
                                                fontSize: height / 43.35,
                                              ),
                                              keyboardType: TextInputType.phone,
                                              decoration: InputDecoration(
                                                hintText: 'Phone Number',
                                                hintStyle:
                                                    GoogleFonts.sairaCondensed(
                                                  color: backgroundColorfigma,
                                                ),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height / 15,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: offwhite,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 3,
                                color: backgroundColorfigma,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              controller: emailController,
                              style: GoogleFonts.sairaCondensed(
                                color: const Color(0XFFFFFFFF),
                                fontSize: height / 43.35,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: GoogleFonts.sairaCondensed(
                                  color: backgroundColorfigma,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            )));
    ;
  }
}
