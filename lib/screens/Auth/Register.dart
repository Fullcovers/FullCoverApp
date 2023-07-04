import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/Services/Auth_Services.dart';
import 'package:venq_assessment/utils/Constants.dart';

import '../Bookings/bookings_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController pnController = TextEditingController();

  final TextEditingController confirmpasswordController =
      TextEditingController();
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    var widthofs = MediaQuery.of(context).size.width;
    var heightofs = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
           Constants.backgroundimage,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: backgroundColortransperent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: heightofs / 100,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/logo.png",
                      scale: 3,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: heightofs / 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Become a Member',
                                style: GoogleFonts.bebasNeue(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 40,
                                    color: offwhite),
                              ),
                              Text(
                                'Start your Clubbing Journey',
                                style: GoogleFonts.bebasNeue(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: offwhite),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Column(
                            children: [
                              customtextfield(firstnameController, "First Name",
                                  customtextfieldcolor),
                              customtextfield(lastnameController, "Last Name",
                                  customtextfieldcolor),
                              customtextfield(emailController, "Email",
                                  customtextfieldcolor),
                              customtextfield(pnController, "Phone Number",
                                  customtextfieldcolor),
                              customtextfield(passwordController, "Password",
                                  customtextfieldcolor),
                              customtextfield(confirmpasswordController,
                                  "Confirm Password", customtextfieldcolor),
                              Row(
                                children: [
                                  Checkbox(
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    checkColor: Colors.black,
                                    value: isChecked2,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked2 = value!;
                                      });
                                    },
                                  ),
                                  Container(
                                    width: widthofs / 1.5,
                                    child: Wrap(children: [
                                      RichText(
                                        text: const TextSpan(
                                          text:
                                              "I have read and understood the",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: ' Risk Warnings.',
                                                style: TextStyle(
                                                    color: Colors.blue)),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    checkColor: Colors.black,
                                    value: isChecked3,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked3 = value!;
                                      });
                                    },
                                  ),
                                  Container(
                                    width: widthofs / 1.5,
                                    child: Wrap(children: [
                                      RichText(
                                        text: const TextSpan(
                                          text:
                                              "I would like to receive news, updates and announcements from VENQ.",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  AuthService().signUpUser(
                                      context: context,
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                      firstName: firstnameController.text,
                                      lastName: lastnameController.text,
                                      phoneNumber: pnController.text);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 0.0,
                                      left: 50,
                                      right: 50,
                                      bottom: 20.0),
                                  child: Container(
                                    height: heightofs / 20,
                                    width: double.maxFinite,
                                    decoration:  BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              255, 202, 196, 196),
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
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, right: 20.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Sign Up",
                                                style: GoogleFonts.bebasNeue(
                                                    fontSize: 20,
                                                    color: golden),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget customtextfield(
    TextEditingController cont, String hintText, Color color) {
  return Padding(
    padding: const EdgeInsets.only(left: 22, right: 22, top:15 ),
    child: Container(height: 50,
      child: TextField(
        controller: cont,
        style: TextStyle(color: Colors.white),
        onChanged: (String value) {},
        obscureText: hintText == "Confirm Password" || hintText == "Password"
            ? true
            : false,
      keyboardType: hintText=="Phone Number"?TextInputType.phone:null,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: color),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: color),
              borderRadius: BorderRadius.circular(15),
            ),
            fillColor: Colors.white,
            labelText: hintText,
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.white)),
      ),
    ),
  );
}
