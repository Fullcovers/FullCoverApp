import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Providers/ClubProvider.dart';
import 'package:venq_assessment/Providers/EventProvider.dart';
import 'package:venq_assessment/Services/Club_Services.dart';
import 'package:venq_assessment/Services/Event_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Events/StoryView.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/eventcard.dart';
import 'package:venq_assessment/widgets/CustumPageRoute.dart';
import 'package:venq_assessment/widgets/EventsScreen/EventCard.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/BottonNavBar.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/TopNavBar.dart';
import 'package:venq_assessment/screens/Events/EventDetail.dart';
import '../../Models/Events.dart';
import '../../widgets/EventsScreen/EventsFooterButtons.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Future.delayed(Duration(milliseconds: 500), () {
      EventsServices().getAllEvents(context: context);
    });
  }

  String formatDate(DateTime? date) {
    if (date != null) {
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      return formatter.format(date);
    }
    return 'Select Date';
  }

  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ??
          DateTime
              .now(), // Use selectedDate if available, else use current date
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate; // Update selectedDate if a date was picked
      });
    }
  }

List<String> imageurls=[];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double rh = height -
        (height / 10 +
            height / 10 +
            height / 10 +
            4.8 * height / 10 +
            height / 9 +
            MediaQuery.of(context).padding.top);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            topnavigationbar(height: height, width: width, iscolor: false),
            //  Expanded(
            //   child: ListView.builder(shrinkWrap:true,
            //     itemCount: 5,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Container(height: height/20.2,width: width/4.28125,child: Stack(children: [Image.asset("assets/images/clubimg.png")],),);
            //     },
            //   ),
            // ),
            // FractionalTranslation(
            //   translation: Offset(0, -0.6),
            // child:
            Align(
                alignment: Alignment.centerLeft,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          // height: height / 20.2,
                          // width: width / 4.28125,
                          child: Stack(
                            children: [
                              InkWell(onTap: () {
                                Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                     MoreStories()));
                              },
                                child: CircleAvatar(
                                    radius: 35,
                                    backgroundImage:
                                        AssetImage("assets/images/clubimg.png")),
                              ),
                              // CircleAvatar(radius: 100,
                              //     child: Opacity(
                              //         opacity: 0.5,
                              //         backgroundImage: Image.asset(
                              //             "assets/images/black.png"))),
                              // Center(
                              //   child: Text("Apostrophe",
                              //       style: GoogleFonts.sairaCondensed(
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.w600,
                              //         fontSize: 15,
                              //       )),
                              // )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          // height: height / 20.2,
                          // width: width / 4.28125,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      AssetImage("assets/images/clubimg1.png")),
                              // CircleAvatar(radius: 100,
                              //     child: Opacity(
                              //         opacity: 0.5,
                              //         backgroundImage: Image.asset(
                              //             "assets/images/black.png"))),
                              // Center(
                              //   child: Text("Apostrophe",
                              //       style: GoogleFonts.sairaCondensed(
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.w600,
                              //         fontSize: 15,
                              //       )),
                              // )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          // height: height / 20.2,
                          // width: width / 4.28125,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      AssetImage("assets/images/clubimg2.png")),
                              // CircleAvatar(radius: 100,
                              //     child: Opacity(
                              //         opacity: 0.5,
                              //         backgroundImage: Image.asset(
                              //             "assets/images/black.png"))),
                              // Center(
                              //   child: Text("Apostrophe",
                              //       style: GoogleFonts.sairaCondensed(
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.w600,
                              //         fontSize: 15,
                              //       )),
                              // )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          // height: height / 20.2,
                          // width: width / 4.28125,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      AssetImage("assets/images/clubimg3.png")),
                              // CircleAvatar(radius: 100,
                              //     child: Opacity(
                              //         opacity: 0.5,
                              //         backgroundImage: Image.asset(
                              //             "assets/images/black.png"))),
                              // Center(
                              //   child: Text("Apostrophe",
                              //       style: GoogleFonts.sairaCondensed(
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.w600,
                              //         fontSize: 15,
                              //       )),
                              // )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Container(
                          // height: height / 20.2,
                          // width: width / 4.28125,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      AssetImage("assets/images/clubimg4.png")),
                              // CircleAvatar(radius: 100,
                              //     child: Opacity(
                              //         opacity: 0.5,
                              //         backgroundImage: Image.asset(
                              //             "assets/images/black.png"))),
                              // Center(
                              //   child: Text("Apostrophe",
                              //       style: GoogleFonts.sairaCondensed(
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.w600,
                              //         fontSize: 15,
                              //       )),
                              // )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          // height: height / 20.2,
                          // width: width / 4.28125,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                  radius: 35,
                                  backgroundImage:
                                      AssetImage("assets/images/clubimg5.png")),
                              // ClipRRect(
                              //     borderRadius: BorderRadius.circular(10),
                              //     child: Opacity(
                              //         opacity: 0.5,
                              //         child: Image.asset(
                              //             "assets/images/black.png"))),
                              // Center(
                              //   child: Text("010",
                              //       style: GoogleFonts.sairaCondensed(
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.w600,
                              //         fontSize: 15,
                              //       )),
                              // )
                            ],
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 8.0),
                      //   child: Container(
                      //     height: height / 20.2,
                      //     width: width / 4.28125,
                      //     child: Stack(
                      //       children: [
                      //         ClipRRect(
                      //             borderRadius: BorderRadius.circular(10),
                      //             child:
                      //                 Image.asset("assets/images/clubimg.png")),
                      //         ClipRRect(
                      //             borderRadius: BorderRadius.circular(10),
                      //             child: Opacity(
                      //                 opacity: 0.5,
                      //                 child: Image.asset(
                      //                     "assets/images/black.png"))),
                      //         Center(
                      //           child: Text("Apostrophe",
                      //               style: GoogleFonts.sairaCondensed(
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.w600,
                      //                 fontSize: 15,
                      //               )),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 8.0),
                      //   child: Container(
                      //     height: height / 20.2,
                      //     width: width / 4.28125,
                      //     child: Stack(
                      //       children: [
                      //         ClipRRect(
                      //             borderRadius: BorderRadius.circular(10),
                      //             child:
                      //                 Image.asset("assets/images/clubimg.png")),
                      //         ClipRRect(
                      //             borderRadius: BorderRadius.circular(10),
                      //             child: Opacity(
                      //                 opacity: 0.5,
                      //                 child: Image.asset(
                      //                     "assets/images/black.png"))),
                      //         Center(
                      //           child: Text("Apostrophe",
                      //               style: GoogleFonts.sairaCondensed(
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.w600,
                      //                 fontSize: 15,
                      //               )),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 8.0),
                      //   child: Container(
                      //     height: height / 20.2,
                      //     width: width / 4.28125,
                      //     child: Stack(
                      //       children: [
                      //         ClipRRect(
                      //             borderRadius: BorderRadius.circular(10),
                      //             child:
                      //                 Image.asset("assets/images/clubimg.png")),
                      //         ClipRRect(
                      //             borderRadius: BorderRadius.circular(10),
                      //             child: Opacity(
                      //                 opacity: 0.5,
                      //                 child: Image.asset(
                      //                     "assets/images/black.png"))),
                      //         Center(
                      //           child: Text("Apostrophe",
                      //               style: GoogleFonts.sairaCondensed(
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.w600,
                      //                 fontSize: 15,
                      //               )),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )),
            // ),

            // FractionalTranslation(
            //   translation: Offset(0, -0.5),
            // child:
            SizedBox(
              height: height / 20,
            ),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              spacing: width / 16,
              runSpacing: 15,
              children: [
                genresbox(width, height, "Techno",
                    'assets/images/geners/Genre-List_01.png'),
                genresbox(width, height, "Bolly",
                    'assets/images/geners/Genre-List_03.png'),
                genresbox(width, height, "EDM",
                    'assets/images/geners/Genre-List_04.png'),
                genresbox(width, height, "Concerts",
                    'assets/images/geners/Genre-List_05.png'),
                genresbox(width, height, "Hip-Hop",
                    'assets/images/geners/Genre-List_02.png'),
                      genresbox(width, height, "Other",
                    'assets/images/geners/Genre-List_06.png'),
                //     genresbox(width, height, "Concerts",
                //     'assets/images/geners/Genre-List_07.png'),
                // genresbox(width, height, "Hip-Hop",
                //     'assets/images/geners/Genre-List_08.png'),
                // genresbox(width, height, "Other",
                //     'assets/images/geners/Genre-List_09.png'),
                //     genresbox(width, height, "Other",
                //     'assets/images/geners/Genre-List_06.png'),
                // Container(
                //   height: height / 18.0625,
                //   width: width / 1.1,
                //   child: Stack(
                //     children: [
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(8.0),
                //         child: Image.asset(
                //           'assets/images/clubimg.png',
                //           width: width / 1.1,
                //           height: height / 18.0625,
                //           fit: BoxFit.fill,
                //         ),
                //       ),
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(8.0),
                //         child: Opacity(
                //           opacity: 0.5,
                //           child: Image.asset(
                //             'assets/images/black.png',
                //             width: width / 1.1,
                //             height: height / 18.0625,
                //             fit: BoxFit.fill,
                //           ),
                //         ),
                //       ),
                //       Center(
                //         child: Text("other",
                //             style: GoogleFonts.sairaCondensed(
                //               color: Colors.white,
                //               fontWeight: FontWeight.w600,
                //               fontSize: 15,
                //             )),
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: height / 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade700 .withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, top: 8),
                            child: Text("Events Today",
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 18,
                                  color: Colors.white,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 20, bottom: 20, left: 60, right: 10),
                            child: Container(
                              height: height / 20,
                              width: width / 2.5,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                    ),
                                    child: Text(
                                        selectedDate != null
                                            ? formatDate(selectedDate)
                                            : formatDate(DateTime.now()),
                                        style: GoogleFonts.sairaCondensed(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: IconButton(
                                      onPressed: () {
                                        _selectDate(
                                            context); // Show the date picker on icon press
                                      },
                                      icon: const Icon(
                                        Icons.calendar_today_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          height: height / 6,
                          width: width,
                          decoration:  BoxDecoration(
                      color: Colors.grey.shade900.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                          child: FutureBuilder<List<Event>>(
                            future:
                                EventsServices().getAllEvents(context: context),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: SizedBox(
                                      height: height / 21.675,
                                      width: width / 10.275,
                                      child: Constants
                                          .mycircularProgressIndicator()),
                                );
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                final eventsData = snapshot.data!;
                                var eventdatabydate = [];
                                if (eventsData.isNotEmpty) {
                                  for (var i = 0; i < eventsData.length; i++) {
                                    var date = selectedDate == null
                                        ? formatDate(DateTime.now())
                                        : formatDate(selectedDate);
                                    if (eventsData[i]
                                            .date
                                            .toString()
                                            .substring(0, 10) ==
                                        date) {
                                      eventdatabydate.add(eventsData[i]);
                                    }
                                  }
                                }
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: eventdatabydate.length,
                                  itemBuilder: (context, index) {
                                    final Event event = eventdatabydate[index];

                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, bottom: 16),
                                      child: GestureDetector(
                                        onTap: () async {
                                          await ClubServices().getSingleClub(
                                              clubid: event.clubId,
                                              context: context);
                                          Navigator.of(context).push(
                                              ScaleTransitionPageRoute(
                                                  child: EventDetail(
                                                      event: event)));
                                        },
                                        child:
                                            myeventcard(height, width, event),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(height: height/20,),
            // Align(
            //   alignment: Alignment.center,
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 8.0),
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: Colors.grey.shade700 .withOpacity(0.4),
            //           borderRadius: BorderRadius.circular(20)),
            //       child: Column(
            //         children: [
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.only(left: 16.0, top: 8),
            //                 child: Text("Upcoming Today",
            //                     style: GoogleFonts.bebasNeue(
            //                       fontSize: 18,
            //                       color: Colors.white,
            //                     )),
            //               ),
            //               // Padding(
            //               //   padding: EdgeInsets.only(
            //               //       top: 20, bottom: 20, left: 60, right: 10),
            //               //   child: Container(
            //               //     height: height / 20,
            //               //     width: width / 2.5,
            //               //     decoration: BoxDecoration(
            //               //       color: Colors.black,
            //               //       borderRadius: BorderRadius.circular(15.0),
            //               //       border: Border.all(
            //               //         color: Colors.white,
            //               //       ),
            //               //     ),
            //               //     child: Row(
            //               //       mainAxisAlignment:
            //               //           MainAxisAlignment.spaceBetween,
            //               //       children: [
            //               //         Padding(
            //               //           padding: const EdgeInsets.only(
            //               //             left: 20.0,
            //               //           ),
            //               //           child: Text(
            //               //               selectedDate != null
            //               //                   ? formatDate(selectedDate)
            //               //                   : "Select Date",
            //               //               style: GoogleFonts.sairaCondensed(
            //               //                 fontSize: 16,
            //               //                 fontWeight: FontWeight.w600,
            //               //                 color: Colors.white,
            //               //               )),
            //               //         ),
            //               //         Padding(
            //               //           padding: const EdgeInsets.only(right: 10.0),
            //               //           child: IconButton(
            //               //             onPressed: () {
            //               //               _selectDate(
            //               //                   context); // Show the date picker on icon press
            //               //             },
            //               //             icon: const Icon(
            //               //               Icons.calendar_today_outlined,
            //               //               color: Colors.white,
            //               //               size: 20,
            //               //             ),
            //               //           ),
            //               //         ),
            //               //       ],
            //               //     ),
            //               //   ),
            //               // ),
            //             ],
            //           ),
            //           Container(
            //               height: height / 6,
            //               width: width,
            //               decoration:  BoxDecoration(
            //           color: Colors.grey.shade900.withOpacity(0.4),
            //           borderRadius: BorderRadius.circular(20)),
            //               child: FutureBuilder<List<Event>>(
            //                 future:
            //                     EventsServices().getAllEvents(context: context),
            //                 builder: (context, snapshot) {
            //                   if (snapshot.connectionState ==
            //                       ConnectionState.waiting) {
            //                     return Center(
            //                       child: SizedBox(
            //                           height: height / 21.675,
            //                           width: width / 10.275,
            //                           child: Constants
            //                               .mycircularProgressIndicator()),
            //                     );
            //                   } else if (snapshot.hasError) {
            //                     return Text('Error: ${snapshot.error}');
            //                   } else {
            //                     final eventsData = snapshot.data!;
            //                     var eventdatabydate = [];
            //                     if (eventsData.isNotEmpty) {
            //                       for (var i = 0; i < eventsData.length; i++) {
            //                         var date = selectedDate == null
            //                             ? formatDate(DateTime.now())
            //                             : formatDate(selectedDate);
            //                         if (eventsData[i]
            //                                 .date
            //                                 .toString()
            //                                 .substring(0, 10) ==
            //                             date) {
            //                           eventdatabydate.add(eventsData[i]);
            //                         }
            //                       }
            //                     }
            //                     return ListView.builder(
            //                       scrollDirection: Axis.horizontal,
            //                       itemCount: eventdatabydate.length,
            //                       itemBuilder: (context, index) {
            //                         final Event event = eventdatabydate[index];

            //                         return Padding(
            //                           padding: const EdgeInsets.only(
            //                               left: 10.0, bottom: 16),
            //                           child: GestureDetector(
            //                             onTap: () async {
            //                               await ClubServices().getSingleClub(
            //                                   clubid: event.clubId,
            //                                   context: context);
            //                               Navigator.of(context).push(
            //                                   ScaleTransitionPageRoute(
            //                                       child: EventDetail(
            //                                           event: event)));
            //                             },
            //                             child:
            //                                 myeventcard(height, width, event),
            //                           ),
            //                         );
            //                       },
            //                     );
            //                   }
            //                 },
            //               )),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // ),
            SizedBox(
              height: height / 20,
            ),

            // FractionalTranslation(
            //   translation: Offset(0, -0.1),
            // child:

            // ),
            // FractionalTranslation(
            //   translation: Offset(0, -0.15),
            // child:
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
            //     child: Text("Featured Event",
            //         style: GoogleFonts.bebasNeue(
            //           fontSize: 18,
            //           color: backgroundColorfigma,
            //         )),
            //   ),
            // ),
            // ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(8.0),
            //   child: Image.asset(
            //     'assets/images/clubimg.png',
            //     width: width / 1.07,
            //     height: height / 5,
            //     fit: BoxFit.fill,
            //   ),
            // ),
            // Container(
            //   height: height / 5.5,
            //   width: width / 1,
            //   child: Stack(
            //     children: [
            //       ClipRRect(
            //           borderRadius: BorderRadius.circular(10),
            //           child: Image.asset("assets/images/clubimg.png")),
            //       // ClipRRect(
            //       //     borderRadius: BorderRadius.circular(10),
            //       //     child: Opacity(
            //       //         opacity: 0.5,
            //       //         child: Image.asset(width:width/2,
            //       //             "assets/images/black.png"))),
            //     ],
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.center,
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Text("Genres",
            //         style: GoogleFonts.bebasNeue(
            //           fontSize: 35,
            //           color: backgroundColorfigma,
            //         )),
            //   ),
            // ),

            SizedBox(
              height: height / 10,
            )
          ]),
        ),
        bottomNavigationBar: bottomnavbar(
          isclub: false,
          isevent: true,
          initialindex: 2,
          height: height,
          width: width,
          iscolorchange: false,
        ),
      ),
    );
  }
}

Widget genresbox(double width, double height, String text, String images) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: backgroundColorfigma,
    ),
    height: height / 12,
    width: width / 4,
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            images,
            width: width / 4,
            height: height / 12,
            fit: BoxFit.fill,
          ),
        ),
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(8.0),
        //   child: Opacity(
        //     opacity: 0.5,
        //     child: Image.asset(
        //       'assets/images/black.png',
        //       width: width / 4.18,
        //       height: height / 18.0625,
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        // ),

        // Center(
        //   child: Text(text,
        //       style: GoogleFonts.sairaCondensed(
        //         color: Colors.white,
        //         fontWeight: FontWeight.w600,
        //         fontSize: 15,
        //       )),
        // )
      ],
    ),
  );
}
