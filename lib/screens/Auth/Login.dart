import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/screens/Auth/SignUp.dart';
import 'package:venq_assessment/screens/Bookings/bookings_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF2C2F33),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      scale: 0.5,
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    Text(
                      'Welcome Back',
                      style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                    Text(
                      'Login to continue!',
                      style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Card(
                        color: Colors.white,
                        elevation: 30,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
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
                                  onChanged: (String value) {},
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.green),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      fillColor: Colors.white,
                                      hintText: "Email"),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 22, right: 22, bottom: 8, top: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextField(
                                  obscureText: true,
                                  onChanged: (String value) {},
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3, color: Colors.red),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      fillColor: Colors.white,
                                      hintText: "Password"),
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
                                            const SignUp()));
                           
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: const [
                                        Text(
                                          "Don’t have an account?",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Sign UP",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                       
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
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BookingsScreen()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 0.0,
                                    left: 50,
                                    right: 50,
                                    bottom: 20.0),
                                child: Container(
                                  height: height / 20,
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
                                              "LOG IN",
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
