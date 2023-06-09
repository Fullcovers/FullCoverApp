import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'FooterButtons.dart';

class NewBookings extends StatelessWidget {
  const NewBookings({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Flexible(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                child: Container(
                  height: 3 * height / 11,
                  width: 2 * width / 3,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(
                              2.0,
                            ),
                            child: Center(
                              child: Center(
                                // child: QrImage(
                                //   data: "Hello World",
                                //   version: QrVersions.auto,
                                //   size: height / 7,
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: Text("WATERZ",
                              style: GoogleFonts.bebasNeue(
                                fontSize: 32,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.call_to_action_sharp),
                              iconSize: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text("2x Couple"),
                                      Text("3x Stag")
                                    ],
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.access_time,
                                                size: 17,
                                              ),
                                              Text(
                                                " 08:00 pm",
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.location_on,
                                                size: 17,
                                              ),
                                              Text(
                                                " Take me There",
                                              ),
                                            ],
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                child: Container(
                  height: 3 * height / 11,
                  width: width / 5,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Text("PREVIOUS BOOKINGS",
                          style: GoogleFonts.bebasNeue(
                            fontSize: 30,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
