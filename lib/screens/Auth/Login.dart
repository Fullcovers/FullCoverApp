import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/Services/Auth_Services.dart';
import 'package:venq_assessment/Styles/Radius.dart';
import 'package:venq_assessment/screens/Auth/PhoneAuthSend.dart';
import 'package:venq_assessment/screens/Auth/Register.dart';
import 'package:venq_assessment/screens/Bookings/bookings_screen.dart';
import 'package:venq_assessment/utils/Constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool selected = true;
  @override
  bool load = false;
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
            resizeToAvoidBottomInset: false,
            backgroundColor: backgroundColortransperent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height / 100,
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
                    height: MediaQuery.of(context).size.height / 1.1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height / 8,
                        ),
                        Text(
                          'Login',
                          style: GoogleFonts.bebasNeue(
                              fontWeight: FontWeight.w500,
                              fontSize: 40,
                              color: offwhite),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 22, right: 22, top: 8),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: TextField(
                                    controller: emailController,
                                    style: TextStyle(color: Colors.white),
                                    onChanged: (String value) {},
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              circularradius),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: greenborder),
                                          borderRadius: BorderRadius.circular(
                                              circularradius),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 3, color: greenborder),
                                          borderRadius: BorderRadius.circular(
                                              circularradius),
                                        ),
                                        fillColor: Colors.white,
                                        focusColor: Colors.white,
                                        // hintText: "Email",
                                        label: const Text(
                                          "Email",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 22, right: 22, bottom: 8, top: 8),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: TextField(
                                    controller: passwordController,
                                    style: TextStyle(color: Colors.white),
                                    obscureText: true,
                                    onChanged: (String value) {},
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              circularradius),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: greenborder),
                                          borderRadius: BorderRadius.circular(
                                              circularradius),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 3, color: greenborder),
                                          borderRadius: BorderRadius.circular(
                                              circularradius),
                                        ),
                                        fillColor: Colors.white,
                                        // hintText: "Password",
                                        label: Text(
                                          "Password",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 35, right: 35),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: const Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const PhoneAuth()));
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text(
                                            "Don’t have an account?",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                               Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const PhoneAuth()));
                                            },
                                            child: const Text(
                                              "Sign Up",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
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
                                    onTap: () {
                                      setState(() {
                                        load = !load;
                                        selected = !selected;
                                      });
                                      AuthService().signInUser(
                                          context: context,
                                          email: emailController.text,
                                          password: passwordController.text);
                                    },
                                    child: AnimatedContainer(
                                      width: selected ? width : height / 15,
                                      height: height / 20,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: backbuttoncolor,
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
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: Column(
                                        children: [
                                          load
                                              ? Container(width: width/1.2,height: 40,
                                                child: Center(
                                                    child: Constants
                                                        .mycircularProgressIndicator()),
                                              )
                                              : Padding(
                                                  padding: EdgeInsets.only(
                                                      top: height / 65,
                                                      right: 20.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "LOG IN", //one8@gmail.com  one812345
                                                        style: GoogleFonts
                                                            .bebasNeue(
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
