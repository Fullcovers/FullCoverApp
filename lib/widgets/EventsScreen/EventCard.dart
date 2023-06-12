import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Models/Events.dart';

Widget myeventcard(double height, double width, Event event) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: SizedBox(
      width: width / 1.2,
      height: height / 5,
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: event.imageUrl.isNotEmpty
              ? Image.network(
                  event.imageUrl,
                  fit: BoxFit.cover,
                  width: width / 1.1,
                  height: height / 5.97,
                )
              : Image.asset(
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
            child: Text(event.name,
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
                      bottomLeft: Radius.circular(15.0),topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(children: [
                  SizedBox(
                    width: width / 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Timings",
                        style: GoogleFonts.sairaCondensed(
                            fontWeight: FontWeight.bold,
                            fontSize: height/86.7,
                            color: Color(0xff545454)),
                      ),
                      Text(
                        "19:00 Hrs - 23:45 Hrs",
                        style: GoogleFonts.sairaCondensed(
                            fontWeight: FontWeight.bold,
                            fontSize: height/61.92857142857143,
                            color: Color(0xff545454)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: width / 3,
                  ),
                  
                
                 Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Starts from",
                        style: GoogleFonts.sairaCondensed(
                            fontWeight: FontWeight.bold,
                            fontSize: height/86.7,
                            color: Color(0xff545454)),
                      ),
                      Text(
                        "Rs. 2000",
                        style: GoogleFonts.sairaCondensed(
                            fontWeight: FontWeight.bold,
                            fontSize: height/61.92857142857143,
                            color: Color(0xff545454)),
                      )
                    ],
                  ),
                 
                ]),
              ),
            ))
      ]),
    ),
  );
}