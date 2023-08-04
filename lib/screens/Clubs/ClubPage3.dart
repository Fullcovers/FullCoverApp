import 'package:easy_upi_payment/easy_upi_payment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:upi_india/upi_india.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Models/Ticket.dart';
import 'package:venq_assessment/Models/UserModel.dart';
import 'package:venq_assessment/Services/Order_Services.dart';
import 'package:venq_assessment/Services/User_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Bookings/MyBookingPage.dart';
import 'package:venq_assessment/screens/Clubs/transtion.dart';
import 'package:venq_assessment/screens/Clubs/upi.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/CustumPageRoute.dart';

class ClubPage3 extends StatefulWidget {
  ClubPage3(
      {super.key,
      required this.bookingtable,
      required this.time,
      required this.club,
      required this.orderticketscount,
      required this.tableticketscount,
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
      required this.promopersent,
      required this.year,
      required this.thisuser,
      required this.stagid,
      required this.coupleid,
      required this.femaleid,
      required this.totalpricewithoutcode,
      required this.promocode});
  UserData thisuser;
  Map<Ticket, int> orderticketscount;
  Map<Ticket, int> tableticketscount;
  String time;
  bool bookingtable;
  String promocode;
  int promopersent;
  int stagcount;
  ClubModel club;
  int stagentryprice;
  int couplecount;
  int coupleentrypricce;
  int femalecount;
  int femaleentryprice;
  double totalprice;
  double totalpricewithoutcode;
  String weekday;
  int date;
  String month;
  int year;
  String stagid;
  String coupleid;
  String femaleid;
  @override
  State<ClubPage3> createState() => _ClubPage3State();
}

class _ClubPage3State extends State<ClubPage3> {
  @override
  List<UpiApp>? apps;
  UpiIndia _upiIndia = UpiIndia();

  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  PanelController panelController = PanelController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "sauravsk4@axl",
      receiverName: 'Saurav Kamtalwar',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: 1.00,
    );
  }

// Format the date as per your desired format
  String formattedDate = DateFormat('M/dd/yyyy').format(DateTime.now());
  bool isclickpay = false;
  @override
  Widget build(BuildContext context) {
    phoneController.text = widget.thisuser.phoneNumber;
    emailController.text = widget.thisuser.email;
    double clubpersent = 0;
    double gst18 = widget.totalprice * clubpersent * 18 / 10000;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(40.0),
      topRight: Radius.circular(40.0),
    );
    return SafeArea(
        child: Stack(
      children: [
        Image.asset(
          Constants.backgroundimage,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: backgroundColortransperent,
            body: SlidingUpPanel(
              borderRadius: radius,
              minHeight: height / 10,
              maxHeight: height / 1.65,
              controller: panelController,
              defaultPanelState: PanelState.CLOSED,
              panelSnapping: false,
              collapsed: Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Color(0XFFD9D9D9),
                    borderRadius: BorderRadius.only(
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
                          //             color: const Color(0XFF222222),
                          //             fontSize: height / 54.1875,
                          //             fontWeight: FontWeight.w600),
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.only(left: 20.0),
                          //       child: Text(
                          //         "Google Pay",
                          //         style: GoogleFonts.sairaCondensed(
                          //             color: const Color(0XFF222222),
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
                          //     color: Colors.black,
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Container(
                              height: height / 19,
                              width: width / 2.163157894736842,
                              decoration: BoxDecoration(
                                  color: golden,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isclickpay = true;
                                    });
                                    Future.delayed(Duration(milliseconds: 2000),
                                        () {
                                      setState(() {
                                        isclickpay = false;
                                      });
                                    });
                                    if (widget.bookingtable) {
                                      print(widget.bookingtable);
                                      List<Map<String, dynamic>> tablestickets =
                                          [];
                                      // for (var i = 0; i < widget.tableticketscount.length; i++) {

                                      //   if (widget.stagcount > 0) {
                                      //   tickets.add({
                                      //     "qty": widget.stagcount,
                                      //     "ticket": widget.stagid
                                      //   });
                                      // }
                                      // }
                                      widget.tableticketscount
                                          .forEach((ticket, count) {
                                        if (count > 0) {
                                          tablestickets.add({
                                            "qty": count,
                                            "table": ticket.id
                                          });
                                        }
                                      });
                                      Map<String, dynamic> requestBody = {
                                        "tables": tablestickets,
                                        "send_to": {
                                          "phoneNumber": phoneController.text,
                                          "email": emailController.text
                                        },
                                        "club": widget.club.id,
                                        "date": formattedDate,
                                        // "promo_code": widget.promocode,
                                        "amount": 1
                                        // widget.totalprice +
                                        //     widget.totalprice * 4 / 100 +
                                        //     gst18.floor()
                                      };
                                      OrderServices.placetableOrder(
                                          context: context,
                                          requestbody: requestBody);
                                    } else {
                                      List<Map<String, dynamic>> ordertickets =
                                          [];
                                      print(widget.stagcount);
                                      widget.orderticketscount
                                          .forEach((ticket, count) {
                                        if (count > 0) {
                                          ordertickets.add({
                                            "qty": count,
                                            "ticket": ticket.id
                                          });
                                        }
                                      });
                                      // if (widget.stagcount > 0) {
                                      //   tickets.add({
                                      //     "qty": widget.stagcount,
                                      //     "ticket": widget.stagid
                                      //   });
                                      // }

                                      // if (widget.couplecount > 0) {
                                      //   tickets.add({
                                      //     "qty": widget.couplecount,
                                      //     "ticket": widget.coupleid
                                      //   });
                                      // }

                                      // if (widget.femalecount > 0) {
                                      //   tickets.add({
                                      //     "qty": widget.femalecount,
                                      //     "ticket": widget.femaleid
                                      //   });
                                      // }
                                      print(formattedDate);
                                      Map<String, dynamic> requestBody = {
                                        "tickets": ordertickets,
                                        "send_to": {
                                          "phoneNumber": phoneController.text,
                                          "email": emailController.text
                                        },
                                        "club": widget.club.id,
                                        "date": formattedDate,
                                        // "promo_code": widget.promocode,
                                        "amount": 1
                                        // widget.totalprice +
                                        //     widget.totalprice * 4 / 100 +
                                        //     gst18.floor()
                                      };
                                      OrderServices.placeOrder(
                                          context: context,
                                          requestbody: requestBody);
                                    }
                                  },
                                  child: !isclickpay
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Pay at Venue",
                                              style: GoogleFonts.sairaCondensed(
                                                  color:
                                                      const Color(0XFF222222),
                                                  fontSize: height / 43.35,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              (widget.totalprice +
                                                      widget.totalpricewithoutcode *
                                                          clubpersent /
                                                          100 +
                                                      gst18.floor())
                                                  .toString(),
                                              style: GoogleFonts.sairaCondensed(
                                                  color:
                                                      const Color(0XFF222222),
                                                  fontSize: height / 28.9,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        )
                                      : CircularProgressIndicator(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              panel: Container(
                color: offwhite,
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
                                          color: Colors.black)),
                                  Text("Rs.${widget.totalprice}",
                                      style: GoogleFonts.sairaCondensed(
                                          fontWeight: FontWeight.w800,
                                          fontSize: width / 14.67857142857143,
                                          color: Colors.black))
                                ],
                              ),
                            ),
                            widget.bookingtable
                                ? ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: widget.tableticketscount.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var tables = widget
                                          .tableticketscount.entries
                                          .toList();
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: width / 20,
                                            right: width / 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "${tables[index].key.name}*${tables[index].value}",
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: width /
                                                            22.83333333333333,
                                                        color: Colors.black)),
                                            Text(
                                                "Rs.${tables[index].value * tables[index].key.current}",
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: width /
                                                            22.83333333333333,
                                                        color: Colors.black))
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                : ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: widget.orderticketscount.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var order = widget
                                          .orderticketscount.entries
                                          .toList();
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: width / 20,
                                            right: width / 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "${order[index].key.name}*${order[index].value}",
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: width /
                                                            22.83333333333333,
                                                        color: Colors.black)),
                                            Text(
                                                "Rs.${order[index].value * order[index].key.current}",
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: width /
                                                            22.83333333333333,
                                                        color: Colors.black))
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width / 20, right: width / 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.promocode,
                                      style: GoogleFonts.sairaCondensed(
                                          fontWeight: FontWeight.w600,
                                          fontSize: width / 22.83333333333333,
                                          color: Colors.black)),
                                  Text(
                                      (widget.promocode.isNotEmpty)
                                          ? widget.promopersent.toString()
                                          : "",
                                      style: GoogleFonts.sairaCondensed(
                                          fontWeight: FontWeight.w600,
                                          fontSize: width / 22.83333333333333,
                                          color: Colors.black))
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
                                color: Color(0xFFA0A0A0),
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
                                        color: Colors.black)),
                                Text(
                                    "Rs.${widget.totalpricewithoutcode * clubpersent / 100 + gst18.floor()}",
                                    style: GoogleFonts.sairaCondensed(
                                        fontWeight: FontWeight.w800,
                                        fontSize: width / 14.67857142857143,
                                        color: Colors.black))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Integrated GST (IGST) 18%",
                                    style: GoogleFonts.sairaCondensed(
                                        fontWeight: FontWeight.w800,
                                        fontSize: width / 27.4,
                                        color: Colors.black)),
                                Text("Rs.${gst18.floor()}",
                                    style: GoogleFonts.sairaCondensed(
                                        fontWeight: FontWeight.w800,
                                        fontSize: width / 27.4,
                                        color: Colors.black))
                              ],
                            ),
                          ],
                        ),
                      ),
                      widget.bookingtable
                          ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.tableticketscount.length,
                              itemBuilder: (BuildContext context, int index) {
                                var tables =
                                    widget.tableticketscount.entries.toList();
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: width / 20, right: width / 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "${tables[index].key.name}*${tables[index].value}",
                                          style: GoogleFonts.sairaCondensed(
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  width / 22.83333333333333,
                                              color: Colors.black)),
                                      Text(
                                          "Rs.${tables[index].value * tables[index].key.current * clubpersent / 100}",
                                          style: GoogleFonts.sairaCondensed(
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  width / 22.83333333333333,
                                              color: Colors.black))
                                    ],
                                  ),
                                );
                              },
                            )
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: widget.orderticketscount.length,
                              itemBuilder: (BuildContext context, int index) {
                                var orders =
                                    widget.orderticketscount.entries.toList();
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: width / 20, right: width / 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "${orders[index].key.name}*${orders[index].value}",
                                          style: GoogleFonts.sairaCondensed(
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  width / 22.83333333333333,
                                              color: Colors.black)),
                                      Text(
                                          "Rs.${orders[index].value * orders[index].key.current * clubpersent / 100}",
                                          style: GoogleFonts.sairaCondensed(
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  width / 22.83333333333333,
                                              color: Colors.black))
                                    ],
                                  ),
                                );
                              },
                            ),
                      // : Column(
                      //     children: [
                      //       Padding(
                      //         padding: EdgeInsets.only(
                      //             top: height / 80,
                      //             left: width / 20,
                      //             right: width / 20),
                      //         child: Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text("Stag*${widget.stagcount}",
                      //                 style: GoogleFonts.sairaCondensed(
                      //                     fontWeight: FontWeight.w600,
                      //                     fontSize:
                      //                         width / 22.83333333333333,
                      //                     color: Colors.black)),
                      //             Text(
                      //                 "Rs.${(widget.stagentryprice * widget.stagcount) * clubpersent / 100}",
                      //                 style: GoogleFonts.sairaCondensed(
                      //                     fontWeight: FontWeight.w600,
                      //                     fontSize:
                      //                         width / 22.83333333333333,
                      //                     color: Colors.black))
                      //           ],
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsets.only(
                      //             left: width / 20, right: width / 20),
                      //         child: Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text("Couple*${widget.couplecount}",
                      //                 style: GoogleFonts.sairaCondensed(
                      //                     fontWeight: FontWeight.w600,
                      //                     fontSize:
                      //                         width / 22.83333333333333,
                      //                     color: Colors.black)),
                      //             Text(
                      //                 "Rs.${widget.coupleentrypricce * widget.couplecount * clubpersent / 100}",
                      //                 style: GoogleFonts.sairaCondensed(
                      //                     fontWeight: FontWeight.w600,
                      //                     fontSize:
                      //                         width / 22.83333333333333,
                      //                     color: Colors.black))
                      //           ],
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsets.only(
                      //             left: width / 20, right: width / 20),
                      //         child: Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Text("Female*${widget.femalecount}",
                      //                 style: GoogleFonts.sairaCondensed(
                      //                     fontWeight: FontWeight.w600,
                      //                     fontSize:
                      //                         width / 22.83333333333333,
                      //                     color: Colors.black)),
                      //             Text(
                      //                 "Rs.${widget.femaleentryprice * widget.femalecount * clubpersent / 100}",
                      //                 style: GoogleFonts.sairaCondensed(
                      //                     fontWeight: FontWeight.w600,
                      //                     fontSize:
                      //                         width / 22.83333333333333,
                      //                     color: Colors.black))
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      const Divider(
                        height: 2,
                        thickness: 2,
                        indent: 2,
                        endIndent: 0,
                        color: Color(0xFFA0A0A0),
                      ),
                      Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: offwhite,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Column(
                                  //   crossAxisAlignment:
                                  //       CrossAxisAlignment.start,
                                  //   children: [
                                  //     Padding(
                                  //       padding: EdgeInsets.only(
                                  //           left: width / 20.55, top: 0.0),
                                  //       child: Text(
                                  //         "Pay Using",
                                  //         style: GoogleFonts.sairaCondensed(
                                  //             color: const Color(0XFF222222),
                                  //             fontSize: width / 25.6875,
                                  //             fontWeight: FontWeight.w600),
                                  //       ),
                                  //     ),
                                  //     Padding(
                                  //       padding:
                                  //           const EdgeInsets.only(left: 20.0),
                                  //       child: Text(
                                  //         "Google Pay",
                                  //         style: GoogleFonts.sairaCondensed(
                                  //             color: const Color(0XFF222222),
                                  //             fontSize:
                                  //                 width / 15.80769230769231,
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
                                  //     height: height / 12,
                                  //     width: 1.5,
                                  //     color: Colors.black,
                                  //   ),
                                  // ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Container(
                                      height: height / 19.26666666666667,
                                      width: width / 2.163157894736842,
                                      decoration: BoxDecoration(
                                          color: const Color(0XFFB59F68),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: Center(
                                        child: InkWell(
                                          onTap: () async {
                                            print(
                                                "00000000000000000000000000000000000000000000000000000000000000000000000000000");

                                            setState(() {
                                              isclickpay = true;
                                            });
                                            Future.delayed(
                                                Duration(milliseconds: 2000),
                                                () {
                                              setState(() {
                                                isclickpay = false;
                                              });
                                            });
                                            dynamic res;
                                            try {
                                              res = await EasyUpiPaymentPlatform
                                                  .instance
                                                  .startPayment(
                                                const EasyUpiPaymentModel(
                                                  payeeVpa:
                                                      'paytmqres5fxe7fay@paytm',
                                                  payeeName: 'saurav kamtalwar',
                                                  amount: 10.0,
                                                  description: 'club booking',
                                                ),
                                              );

                                            } on EasyUpiPaymentException catch (e) {
                                              print("error");
                                              print(e.details);
                                              print(e.message);
                                              print(e.stacktrace);
                                              print(e.type);
                                            }
                                            // Navigator.of(context).push(
                                            //     ScaleTransitionPageRoute(
                                            //         child: Upipayf()));
                                            

                                            // if (res!.responseCode == 00) {
                                            //   if (widget.bookingtable) {
                                            //     print(widget.bookingtable);
                                            //     List<Map<String, dynamic>>
                                            //         tablestickets = [];
                                            //     // for (var i = 0; i < widget.tableticketscount.length; i++) {

                                            //     //   if (widget.stagcount > 0) {
                                            //     //   tickets.add({
                                            //     //     "qty": widget.stagcount,
                                            //     //     "ticket": widget.stagid
                                            //     //   });
                                            //     // }
                                            //     // }
                                            //     widget.tableticketscount
                                            //         .forEach((ticket, count) {
                                            //       if (count > 0) {
                                            //         tablestickets.add({
                                            //           "qty": count,
                                            //           "table": ticket.id
                                            //         });
                                            //       }
                                            //     });
                                            //     Map<String, dynamic>
                                            //         requestBody = {
                                            //       "tables": tablestickets,
                                            //       "send_to": {
                                            //         "phoneNumber":
                                            //             phoneController.text,
                                            //         "email":
                                            //             emailController.text
                                            //       },
                                            //       "club": widget.club.id,
                                            //       "date": formattedDate,
                                            //       // "promo_code": widget.promocode,
                                            //       "amount": 1
                                            //       // widget.totalprice +
                                            //       //     widget.totalprice * 4 / 100 +
                                            //       //     gst18.floor()
                                            //     };
                                            //     OrderServices.placetableOrder(
                                            //         context: context,
                                            //         requestbody: requestBody);
                                            //   } else {
                                            //     List<Map<String, dynamic>>
                                            //         ordertickets = [];
                                            //     print(widget.stagcount);
                                            //     widget.orderticketscount
                                            //         .forEach((ticket, count) {
                                            //       if (count > 0) {
                                            //         ordertickets.add({
                                            //           "qty": count,
                                            //           "ticket": ticket.id
                                            //         });
                                            //       }
                                            //     });
                                            //     // if (widget.stagcount > 0) {
                                            //     //   tickets.add({
                                            //     //     "qty": widget.stagcount,
                                            //     //     "ticket": widget.stagid
                                            //     //   });
                                            //     // }

                                            //     // if (widget.couplecount > 0) {
                                            //     //   tickets.add({
                                            //     //     "qty": widget.couplecount,
                                            //     //     "ticket": widget.coupleid
                                            //     //   });
                                            //     // }

                                            //     // if (widget.femalecount > 0) {
                                            //     //   tickets.add({
                                            //     //     "qty": widget.femalecount,
                                            //     //     "ticket": widget.femaleid
                                            //     //   });
                                            //     // }
                                            //     print(formattedDate);
                                            //     Map<String, dynamic>
                                            //         requestBody = {
                                            //       "tickets": ordertickets,
                                            //       "send_to": {
                                            //         "phoneNumber":
                                            //             phoneController.text,
                                            //         "email":
                                            //             emailController.text
                                            //       },
                                            //       "club": widget.club.id,
                                            //       "date": formattedDate,
                                            //       // "promo_code": widget.promocode,
                                            //       "amount": 1
                                            //       // widget.totalprice +
                                            //       //     widget.totalprice * 4 / 100 +
                                            //       //     gst18.floor()
                                            //     };
                                            //     OrderServices.placeOrder(
                                            //         context: context,
                                            //         requestbody: requestBody);
                                            //   }
                                            // }
                                          },
                                          child: !isclickpay
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      "Pay",
                                                      style: GoogleFonts
                                                          .sairaCondensed(
                                                              color: const Color(
                                                                  0XFF222222),
                                                              fontSize: height /
                                                                  43.35,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                    FractionalTranslation(
                                                      translation: height < 700
                                                          ? const Offset(
                                                              0, -0.2)
                                                          : const Offset(0, 0),
                                                      child: Text(
                                                        (widget.totalprice +
                                                                widget.totalpricewithoutcode *
                                                                    clubpersent /
                                                                    100 +
                                                                gst18.floor())
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .sairaCondensed(
                                                                color: const Color(
                                                                    0XFF222222),
                                                                fontSize:
                                                                    width /
                                                                        13.7,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : CircularProgressIndicator(),
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
              body: Stack(
                children: [
                  Column(children: [
                    Container(
                      height: height / 4,
                      width: double.maxFinite,
                      decoration: BoxDecoration(color: botoncolor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: height / 43.35,
                                            left: width / 20.55),
                                        child: Text(
                                          widget.club.name,
                                          style: GoogleFonts.bebasNeue(
                                            color: const Color(0XFFF0F0F3),
                                            fontSize:
                                                height / 24.77142857142857,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: height / 43.35,
                                            left: width / 20.55),
                                        child: Text(
                                          "Pune",
                                          style: GoogleFonts.sairaCondensed(
                                            color: const Color(0XFFB59F68),
                                            fontSize: height / 54.1875,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon:
                                        const Icon(Icons.location_on_outlined),
                                  ),
                                  Container(
                                    width: width / 1.2,
                                    child: Text(
                                      textAlign: TextAlign.left,
                                      widget.club.address,
                                      style: GoogleFonts.sairaCondensed(
                                        fontSize: height / 61.92857142857143,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0XFFBCBCBC),
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
                                        color: const Color(0XFFB59F68),
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
                                        color: const Color(0XFFFFFFFF),
                                        fontSize: height / 61.92857142857143,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // FractionalTranslation(
                          //   translation: const Offset(1.5, -1),
                          //   child: IconButton(
                          //       onPressed: () {},
                          //       icon: const Icon(
                          //         Icons.close,
                          //         size: 24,
                          //         color: Color(0XFFF0F0F3),
                          //       )),
                          // )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 40.0, right: 40.0),
                      child: Container(
                        height: height / 4,
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Where should we send you tickets",
                              style: GoogleFonts.sairaCondensed(
                                color: const Color(0XFFFFFFFF),
                                fontSize: height / 43.35,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              child: Container(
                                height: height / 15,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF2C2F33),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Colors.white,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: SingleChildScrollView(
                                    child: Container(
                                      height: height / 15,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF2C2F33),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        children: [
                                          FractionalTranslation(
                                            translation: const Offset(0, -0.5),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(
                                                '+91',
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                  color:
                                                      const Color(0XFFFFFFFF),
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
                                              translation:
                                                  const Offset(0, -0.32),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: TextFormField(
                                                  controller: phoneController,
                                                  style: GoogleFonts
                                                      .sairaCondensed(
                                                    color:
                                                        const Color(0XFFFFFFFF),
                                                    fontSize: height / 43.35,
                                                  ),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  decoration: InputDecoration(
                                                    hintText: 'Phone Number',
                                                    hintStyle: GoogleFonts
                                                        .sairaCondensed(
                                                      color: const Color(
                                                          0XFFFFFFFF),
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
                                  color: const Color(0xFF2C2F33),
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: Colors.white,
                                  )),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                      color: const Color(0XFFFFFFFF),
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
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => MyBookingPage()),
                            (route) => false);
                      },
                    ),
                  ),
                ],
              ),
            )),
      ],
    ));
  }
}
