import 'dart:async';

import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:venq_assessment/Models/Order.dart';
import 'package:venq_assessment/Providers/OrderProvider.dart';
import 'package:venq_assessment/Providers/TicketProvider.dart';
import 'package:venq_assessment/Providers/UserProvider.dart';
import 'package:venq_assessment/Services/Auth_Services.dart';
import 'package:venq_assessment/Services/Order_Services.dart';
import 'package:venq_assessment/Services/Ticket_Services.dart';
import 'package:venq_assessment/Services/User_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/Styles/Radius.dart';
import 'package:venq_assessment/widgets/BookingScreen/Balancecard.dart';
import 'package:venq_assessment/widgets/BookingScreen/FooterButtons.dart';
import 'package:venq_assessment/widgets/BookingScreen/NewBookings.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/BottonNavBar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyBookingPage extends StatefulWidget {
  MyBookingPage({super.key});

  @override
  State<MyBookingPage> createState() => _MyBookingPageState();
}

class _MyBookingPageState extends State<MyBookingPage> {
  List<OrderModel> orders = [];
  bool iscolorchange = false;
  bool check = false;
  bool ischange = true;
  bool iselevatedgroupicon = true;
  bool iselevatedaccicon = true;
  late Timer _timer;

  PanelController panelController = PanelController();
  @override
  void initState() {
    super.initState();
    initializeOrders();
    // Start the timer when the widget is initialized

    _startTimer();
  }

  Future<void> initializeOrders() async {
    var orderProvider = Provider.of<OrderProvider>(context, listen: false);

    await OrderServices().getAllOrder(context: context);
    List<OrderModel> fetchedOrders = await orderProvider.getOrders();
    setState(() {
      orders = fetchedOrders;
    });

    if (orders.isNotEmpty) {
      await OrderServices().checkvalidateQrCode(
        context: context,
        id: orders[0].id,
      );

      String ticketId = orderProvider.order!.items[0].ticket;

      await TicketServices().getTicketById(
        context: context,
        ticketId: ticketId,
      );
    }
  }

  void _startTimer() {
    // Check the condition every 2 seconds
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      // Perform your condition check here
      if (panelController.isPanelClosed) {
        setState(() {
          iscolorchange = false;
        });
      } else {
        setState(() {
          iscolorchange = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var userprovider = Provider.of<UserProvider>(context, listen: false);
    var orderprovider = Provider.of<OrderProvider>(context, listen: false);
    var ticketprovider = Provider.of<TicketProvider>(context, listen: false);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColorfigma,
        body: SlidingUpPanel(
          maxHeight: height / 1.59,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: height / 10,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                    // color: Colors.white,
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            iselevatedgroupicon = !iselevatedgroupicon;
                          });
                        },
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              boxShadow: iselevatedgroupicon
                                  ? [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                            255, 120, 116, 116),
                                        blurRadius: blurradiusXl,
                                        spreadRadius: -2,
                                        offset: const Offset(-5, -5),
                                      ),
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: blurradiusXl,
                                        spreadRadius: -2,
                                        offset: const Offset(5, 5),
                                      ),
                                    ]
                                  : [
                                      BoxShadow(
                                          color: const Color.fromARGB(
                                              255, 120, 116, 116),
                                          blurRadius: blurradiusXl,
                                          spreadRadius: 1,
                                          offset: const Offset(-5, -5),
                                          inset: true),
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: blurradiusXl,
                                          spreadRadius: 1,
                                          offset: const Offset(2, 2),
                                          inset: true),
                                    ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              color: const Color(0xFF2C2F33),
                            ),
                            child: Center(
                                child: Image.asset(
                              "assets/images/group.png",
                              scale: 1,
                            ))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            iselevatedaccicon = !iselevatedaccicon;
                          });
                        },
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              boxShadow: iselevatedaccicon
                                  ? [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                            255, 120, 116, 116),
                                        blurRadius: blurradiusXl,
                                        spreadRadius: -2,
                                        offset: const Offset(-5, -5),
                                      ),
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: blurradiusXl,
                                        spreadRadius: -2,
                                        offset: const Offset(5, 5),
                                      ),
                                    ]
                                  : [
                                      BoxShadow(
                                          color: const Color.fromARGB(
                                              255, 120, 116, 116),
                                          blurRadius: blurradiusXl,
                                          spreadRadius: 1,
                                          offset: const Offset(-5, -5),
                                          inset: true),
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: blurradiusXl,
                                          spreadRadius: 1,
                                          offset: const Offset(2, 2),
                                          inset: true),
                                    ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              color: const Color(0xFF2C2F33),
                            ),
                            child: InkWell(
                              onTap: () {
                                AuthService().signOut(context);
                              },
                              child: Image.asset(
                                "assets/images/person.png",
                                scale: 1.2,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 50,
              ),
              Balancecard(height: height),
              SizedBox(
                height: height / 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 3 * height / 13,
                      width: (width / 7) + (width / 1.69),
                      decoration: const BoxDecoration(color: Color(0xFF2C2F33)),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Row(
                              children: [
                                Card(
                                  color: const Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Container(
                                    height: height / 18,
                                    width: width / 7.76,
                                    decoration: BoxDecoration(
                                      color: offwhite,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(60.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [],
                                    ),
                                  ),
                                ),
                                Card(
                                  color: offwhite,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Container(
                                    height: height / 18,
                                    width: width / 1.77,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Event ${index + 1}",
                                          style: GoogleFonts.mavenPro(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text("300",
                                            style: GoogleFonts.bebasNeue(
                                              fontSize: 32,
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: height / 25,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      height: height / 23,
                      width: width / 2,
                      decoration: BoxDecoration(
                        color: golden,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text("Redeem",
                            style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          controller: panelController,
          defaultPanelState: PanelState.CLOSED,
          panel: orders.isNotEmpty
              ? Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  // margin: const EdgeInsets.all(24.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            panelController.close();

                            setState(() {
                              iscolorchange = false;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Row(
                              children: [
                                Container(
                                  width: width / 1.7,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      topLeft: Radius.circular(40),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      "MY BOOKINGS",
                                      style:
                                          GoogleFonts.bebasNeue(fontSize: 40),
                                    ),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      width: width / 13.7,
                                      height: height / 12.38571428571429,
                                      decoration: BoxDecoration(
                                        color: backgroundColorfigma,
                                      ),
                                    ),
                                    Container(
                                      width: width / 13.7,
                                      height: height / 12.38571428571429,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                        ),
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      width: width / 13.7,
                                      height: height / 12.38571428571429,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                        ),
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      width: width / 13.7,
                                      height: height / 10.1,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                        ),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    panelController.close();
                                    setState(() {
                                      iscolorchange = false;
                                    });
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: width / 3.34,
                                        height: height / 10.1,
                                        decoration: BoxDecoration(
                                          color: backgroundColorfigma,
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25,
                                              bottom: 10.0,
                                              right: 25,
                                              top: 8),
                                          child: Container(
                                            width: 10,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                panelController.close();
                                                setState(() {
                                                  iscolorchange = false;
                                                });
                                              },
                                              child: Image.asset(
                                                "assets/images/coinlogo.png",
                                                scale: 6,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 10.0),
                                    child: Container(
                                      height: 3 * height / 11,
                                      width: 2 * width / 3,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20.0)),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                orderprovider.orders.isNotEmpty
                                                    ? orderprovider.order?.id
                                                                .isNotEmpty ??
                                                            false
                                                        ? ticketprovider
                                                                    .ticket
                                                                    ?.id
                                                                    .isNotEmpty ??
                                                                false
                                                            ? RepaintBoundary(
                                                                child: QrImage(
                                                                  data: ticketprovider
                                                                      .ticket!
                                                                      .id,
                                                                  version:
                                                                      QrVersions
                                                                          .auto,
                                                                  size: 130.0,
                                                                ),
                                                              )
                                                            : const CircularProgressIndicator()
                                                        : const CircularProgressIndicator()
                                                    : const CircularProgressIndicator(),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Center(
                                              child: Text("WATERZ",
                                                  style: GoogleFonts.bebasNeue(
                                                    fontSize: 32,
                                                  )),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Image.asset(
                                                    "assets/images/ticket.png",
                                                    scale: height *
                                                        0.0173010380622837,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${orderprovider.order?.items[0].quantity ?? ''}x ${ticketprovider.ticket?.name ?? ''}',
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 30.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: const [
                                                                  Icon(
                                                                    Icons
                                                                        .access_time,
                                                                    size: 17,
                                                                  ),
                                                                  Text(
                                                                    " 08:00 pm",
                                                                  )
                                                                ],
                                                              ),
                                                              Row(
                                                                children: const [
                                                                  Icon(
                                                                    Icons
                                                                        .location_on,
                                                                    size: 17,
                                                                  ),
                                                                  Text(
                                                                    " Take me There",
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 10.0),
                                    child: Container(
                                      height: 3 * height / 11,
                                      width: width / 5,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20.0)),
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: RotatedBox(
                                          quarterTurns: 1,
                                          child: Text("PREVIOUS BOOKINGS",
                                              style: GoogleFonts.bebasNeue(
                                                fontSize: 30,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 25,
                        ),
                        bottomnavbar(
                          width: width,
                          iscolorchange: iscolorchange,
                          height: height,
                        )
                      ]))
              : const Center(child: CircularProgressIndicator()),
          renderPanelSheet: false,
          panelSnapping: false,
          collapsed: Container(
              color: backgroundColorfigma,
              child: Row(
                children: [
                  Container(
                    width: width / 1.325806451612903,
                    decoration: BoxDecoration(
                      color: backgroundColorfigma,
                    ),
                  ),
                  Container(
                    width: width / 5.1375,
                    height: height / 12.38571428571429,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        panelController.open();
                        setState(() {
                          iscolorchange = true;
                        });
                      },
                      child: Image.asset(
                        "assets/images/coinlogo.png",
                        scale: 6,
                      ),
                    ),
                  )
                ],
              )),
        ),
        bottomNavigationBar: !iscolorchange
            ? bottomnavbar(
                width: width,
                iscolorchange: iscolorchange,
                height: height,
              )
            : null,
      ),
    );
  }
}