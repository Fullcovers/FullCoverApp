import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:venq_assessment/Services/Phone_Auth_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Auth/PhoneAuthVerify.dart';

import 'package:venq_assessment/utils/Constants.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});
  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  int minNumber = 1000;
  final TextEditingController phoneController = TextEditingController();

  int maxNumber = 6000;
  double circularradius = 10;
  bool load = false;
  bool selected = true;

  int code = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(
          Constants.backgroundimage,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: backgroundColortransperent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/phone1.png",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: height / 25,
              ),
              Text(
                "Enter Your Phone Number",
                style: GoogleFonts.bebasNeue(fontSize: 35, color: golden),
              ),
              SizedBox(
                height: height / 35,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 22, right: 22, bottom: 8, top: 8),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    onChanged: (String value) {},
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(circularradius),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: greenborder),
                          borderRadius: BorderRadius.circular(circularradius),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: greenborder),
                          borderRadius: BorderRadius.circular(circularradius),
                        ),
                        fillColor: Colors.white,
                        // hintText: "Password",
                        label: Text(
                          "Phone Number",
                          style: TextStyle(color: Colors.white),
                        ),
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(
                height: height / 35,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 0.0,
                      left: width / 10,
                      right: width / 10,
                      bottom: 20.0),
                  child: InkWell(
                    onTap: () async {
                      setState(() {
                        load = !load;
                        selected = !selected;
                      });
                      bool sended = await Phoneauth.verifyPhoneNumber(
                          "+91${phoneController.text}");
                      if (sended) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhoneAuthVerify(
                                      pnController: phoneController,
                                    )));
                      }
                    },
                    child: AnimatedContainer(
                      width: selected ? width / 2 : height / 15,
                      height: height / 20,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 10,
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
                        color: botoncolor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      duration: const Duration(milliseconds: 500),
                      child: Column(
                        children: [
                          load
                              ? Container(
                                  width: width / 1.2,
                                  height: 40,
                                  child: Center(
                                      child: Constants
                                          .mycircularProgressIndicator()),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(
                                      top: height / 65, right: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Send", //one8@gmail.com  one812345
                                        style: GoogleFonts.bebasNeue(
                                            fontSize: 20, color: golden),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
