import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Auth/Register.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  @override
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();  final TextEditingController pnController = TextEditingController();


  Widget build(BuildContext context) {
    var widthofs = MediaQuery.of(context).size.width;
    var heightofs = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColorfigma,
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
                      HeaderContent(title: "Edit Profile"),

              SizedBox(
                height: heightofs / 50,
              ),
              Image.asset(
                "assets/images/profile.png",
                scale: 1.5,
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
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        children: [
                          customtextfield(
                              firstnameController, "First Name", Colors.green),
                          customtextfield(
                              lastnameController, "Last Name", Colors.green),
                          customtextfield(
                              emailController, "Email", Colors.green),
                               customtextfield(
                              pnController, "Phone Number", Colors.green),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 0.0, left: 50, right: 50, bottom: 20.0),
                              child: Container(
                                height: heightofs / 20,
                                width: double.maxFinite,
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 202, 196, 196),
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
                                            "Submit",
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
    );
    
  }
}
