import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Models/Events.dart';
import 'package:venq_assessment/Services/Club_Services.dart';
import 'package:venq_assessment/Services/Event_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Events/EventDetail.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/CustumPageRoute.dart';
import 'package:venq_assessment/widgets/EventsScreen/EventCard.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/BottonNavBar.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/TopNavBar.dart';

class EventScreenaccgeneres extends StatefulWidget {
   EventScreenaccgeneres({super.key,required this.generes});
  List<String> generes;

  @override
  State<EventScreenaccgeneres> createState() => _EventScreenaccgeneresState();
}

class _EventScreenaccgeneresState extends State<EventScreenaccgeneres> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Future.delayed(Duration(milliseconds: 500), () {
      EventsServices().getAllEvents(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.generes.toString());
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
        backgroundColor: eventbackgroundcolor,
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            topnavigationbar(height: height, width: width, iscolor: true),
            Center(
              child: Text("Events",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 40,
                    color: const Color(0xFFB59F68),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  height: 4.8 * height / 8,
                  width: width,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: FutureBuilder<List<Event>>(
                    future: EventsServices().getAllEvents(context: context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: SizedBox(
                              height: height / 21.675,
                              width: width / 10.275,
                              child: Constants.mycircularProgressIndicator()),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final eventsData = snapshot.data!;

                        return ListView.builder(
                          itemCount: eventsData.length,
                          itemBuilder: (context, index) {
                            final Event event = eventsData[index];

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () async {
                                  await ClubServices().getSingleClub(
                                      clubid: event.clubId, context: context);
                                  Navigator.of(context).push(
                                      ScaleTransitionPageRoute(
                                          child: EventDetail(event: event)));
                                },
                                child: myeventcard(height, width, event),
                              ),
                            );
                          },
                        );
                      }
                    },
                  )),
            ),
          ]),
        ),
        bottomNavigationBar: bottomnavbar(
          isclub: false,
          isevent: true,
          initialindex: 2,
          height: height,
          width: width,
          iscolorchange: true,
        ),
      ),
    );
  }
}
