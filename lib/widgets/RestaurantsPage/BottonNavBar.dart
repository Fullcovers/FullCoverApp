import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:venq_assessment/screens/Bookings/MyBookingPage.dart';
import 'package:venq_assessment/screens/Clubs/clubs_screen.dart';
import 'package:venq_assessment/screens/Events/events_screen.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/CustumPageRoute.dart';

bool onclick = false;

// class bottomnavbar extends StatefulWidget {

//   bottomnavbar(
//       {super.key,
//       required this.height,
//       required this.width,
//       this.iscolorchange = false,
//     required  this.isevent ,
//      required this.isclub });
//     bool isevent;
//   bool isclub ;
//   double height;
//   double width;
//   bool iscolorchange;
//   @override
//   State<bottomnavbar> createState() => _bottomnavbarState();
// }

// class _bottomnavbarState extends State<bottomnavbar> {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(0),
//         color: widget.iscolorchange ? Colors.white : botoncolor,
//       ),
//       child: Row(
//         children: [
//           SizedBox(
//             width: (widget.width - widget.width / 1.04) / 2,
//           ),
//           Container(
//             // margin: const EdgeInsets.all(24.0),

//             height: widget.height / 7.5,
//             child: Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Container(
//                     height: widget.height / 12,
//                     width: widget.width / 1.04,
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       color: widget.iscolorchange
//                           ? botoncolor
//                           : offwhite,
//                       child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (context) => ClubsScreen()));
//                               },
//                               child: Container(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Image.asset(
//                                       widget.isclub
//                                           ? "assets/images/goldclubs.png"
//                                           : "assets/images/clubs.png",
//                                       scale: 16473 / widget.height,
//                                       color: widget.iscolorchange
//                                           ? Colors.white
//                                           :widget.isclub?null: botoncolor,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 5.0),
//                                       child: Stack(
//                                         children: [
//                                           Text("Clubs",
//                                               style: GoogleFonts.bebasNeue(
//                                                 fontSize: widget.height /
//                                                     45.63157894736842,
//                                                 color: widget.iscolorchange
//                                                     ? Colors.white
//                                                     : widget.isclub?golden: botoncolor,
//                                               )),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             // InkWell(
//                             //   onTap: () {
//                             //     final snackBar = SnackBar(
//                             //       content: const Text("Comming Soon"),
//                             //     );
//                             //     ScaffoldMessenger.of(context)
//                             //         .showSnackBar(snackBar);
//                             //   },
//                             //   child: Container(
//                             //     child: Column(
//                             //       mainAxisAlignment: MainAxisAlignment.center,
//                             //       crossAxisAlignment: CrossAxisAlignment.center,
//                             //       children: [
//                             //         Image.asset(
//                             //           "assets/images/restaurant.png",
//                             //           scale: 16473 / widget.height,
//                             //           color: widget.iscolorchange
//                             //               ? Colors.white
//                             //               : botoncolor,
//                             //         ),
//                             //         Padding(
//                             //           padding: const EdgeInsets.only(top: 5.0),
//                             //           child: Text("Restraurants",
//                             //               style: GoogleFonts.bebasNeue(
//                             //                 fontSize: widget.height /
//                             //                     45.63157894736842,
//                             //                 color: widget.iscolorchange
//                             //                     ? Colors.white
//                             //                     : botoncolor,
//                             //               )),
//                             //         ),
//                             //       ],
//                             //     ),
//                             //   ),
//                             // ),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (context) => EventsScreen()));
//                               },
//                               child: Container(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Image.asset(

//                                       widget.isevent
//                                           ? "assets/images/goldEvents.png"
//                                           : "assets/images/Events.png",
//                                       scale: 16473 / widget.height,
//                                       color: widget.iscolorchange
//                                           ? widget.isevent?null:offwhite
//                                           :  botoncolor,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 5.0),
//                                       child: Text("Events",
//                                           style: GoogleFonts.bebasNeue(
//                                             fontSize: widget.height /
//                                                 45.63157894736842,
//                                             color: widget.iscolorchange
//                                                 ? widget.isevent
//                                                     ? golden
//                                                     : offwhite
//                                                 : botoncolor,
//                                           )),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ]),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       left: (widget.width / 2) - widget.width / 7),
//                   child: Align(
//                     alignment: Alignment.topCenter,
//                     child: Container(
//                         height: widget.height / 9.5,
//                         width: widget.width / 4.2,
//                         child: Card(
//                           elevation: 0,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(25)),
//                           color: widget.iscolorchange
//                               ? Colors.white
//                               : botoncolor,
//                         )),
//                   ),
//                 ),
//                 // Container(color: Colors.white,height: 25,width: widget.width-25,),
//                 Padding(
//                   padding:
//                       EdgeInsets.only(left: (widget.width / 2) - widget.width / 9, top: 10),
//                   child: Align(
//                     alignment: Alignment.topCenter,
//                     child: Container(
//                       height: widget.height / 12,
//                       width: widget.width / 6,
//                       child: InkWell(
//                         onTap: () {
//                           setState(() {
//                             onclick = true;
//                           });
//                         },
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => MyBookingPage()));
//                           },
//                           child: Card(
//                             color: widget.iscolorchange
//                                 ? Colors.white
//                                 : botoncolor,
//                             // shape: RoundedRectangleBorder(
//                             //     borderRadius: BorderRadius.circular(5)),
//                             child: Container(
//                                 decoration: BoxDecoration(
//                                   boxShadow: widget.iscolorchange
//                                       ? [
//                                           BoxShadow(
//                                             color: Colors.transparent,
//                                             offset: Offset(-4, -4),
//                                             blurRadius: 3,
//                                           ),
//                                           BoxShadow(
//                                             color:
//                                                 Color.fromARGB(255, 67, 73, 78),
//                                             offset: Offset(4, 4),
//                                             blurRadius: 10,
//                                           ),
//                                           // BoxShadow(
//                                           //   color:widget.iscolorchange ?  Colors.grey.withOpacity(0.3):Colors.white10.withOpacity(0.05),
//                                           //   offset: Offset(-4, 4),
//                                           //   blurRadius: 2,
//                                           // ),
//                                         ]
//                                       : [
//                                           // BoxShadow(
//                                           //   color: widget.iscolorchange ? Color(0xFFE0E0E0):Colors.white10.withOpacity(0.05),
//                                           //   offset: Offset(4, 4),
//                                           //   blurRadius: 2,
//                                           // ),
//                                           BoxShadow(
//                                             color: Colors.black,
//                                             offset: Offset(4, 4),
//                                             blurRadius: 15,
//                                             spreadRadius: 1,
//                                           ),
//                                           BoxShadow(
//                                             color:
//                                                 Color.fromARGB(255, 88, 88, 88),
//                                             offset: Offset(-4, -4),
//                                             blurRadius: 15,
//                                             spreadRadius:
//                                                 -2, // how far the color effect spreads.
//                                           ),
//                                         ],
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(15)),
//                                   color: widget.iscolorchange
//                                       ? Colors.white
//                                       : botoncolor,
//                                 ),
//                                 child: Image.asset(
//                                   "assets/images/qrcode.png",
//                                   scale: 900 / widget.height,
//                                   color: widget.iscolorchange
//                                       ? Colors.black
//                                       : Colors.white,
//                                 )),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class bottomnavbar extends StatefulWidget {
  bool isevent;
  bool isclub;
  double height;
  double width;
  bool iscolorchange;
  int initialindex;
  bottomnavbar(
      {super.key,
      required this.height,
      required this.width,
      this.iscolorchange = false,
      required this.isevent,
      required this.isclub,
      required this.initialindex});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 75,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          !widget.iscolorchange
              ? Image.asset(
                  Constants. backgroundimage,
                  height: 75,
                  width: widget.width,
                  fit: BoxFit.cover,
                )
              : Container(),
          CurvedNavigationBar(animationDuration:Duration(milliseconds: 400),
            height: 75,
            buttonBackgroundColor: golden,
            index: widget.initialindex,
            backgroundColor:!widget.iscolorchange? Colors.black:Colors.white,
            // widget.iscolorchange ? Colors.white : botoncolor,
            color: !widget.iscolorchange ? Colors.white : botoncolor,
            items: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      // widget.isclub
                      //     ? "assets/images/goldclubs.png"
                      // :
                      "assets/images/clubs.png",
                      scale: 20000 / widget.height,
                      color: widget.iscolorchange
                          ? Colors.white
                          : widget.isclub
                              ? Colors.black
                              : botoncolor,
                    ),
                    Text("Clubs",
                        style: GoogleFonts.bebasNeue(
                          fontSize: widget.height / 60,
                          color: widget.iscolorchange
                              ? widget.isclub
                                  ? golden
                                  : offwhite
                              : botoncolor,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image.asset(
                        "assets/images/Home1.png",
                        width: 25,fit: BoxFit.fill,
                        color:
                            !widget.iscolorchange ? Colors.black : Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Text("Bookings",
                    //     style: GoogleFonts.bebasNeue(
                    //       fontSize: widget.height / 60,
                    //       color: widget.iscolorchange
                    //           ? widget.isclub
                    //               ? golden
                    //               : offwhite
                    //           : botoncolor,
                    //     )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      // widget.isevent
                      // ? "assets/images/goldEvents.png"
                      // :
                      "assets/images/Events.png",
                      scale: 20000 / widget.height,
                      color: widget.iscolorchange
                          ? widget.isevent
                              ? Colors.black
                              : offwhite
                          : botoncolor,
                    ),
                    Text("Events",
                        style: GoogleFonts.bebasNeue(
                          fontSize: widget.height / 60,
                          color: widget.iscolorchange
                              ? widget.isevent
                                  ? Colors.black
                                  : offwhite
                              : botoncolor,
                        )),
                  ],
                ),
              ),
            ],
            onTap: (index) {
              if (index == 2) {
                Future.delayed(Duration(milliseconds: 400), () {
                  Navigator.of(context).pushAndRemoveUntil(
                      SlideTransitionPageRoute(child:EventsScreen(),direction:"left"),
                       (route) => false);
                });
              }
              if (index == 1) {
                Future.delayed(Duration(milliseconds: 400), () {
                  
                  Navigator.of(context).pushAndRemoveUntil(
          //           MaterialPageRoute(builder: (context) => MyBookingPage()),
          // (route) => false
                      FaidinTransitionPageRoute(child:MyBookingPage()),
                      (route) => false
                      );
                });
              }

              if (index == 0) {
                Future.delayed(Duration(milliseconds: 400), () {
                  Navigator.of(context).pushAndRemoveUntil(
                      SlideTransitionPageRoute(child:
                          const ClubsScreen(),direction: "right"),
                      (route) => false);
                });
              }
            },
          ),
          widget.initialindex == 1 || widget.initialindex == 2
              ? Stack(
                  children: [
                    !widget.iscolorchange
                        ? Image.asset(
                            Constants. backgroundimage,
                            height: 100,
                            width: 11,
                            fit: BoxFit.fill,
                          )
                        : Container(),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: widget.iscolorchange
                            ? Colors.white
                            : Colors.black,
                        width: 11,
                        height: 80,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          color: widget.iscolorchange
                              ? Colors.white
                              : botoncolor,
                          width: 19,
                          height: 76,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: !widget.iscolorchange
                                ? Colors.white
                                : botoncolor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                          ),
                          width: 20,
                          height: 65,
                        ),
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    !widget.iscolorchange
                        ? Image.asset(
                            Constants. backgroundimage,
                            height: 76,
                            width: 10,
                            fit: BoxFit.cover,
                          )
                        : Container(),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: widget.iscolorchange
                            ? Colors.white
                            : Colors.black,
                        width: 10,
                        height: 76,
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.bottomLeft,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 10.0),
                    //     child: Container(
                    //       color: Colors.white,
                    //       width: 5,
                    //       height: 75,
                    //     ),
                    //   ),
                    // ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: !widget.iscolorchange
                                ? Colors.white
                                : botoncolor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                          ),
                          width: 6,
                          height: 59.95,
                        ),
                      ),
                    ),
                  ],
                ),
          widget.initialindex == 1 || widget.initialindex == 0
              ? Stack(
                  children: [
                    !widget.iscolorchange
                        ? Align(alignment: Alignment.bottomRight,
                          child: Image.asset(
                              Constants. backgroundimage,
                              height: 75,
                              width: 20,
                              fit: BoxFit.cover,
                            ),
                        )
                        : Container(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          color: !widget.iscolorchange
                              ? Colors.black
                              : Colors.white,
                          width: 20,
                          height: 76,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: !widget.iscolorchange
                                ? Colors.white
                                : botoncolor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          width: 21,
                          height: 65,
                        ),
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Container(decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                          ),
                          
                          width: 5,
                          height: 75,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: botoncolor,
                            borderRadius: BorderRadius.only(
                                // topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),
                          width: 6,
                          height: 82,
                        ),
                      ),
                    ),
                  ],
                ),
          Stack(
            children: [
              !widget.iscolorchange
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        Constants. backgroundimage,
                        height: 80,
                        width: widget.initialindex == 2 ? 5.15 : 10,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  color:
                      widget.iscolorchange ? Colors.white : Colors.black,
                  width: widget.initialindex == 2 ? 5.15 : 10,
                  height: 80,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              !widget.iscolorchange
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        Constants. backgroundimage,
                        height: 10,
                        width: widget.width,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color:
                      widget.iscolorchange ? Colors.white : Colors.black,
                  width: widget.width,
                  height: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
