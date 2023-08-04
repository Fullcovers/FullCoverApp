import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Models/Ticket.dart';
import 'package:venq_assessment/Services/Ticket_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Events/EventDetail2.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/widgets/CustumPageRoute.dart';
import 'package:venq_assessment/widgets/RestaurantsPage/TopNavBar.dart';

import '../../Models/Events.dart';
import '../../Providers/ClubProvider.dart';
import '../../Services/Club_Services.dart';

class EventDetail extends StatefulWidget {
  Event event;

  EventDetail({super.key, required this.event});

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  List<Ticket> etickets=[];bool loded=false;  Map<Ticket, int> orderticketscount = {};

  geteventtickets()async{
     etickets=  await TicketServices()
        .getEventsTickets(context: context, eventId: widget.event.id);
        
         for (var i = 0; i < etickets.length; i++) {
      orderticketscount[etickets[i]] = 0;
    }
    setState(() {
          loded=true;
        });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {geteventtickets();
    final clubprovider = Provider.of<ClubProvider>(context, listen: false);
    print(widget.event.clubId);
    ClubServices().getSingleClub(context: context, clubid: widget.event.clubId);

    List<String> facilities = [];
    if (clubprovider.club != null) {
      facilities = clubprovider.club!.facilities;
    }
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: eventbackgroundcolor,
        body: Column(
          children: [
            SizedBox(
              height: height / 10,
            ),

            // topnavigationbar(height, width, true),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FractionalTranslation(
                      translation: const Offset(0, -0.2),
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: Container(
                          height: height / 5,
                          width: width,
                          decoration: BoxDecoration(
                              color: backgroundColorfigma,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: widget.event.imageUrl != ''
                              ? Image.network(
                                  fit: BoxFit.fill,
                                  widget.event.imageUrl,
                                  width: width,
                                )
                              : Image.asset(
                                  "assets/images/Restaurants.jpg",
                                  fit: BoxFit.cover,
                                  width: width / 1.1,
                                  height: height / 5.97,
                                ),
                        ),
                      ),
                    ),
                    FractionalTranslation(
                      translation: const Offset(0, -0.3),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.event.name,
                                  style: GoogleFonts.bebasNeue(
                                      color: backgroundColorfigma,
                                      fontSize: 35),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Container(
                                    height: 2.5 * height / 100,
                                    width: 2 * width / 10,
                                    decoration: BoxDecoration(
                                      color: offwhite,
                                      border: Border.all(
                                        width: 1,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Techno",
                                      style: TextStyle(
                                        color: backgroundColorfigma,
                                      ),
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      color: Color(0XFF444444),
                      thickness: 1,
                    ),
                    FractionalTranslation(
                      translation: const Offset(0, 0.13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat('EE, d MMMM y')
                                      .format(widget.event.date),
                                  style: GoogleFonts.sairaCondensed(
                                    color: backgroundColorfigma,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    DateFormat.jm().format(widget.event.date),
                                    style: GoogleFonts.sairaCondensed(
                                      color: const Color(0XFF565555),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text(
                              "21+",
                              style: GoogleFonts.bebasNeue(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 32,
                                  color: const Color(0XFFB59F68)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      height: 1,
                      color: Color(0XFF444444),
                      thickness: 1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, left: 20.0),
                          child: Text(
                            "Hosted by",
                            style: GoogleFonts.sairaCondensed(
                                color: const Color(0XFF565555),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        FractionalTranslation(
                          translation: const Offset(0, -0.35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  clubprovider.club?.name ?? "",
                                  style: GoogleFonts.bebasNeue(
                                    color: const Color(0XFFB59F68),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              FractionalTranslation(                          translation: const Offset(0, 0.35),

                                child: Padding(
                                  padding: const EdgeInsets.only(right: 25.0),
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                        color: backgroundColorfigma,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.white,
                                          size: 40,
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        FractionalTranslation(
                          translation: const Offset(0, -0.55),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.location_on_outlined),
                              ),
                              FractionalTranslation(
                                translation: const Offset(0.05, 0),
                                child: Container(width: width/1.6,
                                  child: Text(textAlign: TextAlign.left,
                                    clubprovider.club?.address ?? "",
                                    style: GoogleFonts.sairaCondensed(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: backgroundColorfigma,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const FractionalTranslation(
                      translation: Offset(0, -25),
                      child: Divider(
                        height: 1,
                        color: Color(0XFF444444),
                        thickness: 1,
                      ),
                    ),
                    FractionalTranslation(
                      translation: const Offset(0, -0.3),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Line Up",
                                  style: GoogleFonts.sairaCondensed(
                                    color: backgroundColorfigma,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: facilities.isNotEmpty
                                      ? facilities.map((facility) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                top: 4.0, right: 10),
                                            child: Container(
                                              height: 2.5 * height / 100,
                                              width: 2 * width / 10,
                                              decoration: BoxDecoration(
                                                color: offwhite,
                                                border: Border.all(
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(5.0),
                                                ),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                facility,
                                                style: TextStyle(
                                                  color: golden,
                                                ),
                                              )),
                                            ),
                                          );
                                        }).toList()
                                      : [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4.0),
                                            child: Container(
                                              height: 2.5 * height / 100,
                                              width: 2 * width / 10,
                                              decoration: BoxDecoration(
                                                color: offwhite,
                                                border: Border.all(
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(5.0),
                                                ),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                "Techno",
                                                style: TextStyle(
                                                  color: golden,
                                                ),
                                              )),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0),
                                              child: Container(
                                                height: 2.5 * height / 100,
                                                width: 2 * width / 10,
                                                decoration: BoxDecoration(
                                                  color: offwhite,
                                                  border: Border.all(
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5.0),
                                                  ),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  "Techno",
                                                  style: TextStyle(
                                                    color: golden,
                                                  ),
                                                )),
                                              )),
                                          const SizedBox(width: 10),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0),
                                              child: Container(
                                                height: 2.5 * height / 100,
                                                width: 2 * width / 10,
                                                decoration: BoxDecoration(
                                                  color: offwhite,
                                                  border: Border.all(
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5.0),
                                                  ),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  "Techno",
                                                  style: TextStyle(
                                                    color: golden,
                                                  ),
                                                )),
                                              )),
                                          const SizedBox(width: 10),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4.0),
                                              child: Container(
                                                height: 2.5 * height / 100,
                                                width: 2 * width / 10,
                                                decoration: BoxDecoration(
                                                  color: offwhite,
                                                  border: Border.all(
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(5.0),
                                                  ),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  "Techno",
                                                  style: TextStyle(
                                                    color: golden,
                                                  ),
                                                )),
                                              )),
                                        ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const FractionalTranslation(
                      translation: Offset(0, -0.1),
                      child: Divider(
                        height: 1,
                        color: Color(0XFF444444),
                        thickness: 1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 20.0),
                              child: Text(
                                "About",
                                style: GoogleFonts.sairaCondensed(
                                  color: const Color(0XFF838383),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 5.0),
                              child: Text(
                                widget.event.description,
                                style: GoogleFonts.sairaCondensed(
                                  color: backgroundColorfigma,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        FractionalTranslation(
                          translation: const Offset(-0.15, -0.05),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: backgroundColorfigma,
                                )),
                          ),
                        ),
                      ],
                    ),
                    const FractionalTranslation(
                      translation: Offset(0, 9),
                      child: Divider(
                        height: 1,
                        color: Color(0XFF444444),
                        thickness: 1,
                      ),
                    ),
                    FractionalTranslation(
                      translation: const Offset(0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "Terms",
                              style: GoogleFonts.sairaCondensed(
                                  color: backgroundColorfigma,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: backgroundColorfigma,
                                )),
                          ),
                        ],
                      ),
                    ),
                    const FractionalTranslation(
                      translation: Offset(0, -10),
                      child: Divider(
                        height: 1,
                        color: Color(0XFF444444),
                        thickness: 1,
                      ),
                    ),
                  Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            SlideTransitionPageRoute(direction: "left",
                                child:EventDetail2(etickets: etickets,orderticketscount:orderticketscount,
                                      club: clubprovider.club!,
                                      event: widget.event,
                                    )),
                          );
                        },
                        child: Center(
                          child: Container(
                            height: height / 15,
                            width: width,
                            decoration: BoxDecoration(
                                color: offwhite,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                                border: Border.all(
                                  color: backgroundColorfigma,
                                )),
                            child: loded?  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    "Starts at Rs.999",
                                    style: GoogleFonts.sairaCondensed(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xFF1E1E1E)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Container(
                                    height: height / 28,
                                    width: width / 10.275,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: backgroundColorfigma),child: Icon(Icons.arrow_forward,color: Colors.white,),
                                  ),
                                )
                              ],
                            ): Center(
                              child: Container(
                                  width: 20,
                                  height: 20,
                                  child:Constants.mycircularProgressIndicator())),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
