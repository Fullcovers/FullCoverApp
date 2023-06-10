import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Models/Clubs.dart';

Widget mycard(double height, double width, 
ClubModel club
) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Container(
      width: width / 1.2,
      height: height / 5,
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            "assets/images/Restaurants.jpg",
            fit: BoxFit.cover,
            width: width / 1.1,
            height: height / 5.97,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Opacity(
            opacity: 0.4,
            child: Image.asset(
              fit: BoxFit.cover,
              "assets/images/black.png",
              width: width / 1,
              height: height / 5.97,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(club.name,
                style: GoogleFonts.bebasNeue(
                  fontSize: 48,
                  color: Colors.white,
                )),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width / 1.2,
              height: height / 15,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(children: [
                  SizedBox(width: width/40,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Timings",
                        style: GoogleFonts.sairaCondensed(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Color(0xff545454)),
                      ),
                      Text(
                        "19:00 Hrs - 23:45 Hrs",
                        style: GoogleFonts.sairaCondensed(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xff545454)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: width / 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/womenicon.png",
                          scale: 24,
                          color: Colors.black,
                        ),
                        Text(
                          "2",
                          style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff545454)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Text(
                      ":",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/male.png",
                          scale: 24,
                          color: Colors.black,
                        ),
                        Text(
                          "3",
                          style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xff545454)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width / 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dancefloor Entry",
                        style: GoogleFonts.sairaCondensed(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xff545454)),
                      )
                    ],
                  ),
                  SizedBox(width: width/40,),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200.0)),
                    color: Colors.green,child: Text("    "),
                  )
                ]),
              ),
            ))
      ]),
    ),
  );
}
