import 'dart:math';

import 'package:flutter/material.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class Phoneauth {
  static final String accountSid = 'ACd1e6c502846436c7ced396bb4f9fd95f';
  static final String authToken = 'accfa42b64e9c560de46c9a02a01305b';
  static final String twilioNumber = '+19894743947';
  static Random random = new Random();

  static int randomNumber = random.nextInt(900000) + 100000;
  static Future<bool> verifyPhoneNumber(String phoneNumber) async {
    try {
      final twilio = TwilioFlutter(
        accountSid: accountSid,
        authToken: authToken,
        twilioNumber: twilioNumber,
      );

      final verification = await twilio.sendSMS(
        toNumber: phoneNumber,
        messageBody: "Your 6 digit verification code is $randomNumber ",
      );

      // You can store the verification SID for later use
      print(randomNumber);

      return true; // Verification initiated successfully
    } catch (e) {
      print('Verification error: $e');
      return false; // Verification failed
    }
  }

  static bool checkVerificationCode(BuildContext context, int code) {
    print(randomNumber);print(code);
    if (code == randomNumber) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("verification Done"),
      ));
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Don't Match"),
      ));
      return false;
    }
  }
}
