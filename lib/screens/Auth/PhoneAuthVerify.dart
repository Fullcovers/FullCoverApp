import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venq_assessment/Services/Auth_Services.dart';
import 'package:venq_assessment/Services/Phone_Auth_Services.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Auth/Login.dart';
import 'package:venq_assessment/screens/Bookings/MyBookingPage.dart';
import 'package:venq_assessment/utils/Constants.dart';

class PhoneAuthVerify extends StatefulWidget {
  PhoneAuthVerify(
      {super.key,
      required this.emailController,
      required this.firstnameController,
      required this.lastnameController,
      required this.passwordController,
      required this.pnController});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController firstnameController;
  final TextEditingController lastnameController;
  final TextEditingController pnController;
  @override
  State<PhoneAuthVerify> createState() => _PhoneAuthVerifyState();
}

class Otp extends StatelessWidget {
  const Otp({
    Key? key,
    required this.otpController,
  }) : super(key: key);
  final TextEditingController otpController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white),
          fillColor: Colors.white,
          hintText: ('0'),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: golden), //<-- SEE HERE
          ),
        ),
        controller: otpController,
        keyboardType: TextInputType.number,
        // style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },

        onSaved: (value) {},
      ),
    );
  }
}

class _PhoneAuthVerifyState extends State<PhoneAuthVerify> {
  int minNumber = 1000;
  final TextEditingController codeController = TextEditingController();
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  TextEditingController otp5Controller = TextEditingController();
  TextEditingController otp6Controller = TextEditingController();
  int maxNumber = 6000;
  double circularradius = 10;
  bool load = false;
  bool selected = true;

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height / 6,
              ),
              const SizedBox(
                height: 40,
              ),
              const Icon(
                Icons.dialpad_rounded,
                size: 50,
                color: Colors.white,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Enter OTP",
                style: GoogleFonts.bebasNeue(
                    fontSize: width / 10, color: Colors.white),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: width / 20,
                  ),
                  Otp(
                    otpController: otp1Controller,
                  ),
                  Otp(
                    otpController: otp2Controller,
                  ),
                  Otp(
                    otpController: otp3Controller,
                  ),
                  Otp(
                    otpController: otp4Controller,
                  ),
                  Otp(
                    otpController: otp5Controller,
                  ),
                  Otp(
                    otpController: otp6Controller,
                  ),
                  SizedBox(
                    width: width / 20,
                  ),
                ],
              ),
              SizedBox(
                height: height / 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 22, right: 22, bottom: 8, top: 8),
              //   child: Padding(
              //     padding: const EdgeInsets.all(8),
              //     child: TextField(
              //       maxLength: 6,
              //       keyboardType: TextInputType.number,
              //       controller: codeController,
              //       style: TextStyle(color: Colors.white),
              //       obscureText: true,
              //       onChanged: (String value) {},
              //       decoration: InputDecoration(
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(circularradius),
              //           ),
              //           enabledBorder: OutlineInputBorder(
              //             borderSide: BorderSide(color: greenborder),
              //             borderRadius: BorderRadius.circular(circularradius),
              //           ),
              //           focusedBorder: OutlineInputBorder(
              //             borderSide: BorderSide(width: 3, color: greenborder),
              //             borderRadius: BorderRadius.circular(circularradius),
              //           ),
              //           fillColor: Colors.white,
              //           // hintText: "Password",
              //           label: Text(
              //             "Enter Code",
              //             style: TextStyle(color: Colors.white),
              //           ),
              //           hintStyle: TextStyle(color: Colors.white)),
              //     ),
              //   ),
              // ),
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
                        load = true;
                        selected = false;
                      });

                      bool sended = Phoneauth.checkVerificationCode(
                          context,
                          int.parse(otp1Controller.text +
                              otp2Controller.text +
                              otp3Controller.text +
                              otp4Controller.text +
                              otp5Controller.text+otp6Controller.text));
                      print(sended);
                      if (sended) {
                        AuthService().signUpUser(
                            context: context,
                            email: widget.emailController.text.trim(),
                            password: widget.passwordController.text.trim(),
                            firstName: widget.firstnameController.text,
                            lastName: widget.lastnameController.text,
                            phoneNumber: widget.pnController.text);
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
                                      top: height / 90, right: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Verify", //one8@gmail.com  one812345
                                        style: GoogleFonts.bebasNeue(
                                            fontSize: 20, color: Colors.white),
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
              // Container(
              //   child: Center(
              //       child: ElevatedButton(
              //     child: Text("Send"),
              //     onPressed: () {
              //       // call sentOtp function and pass the parameters
              //     },
              //   )),
              // ),
              // TextField(
              //   onChanged: (value) {
              //     code = int.parse(value);
              //   },
              // ),
              // Container(
              //   child: Center(
              //       child: ElevatedButton(
              //     child: Text("Verify"),
              //     onPressed: () {
              //       // call sentOtp function and pass the parameters

              //       Phoneauth.checkVerificationCode(context, code);
              //     },
              //   )),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
