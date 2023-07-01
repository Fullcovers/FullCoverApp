import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:venq_assessment/Models/Order.dart';
import 'package:venq_assessment/Providers/OrderProvider.dart';
import 'package:venq_assessment/Providers/OrderValidationProvider.dart';
import 'package:venq_assessment/Services/Order_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/Tablecard.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  List<OrderModel> orders = [];
  bool loded = false;
  bool tableloded = false;
  var myorders;
  getallorders() async {
    var orderProvider = Provider.of<OrderProvider>(context, listen: false);
    var ordervalProvider =
        Provider.of<OrderValidationProvider>(context, listen: false);

    myorders = await OrderServices.getAllOrderhistory(context: context);
    List<OrderModel> fetchedOrders = await orderProvider.getOrders();
    setState(() {
      orders = fetchedOrders;
      loded = true;
    });
  }

  var mytableorders;

  getallTicketorders() async {
    mytableorders =
        await OrderServices.getAlltableOrderhistory(context: context);
    print(mytableorders);
    setState(() {
      tableloded = true;
    });
  }

  bool _expanded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getallorders();
    getallTicketorders();
  }

  bool ashow = false;
  bool oshow = true;
  bool wshow = false;
  bool show = true;
  List<bool> expandlist = [];

  @override
  Widget build(BuildContext context) {
    if (loded && tableloded) {
      for (var i = 0; i < myorders.length; i++) {
        expandlist.add(false);
      }
    }
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: backgroundColortransperent,
          body: Column(children: [
            HeaderContent(title: "Bookings"),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 0, left: 20, right: 20),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              ashow = false;
                              oshow = !oshow;
                              wshow = false;
                              show = !show;
                            });
                          },
                          child: Text(
                            "Tickets ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily:
                                  FontAwesomeIcons.solidCircle.fontFamily,
                            ),
                          )),
                    ),
                    oshow
                        ? Container(
                            height: 2,
                            width: 60,
                            color: Colors.amber,
                          )
                        : Container(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 0, left: 20, right: 20),
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              ashow = false;
                              wshow = !wshow;
                              oshow = false;
                              show = !show;
                            });
                          },
                          child: Text(
                            "Tables ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily:
                                  FontAwesomeIcons.solidCircle.fontFamily,
                            ),
                          )),
                    ),
                    wshow
                        ? Container(
                            height: 2,
                            width: 60,
                            color: Colors.amber,
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
            loded && tableloded
                ? oshow
                    ? Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: myorders['data'].length,
                          itemBuilder: (BuildContext context, int i) {
                            return ExpansionPanelList(
                              children: [
                                ExpansionPanel(
                                  backgroundColor: backgroundColortransperent,
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        myorders['data'][i]['club']['name'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      trailing: isExpanded
                                          ? Icon(
                                              Icons.keyboard_arrow_up,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.white,
                                            ),
                                    );
                                  },
                                  body: Column(
                                    children: [
                                      ListTile(
                                        title: Center(
                                          child: QrImage(
                                            backgroundColor: Colors.white,
                                            data: myorders['data'][i]['_id'],
                                            version: QrVersions.auto,
                                            size: 130.0,
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                          title: Text(
                                        "Timings:- " +
                                            myorders['data'][i]['club']
                                                    ['timings']['opensAt']
                                                .toString() +
                                            " - " +
                                            myorders['data'][i]['club']
                                                ['timings']['closesAt'],
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      ListTile(
                                          title: Text(
                                        "Date:- " +
                                            myorders['data'][i]['date']
                                                    
                                                .toString().substring(0,10),
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      ListTile(
                                          title: Text(
                                       "Tickets",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                      Container(
                                        height: height/10,
                                        child: ListView.builder(
                                          itemCount: myorders['data'][i]
                                                  ['items']
                                              .length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(top:8.0,left: 16),
                                              child: Text(myorders['data'][i]
                                                          ['items'][index]
                                                      ['ticket']['name']
                                                  .toString()+" x "+myorders['data'][i]
                                                          ['items'][index]
                                                      ['qty'].toString(),                                        style: TextStyle(color: Colors.white),
                                            
                                                  ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  isExpanded: expandlist[i],
                                  canTapOnHeader: true,
                                ),
                              ],
                              dividerColor: Colors.grey,
                              expansionCallback: (panelIndex, isExpanded) {
                                expandlist[i] = !expandlist[i];
                                setState(() {});
                              },
                            );
                            // FractionalTranslation(
                            //   translation: const Offset(0, -0.01),
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(
                            //         left: 15.0, right: 15.0, top: 10),
                            //     child: Card(
                            //       color: const Color.fromRGBO(217, 217, 217, 0.33),
                            //       shape: const RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.all(
                            //           Radius.circular(15.0),
                            //         ),
                            //       ),
                            //       child: Container(
                            //         height: height / 5.5,
                            //         width: width,
                            //         decoration: const BoxDecoration(
                            //           color: Color.fromRGBO(217, 217, 217, 0.33),
                            //           borderRadius: BorderRadius.all(
                            //             Radius.circular(15.0),
                            //           ),
                            //         ),
                            //         child: Row(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //           children: [
                            //             Padding(
                            //               padding: const EdgeInsets.only(
                            //                   left: 20.0, top: 20.0),
                            //               child: Column(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.start,
                            //                 children: [
                            //                   Text(
                            //                     "Tickets",
                            //                     style: GoogleFonts.sairaCondensed(
                            //                       fontSize: 20,
                            //                       fontWeight: FontWeight.w600,
                            //                     ),
                            //                   ),
                            //                   // Text(
                            //                   //   "Stag x${orders[2].items[0].quantity==null?0:orders[2].items[0].quantity}",
                            //                   //   style: GoogleFonts.sairaCondensed(
                            //                   //     fontSize: 16,
                            //                   //     fontWeight: FontWeight.w600,
                            //                   //     color: Colors.white,
                            //                   //   ),
                            //                   // ),

                            //                   myorders['data'][i]['items'].length ==
                            //                           1
                            //                       ? Text(
                            //                           "${myorders['data'][i]['items'][0]['ticket']['name']} x ${myorders['data'][i]['items'][0]['qty']}",
                            //                           style: GoogleFonts
                            //                               .sairaCondensed(
                            //                             fontSize: 16,
                            //                             fontWeight: FontWeight.w600,
                            //                             color: Colors.white,
                            //                           ),
                            //                         )
                            //                       : myorders['data'][i]['items']
                            //                                   .length ==
                            //                               2
                            //                           ? Column(
                            //                               children: [
                            //                                 Text(
                            //                                   "${myorders['data'][i]['items'][0]['ticket']['name']} x ${myorders['data'][i]['items'][0]['qty']}",
                            //                                   style: GoogleFonts
                            //                                       .sairaCondensed(
                            //                                     fontSize: 16,
                            //                                     fontWeight:
                            //                                         FontWeight.w600,
                            //                                     color: Colors.white,
                            //                                   ),
                            //                                 ),
                            //                                 Text(
                            //                                   "${myorders['data'][i]['items'][1]['ticket']['name']} x ${myorders['data'][i]['items'][1]['qty']}",
                            //                                   style: GoogleFonts
                            //                                       .sairaCondensed(
                            //                                     fontSize: 16,
                            //                                     fontWeight:
                            //                                         FontWeight.w600,
                            //                                     color: Colors.white,
                            //                                   ),
                            //                                 )
                            //                               ],
                            //                             )
                            //                           : Column(
                            //                               children: [
                            //                                 Text(
                            //                                   "${myorders['data'][i]['items'][0]['ticket']['name']} x ${myorders['data'][i]['items'][0]['qty']}",
                            //                                   style: GoogleFonts
                            //                                       .sairaCondensed(
                            //                                     fontSize: 16,
                            //                                     fontWeight:
                            //                                         FontWeight.w600,
                            //                                     color: Colors.white,
                            //                                   ),
                            //                                 ),
                            //                                 Text(
                            //                                   "${myorders['data'][i]['items'][1]['ticket']['name']} x ${myorders['data'][i]['items'][1]['qty']}",
                            //                                   style: GoogleFonts
                            //                                       .sairaCondensed(
                            //                                     fontSize: 16,
                            //                                     fontWeight:
                            //                                         FontWeight.w600,
                            //                                     color: Colors.white,
                            //                                   ),
                            //                                 ),
                            //                                 Text(
                            //                                   "${myorders['data'][i]['items'][2]['ticket']['name']} x ${myorders['data'][i]['items'][2]['qty']}",
                            //                                   style: GoogleFonts
                            //                                       .sairaCondensed(
                            //                                     fontSize: 16,
                            //                                     fontWeight:
                            //                                         FontWeight.w600,
                            //                                     color: Colors.white,
                            //                                   ),
                            //                                 ),
                            //                               ],
                            //                             ),

                            //                   // FractionalTranslation(
                            //                   //   translation: const Offset(0, 0),
                            //                   //   child: Text(
                            //                   //     "Couple x${orders[2].items[2].quantity==null?0:orders[2].items[2].quantity}",
                            //                   //     style: GoogleFonts.sairaCondensed(
                            //                   //       fontSize: 16,
                            //                   //       fontWeight: FontWeight.w600,
                            //                   //       color: Colors.white,
                            //                   //     ),
                            //                   //   ),
                            //                   // )
                            //                   Text(
                            //                     "Total Price  :  ${myorders['data'][i]['total']}",
                            //                     style: GoogleFonts.sairaCondensed(
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                       color: Colors.white,
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.only(
                            //                   right: 20.0, top: 20.0),
                            //               child: Column(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.end,
                            //                 children: [
                            //                   Text(
                            //                     myorders['data'][i]['club'] != null
                            //                         ? "CLUB"
                            //                         : "EVENT",
                            //                     style: GoogleFonts.sairaCondensed(
                            //                         fontSize: 20,
                            //                         fontWeight: FontWeight.w600,
                            //                         color: golden),
                            //                   ),
                            //                   Text(
                            //                     myorders['data'][i]['club'] != null
                            //                         ? myorders['data'][i]['club']
                            //                             ['name']
                            //                         : myorders['data'][i]['event']
                            //                             ['name'],
                            //                     style: GoogleFonts.sairaCondensed(
                            //                         fontSize: 20,
                            //                         fontWeight: FontWeight.w600,
                            //                         color: offwhite),
                            //                   ),
                            //                   Text(
                            //                     myorders['data'][i]['send_to']
                            //                         ['email'],
                            //                     style: GoogleFonts.sairaCondensed(
                            //                       fontSize: 14,
                            //                       fontWeight: FontWeight.w600,
                            //                       color: Colors.white,
                            //                     ),
                            //                   ),
                            //                   Text(
                            //                     myorders['data'][i]['send_to']
                            //                         ['phoneNumber'],
                            //                     style: GoogleFonts.sairaCondensed(
                            //                       fontSize: 16,
                            //                       fontWeight: FontWeight.w600,
                            //                       color: Colors.white,
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // );
                          },
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: mytableorders['data'].length,
                          itemBuilder: (BuildContext context, int i) {
                            return FractionalTranslation(
                              translation: const Offset(0, -0.07),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 10),
                                child: Card(
                                  color:
                                      const Color.fromRGBO(217, 217, 217, 0.33),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                  ),
                                  child: Container(
                                    height: height / 5.5,
                                    width: width,
                                    decoration: const BoxDecoration(
                                      color:
                                          Color.fromRGBO(217, 217, 217, 0.33),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, top: 20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Tables",
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              // Text(
                                              //   "Stag x${orders[2].items[0].quantity==null?0:orders[2].items[0].quantity}",
                                              //   style: GoogleFonts.sairaCondensed(
                                              //     fontSize: 16,
                                              //     fontWeight: FontWeight.w600,
                                              //     color: Colors.white,
                                              //   ),
                                              // ),

                                              // myorders['data'][i]['items'].length ==
                                              //         1
                                              //     ? Text(
                                              //         "${myorders['data'][i]['items'][0]['ticket']['name']} x ${myorders['data'][i]['items'][0]['qty']}",
                                              //         style: GoogleFonts
                                              //             .sairaCondensed(
                                              //           fontSize: 16,
                                              //           fontWeight: FontWeight.w600,
                                              //           color: Colors.white,
                                              //         ),
                                              //       )
                                              //     : myorders['data'][i]['items']
                                              //                 .length ==
                                              //             2
                                              //         ? Column(
                                              //             children: [
                                              //               Text(
                                              //                 "${myorders['data'][i]['items'][0]['ticket']['name']} x ${myorders['data'][i]['items'][0]['qty']}",
                                              //                 style: GoogleFonts
                                              //                     .sairaCondensed(
                                              //                   fontSize: 16,
                                              //                   fontWeight:
                                              //                       FontWeight.w600,
                                              //                   color: Colors.white,
                                              //                 ),
                                              //               ),
                                              //               Text(
                                              //                 "${myorders['data'][i]['items'][1]['ticket']['name']} x ${myorders['data'][i]['items'][1]['qty']}",
                                              //                 style: GoogleFonts
                                              //                     .sairaCondensed(
                                              //                   fontSize: 16,
                                              //                   fontWeight:
                                              //                       FontWeight.w600,
                                              //                   color: Colors.white,
                                              //                 ),
                                              //               )
                                              //             ],
                                              //           )
                                              //         : Column(
                                              //             children: [
                                              //               Text(
                                              //                 "${myorders['data'][i]['items'][0]['ticket']['name']} x ${myorders['data'][i]['items'][0]['qty']}",
                                              //                 style: GoogleFonts
                                              //                     .sairaCondensed(
                                              //                   fontSize: 16,
                                              //                   fontWeight:
                                              //                       FontWeight.w600,
                                              //                   color: Colors.white,
                                              //                 ),
                                              //               ),
                                              //               Text(
                                              //                 "${myorders['data'][i]['items'][1]['ticket']['name']} x ${myorders['data'][i]['items'][1]['qty']}",
                                              //                 style: GoogleFonts
                                              //                     .sairaCondensed(
                                              //                   fontSize: 16,
                                              //                   fontWeight:
                                              //                       FontWeight.w600,
                                              //                   color: Colors.white,
                                              //                 ),
                                              //               ),
                                              //               Text(
                                              //                 "${myorders['data'][i]['items'][2]['ticket']['name']} x ${myorders['data'][i]['items'][2]['qty']}",
                                              //                 style: GoogleFonts
                                              //                     .sairaCondensed(
                                              //                   fontSize: 16,
                                              //                   fontWeight:
                                              //                       FontWeight.w600,
                                              //                   color: Colors.white,
                                              //                 ),
                                              //               ),
                                              //             ],
                                              //           ),

                                              // FractionalTranslation(
                                              //   translation: const Offset(0, 0),
                                              //   child: Text(
                                              //     "Couple x${orders[2].items[2].quantity==null?0:orders[2].items[2].quantity}",
                                              //     style: GoogleFonts.sairaCondensed(
                                              //       fontSize: 16,
                                              //       fontWeight: FontWeight.w600,
                                              //       color: Colors.white,
                                              //     ),
                                              //   ),
                                              // )
                                              Text(
                                                "Total Price  :  ${mytableorders['data'][i]['total']}",
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "Date  :  ${mytableorders['data'][i]['date']}"
                                                    .substring(0, 19),
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 20.0, top: 20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              // Text(
                                              //   myorders['data'][i]['club'] != null
                                              //       ? "CLUB"
                                              //       : "EVENT",
                                              //   style: GoogleFonts.sairaCondensed(
                                              //       fontSize: 20,
                                              //       fontWeight: FontWeight.w600,
                                              //       color: golden),
                                              // ),
                                              Text(
                                                mytableorders['data'][i]
                                                        ['isValid']
                                                    .toString(),
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                mytableorders['data'][i]
                                                            ['club'] !=
                                                        null
                                                    ? mytableorders['data'][i]
                                                        ['club']['name']
                                                    : "",
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: offwhite),
                                              ),
                                              Text(
                                                mytableorders['data'][i]
                                                    ['send_to']['email'],
                                                style:
                                                    GoogleFonts.sairaCondensed(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                mytableorders['data'][i]
                                                    ['send_to']['phoneNumber'],
                                                style:
                                                    GoogleFonts.sairaCondensed(
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
                            );
                          },
                        ),
                      )
                : CircularProgressIndicator(),
          ]),
        ),
      ],
    ));
  }
}
