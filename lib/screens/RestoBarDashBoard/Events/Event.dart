import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Models/Events.dart';
import 'package:venq_assessment/Services/Event_Services.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Events/CreateEvent.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Events/EventDetails.dart';
import 'package:venq_assessment/screens/Events/EventDetail.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/BottomButton.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/eventcard.dart';
import 'package:venq_assessment/widgets/EventsScreen/EventCard.dart';
import 'package:venq_assessment/Styles/Colors.dart';


class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: backgroundColortransperent,
      body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: HeaderContent(title: "EVENTS",icon: Icon(null),),
                ),

                Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                          height: height-300,
                          width: width,
                          decoration:  BoxDecoration(color: backgroundColortransperent),
                          child: FutureBuilder<List<Event>>(
                            future: EventsServices.getmyclubEvents(context: context),
                            
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: SizedBox(
                                    height: height / 21.675,
                                    width: width / 10.275,
                                    child: Constants.mycircularProgressIndicator()
                                  ),
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
                                          // await ClubServices().getSingleClub(
                                          //     clubid: event.clubId, context: context);
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EventDetails(event: event)));
                                        },
                                        child: eventcard(height, width, event.name, event.createdAt.toString().substring(0,10), 15),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          )),
                    ),
              ],
            ),
      ),
      bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                left: width / 5, right: width / 5, bottom: width / 20),
            child: bottombutton(
              "Create Event",
              const Icon(
                Icons.add,
                size: 35,
              ),context,rought:CreateEvent()
            ),
      ),
    ),
          ],
        ));
  }
}
