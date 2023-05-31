import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

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
  var fncont = TextEditingController();
  var lncont = TextEditingController();
  var mcont = TextEditingController();
  var econt = TextEditingController();
  var pcont = TextEditingController();
  var cpcont = TextEditingController();
  final _formKeyp = GlobalKey<FormState>();
  final _formKeycp = GlobalKey<FormState>();
  Color colorp = Colors.green;
  Color colorcp = Colors.green;

  Widget build(BuildContext context) {
    var widthofs = MediaQuery.of(context).size.width;
    var heightofs = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF2C2F33),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/images/logo.png",
                  scale: 3,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: heightofs / 40,
                    ),
                    Text(
                      'Become a Member',
                      style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                    Text(
                      'Start your Clubbing Journey',
                      style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                        color: const Color(0xFF2C2F33),
                        elevation: 30,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 22, right: 22),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  height: 40,
                                  child: TextField(
                                    controller: fncont,
                                    onSubmitted: (value) {
                                      if (value.isEmpty) {
                                        // color = Colors.red;
                                      }
                                    },
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (String value) {
                                      // cont.value.text.isEmpty ?  color = Colors.red : Null;
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 3, color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        fillColor: Colors.white,
                                        hintText: "First Name",
                                        hintStyle: TextStyle(
                                            color: Colors.white, fontSize: 10)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 22, right: 22),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  height: 40,
                                  child: TextField(
                                    controller: lncont,
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (String value) {},
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 3, color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        fillColor: Colors.white,
                                        hintText: "Last Name",
                                        hintStyle: TextStyle(
                                            color: Colors.white, fontSize: 10)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 22, right: 22),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  height: 40,
                                  child: TextField(
                                    controller: mcont,
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (String value) {},
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 3, color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        fillColor: Colors.white,
                                        hintText: "Mobile Number",
                                        hintStyle: TextStyle(
                                            color: Colors.white, fontSize: 10)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 22, right: 22),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  height: 40,
                                  child: TextField(
                                    controller: econt,
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (String value) {},
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 3, color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.green),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        fillColor: Colors.white,
                                        hintText: "Email",
                                        hintStyle: TextStyle(
                                            color: Colors.white, fontSize: 10)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Form(
                                key: _formKeyp,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 22, right: 22),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Container(
                                          height: 40,
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                setState(() {
                                                  colorp = Colors.red;
                                                });
                                              } else {
                                                setState(() {
                                                  colorp = Colors.green;
                                                });
                                              }
                                            },
                                            controller: pcont,
                                            style:
                                                TextStyle(color: Colors.white),
                                            onChanged: (String value) {},
                                            
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 3, color: colorp),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide:
                                                      BorderSide(color: colorp),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                fillColor: Colors.white,
                                                hintText: "Password",
                                                hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 22, right: 22),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Container(
                                          height: 40,
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                setState(() {
                                                  colorcp = Colors.red;
                                                });
                                              } else {
                                                setState(() {
                                                  colorcp = Colors.green;
                                                });
                                              }
                                            },
                                            controller: cpcont,
                                            style:
                                                TextStyle(color: Colors.white),
                                            onChanged: (String value) {},
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 3, color: colorcp),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: colorcp),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                fillColor: Colors.white,
                                                hintText: "Confirm Password",
                                                hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  checkColor: Colors.black,
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                                Container(
                                  width: widthofs / 1.5,
                                  child: Wrap(children: [
                                    RichText(
                                      text: const TextSpan(
                                        text:
                                            "I certify I am 18 years of age or older, and agree to the.",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: ' Terms of Service ',
                                              style: TextStyle(
                                                  color: Colors.blue)),
                                          TextSpan(
                                              text: 'and',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          TextSpan(
                                              text: ' Privacy Policy',
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
                                  fillColor: MaterialStateProperty.resolveWith(
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
                                        text: "I have read and understood the",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
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
                                  fillColor: MaterialStateProperty.resolveWith(
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
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ),
                                  ]),
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //           const BookingsScreen()),
                                // );
                                _formKeyp.currentState!.validate();
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
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 202, 196, 196),
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
                                    color: Color(0xFF2D3135),
                                    borderRadius: BorderRadius.all(
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
                                                  color: const Color.fromARGB(
                                                      255, 191, 150, 26)),
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget customtextfield(
    String hintText, Color color, TextEditingController cont) {
  return Padding(
    padding: const EdgeInsets.only(left: 22, right: 22),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 40,
        child: TextField(
          controller: cont,
          onSubmitted: (value) {
            if (value.isEmpty) {
              color = Colors.red;
            }
          },
          style: TextStyle(color: Colors.white),
          onChanged: (String value) {},
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: color),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: color),
                borderRadius: BorderRadius.circular(15),
              ),
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white, fontSize: 10)),
        ),
      ),
    ),
  );
}
