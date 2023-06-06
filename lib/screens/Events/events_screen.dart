import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Providers/EventProvider.dart';
import 'package:venq_assessment/Services/Event_Services.dart';
import '../../Models/Events.dart';
import '../../widgets/EventsScreen/EventsFooterButtons.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  void initState() {
    super.initState();
    EventsServices().getAllEvents(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final eventprovider = Provider.of<EventProvider>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double overlapFraction = 0.5;
    double rh = height -
        (height / 10 +
            height / 10 +
            height / 10 +
            4.8 * height / 10 +
            height / 9 +
            MediaQuery.of(context).padding.top);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF2C2F33),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height / 10,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: height / 15,
                    width: width / 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF2C2F33),
                    ),
                  ),
                  SizedBox(
                    width: width / 3,
                  ),
                  Container(
                    height: height / 15,
                    width: width / 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF2C2F33),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, -overlapFraction),
              child: FractionalTranslation(
                translation: Offset(0, -overlapFraction),
                child: Container(
                  height: height / 10,
                  width: 3 * width / 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2C2F33),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: height / 10,
                      width: width / 3,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FractionalTranslation(
              translation: const Offset(0, -1),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: Text("EVENTS",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 30,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            FractionalTranslation(
              translation: const Offset(0, -0.1),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                child: Container(
                  height: 4.8 * height / 10,
                  width: width,
                  decoration: const BoxDecoration(color: Color(0xFF2C2F33)),
                  child: ListView.builder(
                    itemCount: eventprovider.events.length,
                    itemBuilder: (context, index) {
                      final Event club = eventprovider.events[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Container(
                            height: height / 10,
                            width: width / 2,
                            decoration: const BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: Center(
                              child: Text(club.name),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: rh,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: EventsFooterButtons(
                  width: width,
                  colorb: Colors.white,
                  textcolor: const Color(0xFF2C2F33)),
            ),
          ],
        ),
      ),
    );
  }
}
