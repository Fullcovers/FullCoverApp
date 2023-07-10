import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Models/Events.dart';
import 'package:venq_assessment/Styles/Colors.dart';

Widget myeventcard(double height, double width, Event event) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: SizedBox(
      width: width / 1.5,
      height: height / 5.97,
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
            alignment: Alignment.bottomRight,
            child: Container(
              width: width / 1.4,
              height: height / 20,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              child: 
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(width: width/3,
                          child: Text(textAlign: TextAlign.left,
                            event.name,
                            style: GoogleFonts.sairaCondensed(
                                fontWeight: FontWeight.bold,
                                fontSize: height/80,
                                color: backgroundColorfigma),
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                
                  
                
                 Padding(
                   padding: const EdgeInsets.only(right:18.0),
                   child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Starts from",
                          style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.bold,
                              fontSize: height/100,
                              color: backgroundColorfigma),
                        ),
                        Text(
                          "Rs. 2000",
                          style: GoogleFonts.sairaCondensed(
                              fontWeight: FontWeight.bold,
                              fontSize: height/100,
                              color: backgroundColorfigma),
                        )
                      ],
                    ),
                 ),
                ]),
              ),
            ))
      ]),
    ),
  );
}