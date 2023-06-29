import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getallorders();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColorfigma,
      body: Column(children: [
        HeaderContent(title: "Bookings"),
        loded
            ? Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: myorders['data'].length,
                  itemBuilder: (BuildContext context, int i) {
                    return FractionalTranslation(
                      translation: const Offset(0, -0.07),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0,top: 10),
                        child: Card(
                          color: const Color.fromRGBO(217, 217, 217, 0.33),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                          ),
                          child: Container(
                            height: height / 5.5,
                            width: width,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(217, 217, 217, 0.33),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tickets",
                                        style: GoogleFonts.sairaCondensed(
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

                                      myorders['data'][i]['items'].length == 1
                                          ? Text(
                                              "${myorders['data'][i]['items'][0]['ticket']['name']} x ${myorders['data'][i]['items'][0]['qty']}",
                                              style: GoogleFonts.sairaCondensed(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            )
                                          : myorders['data'][i]['items']
                                                      .length ==
                                                  2
                                              ? Column(
                                                  children: [
                                                    Text(
                                                      "${myorders['data'][i]['items'][0]['ticket']['name']} x ${myorders['data'][i]['items'][0]['qty']}",
                                                      style: GoogleFonts
                                                          .sairaCondensed(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${myorders['data'][i]['items'][1]['ticket']['name']} x ${myorders['data'][i]['items'][1]['qty']}",
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
                                                  children: [
                                                    Text(
                                                      "${myorders['data'][i]['items'][0]['ticket']['name']} x ${myorders['data'][i]['items'][0]['qty']}",
                                                      style: GoogleFonts
                                                          .sairaCondensed(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${myorders['data'][i]['items'][1]['ticket']['name']} x ${myorders['data'][i]['items'][1]['qty']}",
                                                      style: GoogleFonts
                                                          .sairaCondensed(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${myorders['data'][i]['items'][2]['ticket']['name']} x ${myorders['data'][i]['items'][2]['qty']}",
                                                      style: GoogleFonts
                                                          .sairaCondensed(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    
                                                  ],
                                                ),

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
                                                      "Total Price  :  ${myorders['data'][i]['total']}",
                                                      style: GoogleFonts
                                                          .sairaCondensed(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        myorders['data'][i]['club']!=null?"CLUB":"EVENT",
                                        
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: golden),
                                      ),
                                      Text(
                                        myorders['data'][i]['club']!=null?myorders['data'][i]['club']['name']:myorders['data'][i]['event']['name'],
                                        
                                        style: GoogleFonts.sairaCondensed(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: offwhite),
                                      ),
                                      Text(
                                        myorders['data'][i]['send_to']['email'],
                                        style: GoogleFonts.sairaCondensed(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        myorders['data'][i]['send_to']['phoneNumber'],
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
                    );
                  },
                ),
              )
            : CircularProgressIndicator(),
      ]),
    ));
  }
}
