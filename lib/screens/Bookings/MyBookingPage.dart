import 'dart:async';

import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_button/neumorphic_button.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:venq_assessment/Models/Order.dart';
import 'package:venq_assessment/Providers/OrderProvider.dart';
import 'package:venq_assessment/Providers/OrderValidationProvider.dart';
import 'package:venq_assessment/Providers/TicketProvider.dart';
import 'package:venq_assessment/Providers/UserProvider.dart';
import 'package:venq_assessment/Services/Auth_Services.dart';
import 'package:venq_assessment/Services/Order_Services.dart';
import 'package:venq_assessment/Services/Ticket_Services.dart';
import 'package:venq_assessment/Services/User_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/Styles/Radius.dart';
import 'package:venq_assessment/screens/Bookings/bookinghistory.dart';
import 'package:venq_assessment/screens/Clubs/clubs_screen.dart';
import 'package:venq_assessment/screens/profile/ProfilePage.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/BookingScreen/Balancecard.dart';
import 'package:venq_assessment/widgets/BookingScreen/FooterButtons.dart';
import 'package:venq_assessment/widgets/BookingScreen/NewBookings.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/Tablecard.dart';
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
  var porders;

  PanelController panelController = PanelController();
  @override
  void initState() {
    super.initState();
    initializeOrders();
    _startTimer();
    UserServices.getprofileinfo();
    getpriviousorders();
  }

  Future<void> initializeOrders() async {
    var orderProvider = Provider.of<OrderProvider>(context, listen: false);
    var ordervalProvider =
        Provider.of<OrderValidationProvider>(context, listen: false);

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

      String ticketId = ordervalProvider.order!.items[0].ticket;

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

  bool loadedpo = false;

  getpriviousorders() async {
    porders = await OrderServices.getAllOrderhistory(context: context);
    setState(() {
      loadedpo = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var userprovider = Provider.of<UserProvider>(context, listen: false);
    var orderprovider = Provider.of<OrderProvider>(context, listen: false);
    var ordervalprovider =
        Provider.of<OrderValidationProvider>(context, listen: false);
    var ticketprovider = Provider.of<TicketProvider>(context, listen: false);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
            backgroundColor: Colors.transparent,
            body: SlidingUpPanel(
              maxHeight: height / 1.7,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       setState(() {
                        //         iselevatedgroupicon = !iselevatedgroupicon;
                        //       });
                        //     },
                        //     child: NeumorphicButton(
                        //       borderColor: Colors.black,
                        //       borderWidth: 2,
                        //       borderRadius: 15,
                        //       backgroundColor: botoncolor,
                        //       bottomRightShadowColor: nbcolor,
                        //       height: 50,
                        //       onTap: () {},
                        //       topLeftShadowColor: nbcolor,
                        //       width: 50,
                        //       child: Center(
                        //           child: Image.asset(
                        //         "assets/images/group.png",
                        //         scale: 1,
                        //       )),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                iselevatedaccicon = !iselevatedaccicon;
                              });

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProfilePage()));
                            },
                            child: AnimatedContainer(
                              height: 50, width: 50,
                              decoration: const BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(4, 4),
                                  blurRadius: 15,
                                  spreadRadius: 1,
                                ),
                                BoxShadow(
                                  color: Color.fromARGB(255, 88, 88, 88),
                                  offset: Offset(-4, -4),
                                  blurRadius: 15,
                                  spreadRadius:
                                      -2, // how far the color effect spreads.
                                ),
                              ]),
                              duration: const Duration(
                                milliseconds: 200,
                              ),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: botoncolor,
                                child: Image.asset(
                                  "assets/images/person.png",
                                  scale: 20,
                                ),
                              ),
                              // child: Container(decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(8)),
                              //   // child: Center(
                              //   //   child: Image.asset(
                              //   //     "assets/images/person.png",
                              //   //     scale: 1.5,
                              //   //   ),
                              //   // ),
                              // ),
                            ),
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
                      // Padding(
                      //   padding: const EdgeInsets.all(5.0),
                      //   child: Container(
                      //     height: 3 * height / 9.2,
                      //     width: (width / 7) + (width / 1.68),
                      //     decoration:
                      //         BoxDecoration(color: backgroundColorfigma),
                      //     child: ListView.builder(
                      //       itemCount: 10,
                      //       itemBuilder: (context, index) {
                      //         return Row(
                      //           children: [
                      //             Card(
                      //               color: const Color(0xFFD9D9D9),
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(10.0)),
                      //               child: Container(
                      //                 height: height / 18,
                      //                 width: width / 7.76,
                      //                 decoration: BoxDecoration(
                      //                   color: offwhite,
                      //                   borderRadius: const BorderRadius.all(
                      //                     Radius.circular(60.0),
                      //                   ),
                      //                 ),
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.spaceAround,
                      //                   children: [],
                      //                 ),
                      //               ),
                      //             ),
                      //             Card(
                      //               color: offwhite,
                      //               shape: RoundedRectangleBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(10.0)),
                      //               child: Container(
                      //                 height: height / 18,
                      //                 width: width / 1.77,
                      //                 decoration: const BoxDecoration(
                      //                   color: Color(0xFFD9D9D9),
                      //                   borderRadius: BorderRadius.all(
                      //                     Radius.circular(20.0),
                      //                   ),
                      //                 ),
                      //                 child: Row(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.spaceAround,
                      //                   children: [
                      //                     Text(
                      //                       "Event ${index + 1}",
                      //                       style: GoogleFonts.mavenPro(
                      //                         fontWeight: FontWeight.w500,
                      //                         fontSize: height / 54.1875,
                      //                       ),
                      //                     ),
                      //                     Text("300",
                      //                         style: GoogleFonts.bebasNeue(
                      //                           fontSize: height / 27.09375,
                      //                         ))
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: height / 25,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10.0),
                      //   child: Container(
                      //     height: height / 23,
                      //     width: width / 2,
                      //     decoration: BoxDecoration(
                      //       color: golden,
                      //       borderRadius: BorderRadius.circular(10.0),
                      //     ),
                      //     child: Center(
                      //       child: Text("Redeem",
                      //           style: GoogleFonts.sairaCondensed(
                      //             fontWeight: FontWeight.w600,
                      //             fontSize: 24,
                      //           )),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
              controller: panelController,
              defaultPanelState: PanelState.OPEN,
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
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Text(
                                          "MY BOOKINGS",
                                          style: GoogleFonts.bebasNeue(
                                              fontSize: height / 21.675),
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Image.asset(
                                          "assets/images/background.png",
                                          height: height / 12.38571428571429,
                                          width: width / 13.6,
                                          fit: BoxFit.cover,
                                        ),
                                        Container(
                                          width: width / 13.6,
                                          height: height / 12.38571428571429,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        Container(
                                          width: width / 13.6,
                                          height: height / 12.38571428571429,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          width: width / 13.6,
                                          height: height / 12.38571428571429,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          width: width / 13.6,
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
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    const Radius.circular(
                                                        20.0)),
                                            child: Image.asset(
                                              "assets/images/background.png",
                                              height: height / 10.1,
                                              width: width / 3.342,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            width: width / 3.342,
                                            height: height / 10.1,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: width / 16.44,
                                                  bottom: height / 86.7,
                                                  right: width / 16.44,
                                                  top: height / 108.375),
                                              child: Container(
                                                width: 10,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                          height: 3.3 * height / 11,
                                          width: 2 * width / 3,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
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
                                                padding: const EdgeInsets.only(
                                                    top: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    orderprovider
                                                            .orders.isNotEmpty
                                                        ? (ordervalprovider
                                                                    .order
                                                                    ?.id
                                                                    .isNotEmpty ??
                                                                false)
                                                            ? (ticketprovider
                                                                        .ticket
                                                                        ?.id
                                                                        .isNotEmpty ??
                                                                    false)
                                                                ? RepaintBoundary(
                                                                    child:
                                                                        QrImage(
                                                                      data: ticketprovider
                                                                          .ticket!
                                                                          .id,
                                                                      version:
                                                                          QrVersions
                                                                              .auto,
                                                                      size:
                                                                          130.0,
                                                                    ),
                                                                  )
                                                                : Constants.mycircularProgressIndicator()
                                                            : Constants.mycircularProgressIndicator()
                                                        : Constants.mycircularProgressIndicator()
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Center(
                                                  child: Text("",
                                                      style:
                                                          GoogleFonts.bebasNeue(
                                                        fontSize: 32,
                                                      )),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Image.asset(
                                                        "assets/images/ticket.png",
                                                        scale: height *
                                                            0.0173010380622837,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0.0),
                                                      child: Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                '${ordervalprovider.order?.items[0].quantity ?? ''}x ${ticketprovider.ticket?.name ?? ''}',
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: width /
                                                                          13.7),
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
                                                                        size:
                                                                            17,
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
                                                                        size:
                                                                            17,
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
                                              ),
                                              SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      loadedpo
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Container(
                                                height: 3 * height / 11,
                                                width: width / 5,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(
                                                              20.0)),
                                                  color: Colors.white,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      child: Center(
                                                        child:
                                                            FractionalTranslation(
                                                          translation:
                                                              const Offset(
                                                                  0, -.01),
                                                          child:
                                                              ListView.builder(
                                                            itemCount: porders[
                                                                            'data']
                                                                        .length >
                                                                    3
                                                                ? 3
                                                                : porders[
                                                                        'data']
                                                                    .length,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                  child: Image
                                                                      .network(
                                                                    porders['data'][index]
                                                                            [
                                                                            'club']
                                                                        [
                                                                        'logo'],
                                                                    width: 50,
                                                                    height: 50,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const BookingHistory()));
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 20.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5.0)),
                                                            border: Border.all(
                                                                width: 2,
                                                                color:
                                                                    backgroundColorfigma),
                                                            color: Colors.white,
                                                          ),
                                                          child: Icon(Icons
                                                              .navigate_next),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Container(),
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
                              isclub: false,
                              isevent: false,
                              iscolorchange: iscolorchange,
                              initialindex: 1,
                              height: height,
                            )
                          ]))
                  : Container(
                      height: 102,
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
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Text(
                                          "MY BOOKINGS",
                                          style: GoogleFonts.bebasNeue(
                                              fontSize: height / 21.675),
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                         Image.asset(
                                            "assets/images/background.png",
                                            height: height / 12.38571428571429,
                                            width: width / 13.5,
                                            fit: BoxFit.cover,
                                          ),
                                        Container(
                                          width: width / 13.5,
                                          height: height / 12.38571428571429,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        Container(
                                          width: width / 13.6,
                                          height: height / 12.38571428571429,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          width: width / 13.6,
                                          height: height / 12.38571428571429,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                            ),
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          width: width / 13.6,
                                          height: height / 10.2,
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
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    const Radius.circular(
                                                        20.0)),
                                            child: Image.asset(
                                              "assets/images/background.png",
                                              height: height / 10.1,
                                              width: width / 3.347,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            width: width / 3.347,
                                            height: height / 10.1,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: width / 16.44,
                                                  bottom: height / 86.7,
                                                  right: width / 16.44,
                                                  top: height / 108.375),
                                              child: Container(
                                                width: 10,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0,right: 16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 10.0),
                                        child: Container(
                                            height: 3 * height / 11,
                                            width: width-52,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20.0)),
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 2,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                    "No Bookings Available Right Now",
                                                    style:
                                                        GoogleFonts.bebasNeue(
                                                      fontSize: 20,
                                                    )),
                                                Text("Lets change that",
                                                    style:
                                                        GoogleFonts.bebasNeue(
                                                      fontSize: 15,
                                                    )),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const ClubsScreen()),
                                                            (route) => false);
                                                  },
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: width / 13,
                                                        right: width / 13,
                                                        top: 10),
                                                    child: SizedBox(
                                                      height: height / 20,
                                                      child: Container(
                                                        height: height / 10,
                                                        width: width / 5,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: golden,
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(
                                                                10.0),
                                                          ),
                                                          border: Border.all(
                                                            width: 2,
                                                            color: const Color(
                                                                0xFF979797),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "VIEW CLUBS",
                                                            style: GoogleFonts
                                                                .bebasNeue(
                                                              fontSize:
                                                                  width / 30,
                                                              
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
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
                              initialindex: 1,
                              width: width,
                              iscolorchange: iscolorchange,
                              height: height,
                              isclub: false,
                              isevent: false,
                            )
                          ])),
              renderPanelSheet: false,
              panelSnapping: false,
              collapsed: Container(
                  child: Stack(
                children: [
                  Image.asset(
                    "assets/images/background.png",
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Row(
                    children: [
                      Container(
                        width: width / 1.325806451612903,
                        height: 500,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
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
                  ),
                ],
              )),
            ),
            bottomNavigationBar: !iscolorchange
                ? bottomnavbar(
                    isclub: false,
                    isevent: false,
                    width: width,
                    iscolorchange: iscolorchange,
                    initialindex: 1,
                    height: height,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
