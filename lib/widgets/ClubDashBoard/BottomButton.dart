import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Events/CreateEvent.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/Events/Event.dart';

Widget bottombutton(String text, Icon icon,BuildContext context,{Widget rought=const Events()} ) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {},
      child: Container(
        height: 58,
        width: 190,
        decoration:  BoxDecoration(
          boxShadow: const [
           BoxShadow(
                          color: Color.fromARGB(255, 120, 116, 116),
                          blurRadius: 20,
                          spreadRadius: -2,
                          offset: Offset(-2, -2),
                        ),
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 20,
                          spreadRadius: -2,
                          offset: Offset(2, 2),
                        ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: botoncolor,
        ),
        child: InkWell(onTap: () {
          
                   Navigator.push(context,
                MaterialPageRoute(builder: (context) => rought));
                
        },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                     Navigator.push(context,
                  MaterialPageRoute(builder: (context) => rought));
                  },
                  color: const Color.fromARGB(255, 252, 248, 248),
                  icon: icon),
              Text(
                text,
                style: GoogleFonts.bebasNeue(color: Colors.white, fontSize: 25),
              )
            ],
          ),
        ),
      ),
    ),
  );
}