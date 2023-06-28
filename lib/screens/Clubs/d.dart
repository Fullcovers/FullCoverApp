// Padding(
//                     padding: EdgeInsets.only(
//                         left: width / 13, right: width / 13, top: 10),
//                     child: SizedBox(
//                       height: height / 4,
//                       child: FutureBuilder<List<Ticket>>(
//                         future: TicketServices().getClubsTickets(
//                           context: context,
//                           clubId: widget.club.id,
//                         ),
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.waiting) {
//                             return const SizedBox(
//                                 height: 40,
//                                 width: 40,
//                                 child:
//                                     Center(child: CircularProgressIndicator()));
//                           } else if (snapshot.hasError) {
//                             return Text('Error: ${snapshot.error}');
//                           } else if (snapshot.hasData) {
//                             List<Ticket> tickets = snapshot.data!;
//                             return Container(
//                               height: 3.2 * height / 10,
//                               width: double.maxFinite,
//                               decoration: BoxDecoration(
//                                 color: backgroundColorfigma,
//                               ),
//                               child: ListView.builder(
//                                 itemCount: tickets.length,
//                                 itemBuilder: (context, index) {
//                                   Ticket ticket = tickets[index];
//                                   if (ticket.name == 'Stag' ||
//                                       ticket.name == 'stag') {
//                                     stagid = ticket.id;
//                                     stagentryprice = ticket.current;
//                                   } else if (ticket.name == "couple" ||
//                                       ticket.name == "Couple") {
//                                     coupleid = ticket.id;
//                                     coupleentrypricce = ticket.current;
//                                   } else {
//                                     femaleid = femaleid;
//                                     femaleentryprice = ticket.current;
//                                   }
//                                   return Container(
//                                     height: height / 10,
//                                     width: double.maxFinite,
//                                     decoration: BoxDecoration(
//                                         border: Border.all(
//                                           width: 1,
//                                           color: const Color(0XFF979797),
//                                         ),
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(10.0))),
//                                     child: Center(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: [
//                                           Text(
//                                             ticket.name,
//                                             style: GoogleFonts.mavenPro(
//                                               color: const Color(0XFFFFFFFF),
//                                               fontSize: height / 43.35,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                           Text(
//                                             "Rs. ${ticket.current}",
//                                             style: GoogleFonts.sairaCondensed(
//                                               color: const Color(0XFFFFFFFF),
//                                               fontSize: height / 43.35,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                           ),
//                                           Container(
//                                             height: 32,
//                                             width: 100,
//                                             decoration: const BoxDecoration(
//                                               color: Color(0XFFB59F68),
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(20.0)),
//                                             ),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               children: [
//                                                 Flexible(
//                                                   flex: 1,
//                                                   child: FractionalTranslation(
//                                                     translation:
//                                                         const Offset(0, 0.05),
//                                                     child: IconButton(
//                                                       onPressed: () {
//                                                         if (ticket.name ==
//                                                                 "Stag" ||
//                                                             ticket.name ==
//                                                                 "stag") {
//                                                           setState(() {
//                                                             if (stagcount > 0) {
//                                                               stagcount--;
//                                                             }
//                                                           });
//                                                         } else if (ticket
//                                                                     .name ==
//                                                                 'couple' ||
//                                                             ticket.name ==
//                                                                 "Couple") {
//                                                           setState(() {
//                                                             if (couplecount >
//                                                                 0) {
//                                                               couplecount--;
//                                                             }
//                                                           });
//                                                         } else {
//                                                           setState(() {
//                                                             if (femalecount >
//                                                                 0) {
//                                                               femalecount--;
//                                                             }
//                                                           });
//                                                         }
//                                                       },
//                                                       icon: Icon(
//                                                         Icons.remove,
//                                                         size: width / 25,
//                                                       ),
//                                                       color: Colors.black,
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Flexible(
//                                                   flex: 1,
//                                                   child: Container(
//                                                     height: height / 27,
//                                                     decoration: BoxDecoration(
//                                                       border: Border(
//                                                         top: BorderSide(
//                                                           color: Colors.black
//                                                               .withOpacity(0.2),
//                                                           width: 2,
//                                                           style:
//                                                               BorderStyle.solid,
//                                                         ),
//                                                         left: BorderSide(
//                                                           color: Colors.black
//                                                               .withOpacity(0.2),
//                                                           width: 2,
//                                                           style:
//                                                               BorderStyle.solid,
//                                                         ),
//                                                         right: BorderSide(
//                                                           color: Colors.black
//                                                               .withOpacity(0.2),
//                                                           width: 2,
//                                                           style:
//                                                               BorderStyle.solid,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     child: Center(
//                                                       child: Text(
//                                                         getCountByTicketName(
//                                                             ticket.name),
//                                                         style: const TextStyle(
//                                                             color:
//                                                                 Colors.black),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Flexible(
//                                                   flex: 1,
//                                                   child: FractionalTranslation(
//                                                     translation:
//                                                         const Offset(0, 0.05),
//                                                     child: Center(
//                                                       child: IconButton(
//                                                         onPressed: () {
//                                                           if (ticket.name ==
//                                                                   "Stag" ||
//                                                               ticket.name ==
//                                                                   "stag") {
//                                                             setState(() {
//                                                               stagcount++;
//                                                             });
//                                                           } else if (ticket
//                                                                       .name ==
//                                                                   'couple' ||
//                                                               ticket.name ==
//                                                                   "Couple") {
//                                                             setState(() {
//                                                               couplecount++;
//                                                             });
//                                                           } else {
//                                                             setState(() {
//                                                               femalecount++;
//                                                             });
//                                                           }
//                                                         },
//                                                         icon: const Icon(
//                                                             Icons.add),
//                                                         color: Colors.black,
//                                                         iconSize: width / 25,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             );
//                           } else {
//                             return const Text(
//                                 'No tickets found'); // Show a message if no tickets are available
//                           }
//                         },
//                       ),
//                     ),
//                   ),