// Padding(
            //   padding: EdgeInsets.only(left: width / 13, right: width / 13),
            //   child: Container(
            //     height: 3.2 * height / 10,
            //     width: double.maxFinite,
            //     decoration: BoxDecoration(
            //       color: backgroundColorfigma,
            //     ),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         Container(
            //           height: height / 10,
            //           width: double.maxFinite,
            //           decoration: BoxDecoration(
            //               border: Border.all(
            //                 width: 1,
            //                 color: const Color(0XFF979797),
            //               ),
            //               borderRadius:
            //                   const BorderRadius.all(Radius.circular(10.0))),
            //           child: Center(
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceAround,
            //               children: [
            //                 Text(
            //                   "Stag",
            //                   style: GoogleFonts.mavenPro(
            //                     color: const Color(0XFFFFFFFF),
            //                     fontSize: height / 43.35,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                 ),
            //                 Text(
            //                   "Rs. $stagentryprice",
            //                   style: GoogleFonts.sairaCondensed(
            //                     color: const Color(0XFFFFFFFF),
            //                     fontSize: height / 43.35,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                 ),
            //                 Container(
            //                   height: 32,
            //                   width: 100,
            //                   decoration: const BoxDecoration(
            //                     color: Color(0XFFB59F68),
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(20.0)),
            //                   ),
            //                   child: Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.spaceAround,
            //                     children: [
            //                       Flexible(
            //                         flex: 1,
            //                         child: FractionalTranslation(
            //                           translation: const Offset(0, 0.05),
            //                           child: IconButton(
            //                             onPressed: () {
            //                               setState(() {
            //                                 if (stagcount > 0) {
            //                                   stagcount--;
            //                                 }
            //                               });
            //                             },
            //                             icon: Icon(
            //                               Icons.remove,
            //                               size: width / 25,
            //                             ),
            //                             color: Colors.black,
            //                           ),
            //                         ),
            //                       ),
            //                       Flexible(
            //                         flex: 1,
            //                         child: Container(
            //                           height: 32,
            //                           decoration: BoxDecoration(
            //                             border: Border(
            //                               top: BorderSide(
            //                                 color:
            //                                     Colors.black.withOpacity(0.2),
            //                                 width: 2,
            //                                 style: BorderStyle.solid,
            //                               ),
            //                               left: BorderSide(
            //                                 color:
            //                                     Colors.black.withOpacity(0.2),
            //                                 width: 2,
            //                                 style: BorderStyle.solid,
            //                               ),
            //                               right: BorderSide(
            //                                 color:
            //                                     Colors.black.withOpacity(0.2),
            //                                 width: 2,
            //                                 style: BorderStyle.solid,
            //                               ),
            //                             ),
            //                           ),
            //                           child: Center(
            //                             child: Text(
            //                               stagcount
            //                                   .toString(), // Use the dynamic count value
            //                               style: const TextStyle(
            //                                   color: Colors.black),
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                       Flexible(
            //                         flex: 1,
            //                         child: FractionalTranslation(
            //                           translation: const Offset(0, 0.05),
            //                           child: Center(
            //                             child: IconButton(
            //                               onPressed: () {
            //                                 setState(() {
            //                                   stagcount++;
            //                                 });
            //                               },
            //                               icon: const Icon(Icons.add),
            //                               color: Colors.black,
            //                               iconSize: width / 25,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         Container(
            //           height: height / 10,
            //           width: double.maxFinite,
            //           decoration: BoxDecoration(
            //               border: Border.all(
            //                 width: 1,
            //                 color: const Color(0XFF979797),
            //               ),
            //               borderRadius:
            //                   const BorderRadius.all(Radius.circular(10.0))),
            //           child: Center(
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceAround,
            //               children: [
            //                 Text(
            //                   "Couple",
            //                   style: GoogleFonts.mavenPro(
            //                     color: const Color(0XFFFFFFFF),
            //                     fontSize: height / 43.35,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                 ),
            //                 Text(
            //                   "Rs. $coupleentrypricce",
            //                   style: GoogleFonts.sairaCondensed(
            //                     color: const Color(0XFFFFFFFF),
            //                     fontSize: height / 43.35,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                 ),
            //                 Container(
            //                   height: 32,
            //                   width: 100,
            //                   decoration: const BoxDecoration(
            //                     color: Color(0XFFB59F68),
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(20.0)),
            //                   ),
            //                   child: Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.spaceAround,
            //                     children: [
            //                       Flexible(
            //                         flex: 1,
            //                         child: FractionalTranslation(
            //                           translation: const Offset(0, 0.05),
            //                           child: IconButton(
            //                             onPressed: () {
            //                               setState(() {
            //                                 if (couplecount > 0) {
            //                                   couplecount--;
            //                                 }
            //                               });
            //                             },
            //                             icon: Icon(
            //                               Icons.remove,
            //                               size: width / 25,
            //                             ),
            //                             color: Colors.black,
            //                           ),
            //                         ),
            //                       ),
            //                       Flexible(
            //                         flex: 1,
            //                         child: Container(
            //                           height: 32,
            //                           decoration: BoxDecoration(
            //                             border: Border(
            //                               top: BorderSide(
            //                                 color:
            //                                     Colors.black.withOpacity(0.2),
            //                                 width: 2,
            //                                 style: BorderStyle.solid,
            //                               ),
            //                               left: BorderSide(
            //                                 color:
            //                                     Colors.black.withOpacity(0.2),
            //                                 width: 2,
            //                                 style: BorderStyle.solid,
            //                               ),
            //                               right: BorderSide(
            //                                 color:
            //                                     Colors.black.withOpacity(0.2),
            //                                 width: 2,
            //                                 style: BorderStyle.solid,
            //                               ),
            //                             ),
            //                           ),
            //                           child: Center(
            //                             child: Text(
            //                               couplecount
            //                                   .toString(), // Use the dynamic count value
            //                               style: const TextStyle(
            //                                   color: Colors.black),
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                       Flexible(
            //                         flex: 1,
            //                         child: FractionalTranslation(
            //                           translation: const Offset(0, 0.05),
            //                           child: Center(
            //                             child: IconButton(
            //                               onPressed: () {
            //                                 setState(() {
            //                                   couplecount++;
            //                                 });
            //                               },
            //                               icon: const Icon(Icons.add),
            //                               color: Colors.black,
            //                               iconSize: width / 25,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         Container(
            //           height: height / 10,
            //           width: double.maxFinite,
            //           decoration: BoxDecoration(
            //               border: Border.all(
            //                 width: 1,
            //                 color: const Color(0XFF979797),
            //               ),
            //               borderRadius:
            //                   const BorderRadius.all(Radius.circular(10.0))),
            //           child: Center(
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceAround,
            //               children: [
            //                 Text(
            //                   "Female",
            //                   style: GoogleFonts.mavenPro(
            //                     color: const Color(0XFFFFFFFF),
            //                     fontSize: height / 43.35,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                 ),
            //                 Text(
            //                   "Rs. $femaleentryprice",
            //                   style: GoogleFonts.sairaCondensed(
            //                     color: const Color(0XFFFFFFFF),
            //                     fontSize: height / 43.35,
            //                     fontWeight: FontWeight.w500,
            //                   ),
            //                 ),
            //                 Container(
            //                   height: 32,
            //                   width: 100,
            //                   decoration: const BoxDecoration(
            //                     color: Color(0XFFB59F68),
            //                     borderRadius:
            //                         BorderRadius.all(Radius.circular(20.0)),
            //                   ),
            //                   child: Row(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.spaceAround,
            //                     children: [
            //                       Flexible(
            //                         flex: 1,
            //                         child: FractionalTranslation(
            //                           translation: const Offset(0, 0.05),
            //                           child: IconButton(
            //                             onPressed: () {
            //                               setState(() {
            //                                 if (femalecount > 0) {
            //                                   femalecount--;
            //                                 }
            //                               });
            //                             },
            //                             icon: Icon(
            //                               Icons.remove,
            //                               size: width / 25,
            //                             ),
            //                             color: Colors.black,
            //                           ),
            //                         ),
            //                       ),
            //                       Flexible(
            //                         flex: 1,
            //                         child: Container(
            //                           height: height / 27,
            //                           decoration: BoxDecoration(
            //                             border: Border(
            //                               top: BorderSide(
            //                                 color:
            //                                     Colors.black.withOpacity(0.2),
            //                                 width: 2,
            //                                 style: BorderStyle.solid,
            //                               ),
            //                               left: BorderSide(
            //                                 color:
            //                                     Colors.black.withOpacity(0.2),
            //                                 width: 2,
            //                                 style: BorderStyle.solid,
            //                               ),
            //                               right: BorderSide(
            //                                 color:
            //                                     Colors.black.withOpacity(0.2),
            //                                 width: 2,
            //                                 style: BorderStyle.solid,
            //                               ),
            //                             ),
            //                           ),
            //                           child: Center(
            //                             child: Text(
            //                               femalecount
            //                                   .toString(), // Use the dynamic count value
            //                               style: const TextStyle(
            //                                   color: Colors.black),
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                       Flexible(
            //                         flex: 1,
            //                         child: FractionalTranslation(
            //                           translation: const Offset(0, 0.05),
            //                           child: Center(
            //                             child: IconButton(
            //                               onPressed: () {
            //                                 setState(() {
            //                                   femalecount++;
            //                                 });
            //                               },
            //                               icon: const Icon(Icons.add),
            //                               color: Colors.black,
            //                               iconSize: width / 25,
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),