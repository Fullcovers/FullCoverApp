import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Providers/EventProvider.dart';
import 'package:venq_assessment/Services/Event_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/BottonNavBar.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/TopNavBar.dart';
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
          backgroundColor: backgroundColorfigma,
          body: Column(
            children: [
              topnavigationbar(height, width),
              FractionalTranslation(
                translation: const Offset(0, -0.5),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(
                    child: Text("Events",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 40,
                          color: Color(0xFFB59F68),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: height / 1.75,
                  width: (width / 5) + (width / 1.5),
                  decoration: BoxDecoration(color: backgroundColorfigma),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Card(
                              color: offwhite,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Container(
                                height: height / 12.21,
                                width: width / 5.788,
                                decoration: BoxDecoration(
                                  color: offwhite,
                                  borderRadius: BorderRadius.all(
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
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/eventdetail');
                              },
                              child: Card(
                                color: offwhite,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Container(
                                  height: height / 12.21,
                                  width: width / 1.55,
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
                                        "Event " + (index + 1).toString(),
                                        style: GoogleFonts.sairaCondensed(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 24,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text("Starts from",
                                              style: GoogleFonts.mavenPro(
                                                fontSize: 11,
                                              )),
                                          Text("Rs. 2000",
                                              style: GoogleFonts.bebasNeue(
                                                fontSize: 28,
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
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
            ],
          ),
          bottomNavigationBar: bottomnavbar(height: height, width: width)),
    );
  }
}
