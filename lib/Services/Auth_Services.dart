import 'dart:convert';

import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:venq_assessment/Services/BTS_Services/Club_Services.dart';
import 'package:venq_assessment/Services/User_Services.dart';
import 'package:venq_assessment/screens/Auth/Login.dart';
import 'package:venq_assessment/screens/Bookings/MyBookingPage.dart';

import 'package:venq_assessment/screens/Bookings/bookings_screen.dart';
import 'package:venq_assessment/screens/ClubsDashBoard/BehindThe%20Scenes/BehindTheScenes.dart';

import '../Models/User.dart';
import '../Providers/UserProvider.dart';
import '../utils/Constants.dart';
import '../utils/Utils.dart';

class AuthService {
  void signUpUser({
    required BuildContext context, //for scaffold
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    var user = {
      "name": {"firstName": firstName, "lastName": lastName},
      "phoneNumber": phoneNumber,
      "email": email,
      "password": password,
      "role": "user"
    };
    try {
      Dio dio = Dio();
      var res = await dio.post('${Constants.uri}auth/register',
          data: user,
          options: Options(
              headers: {'Authorization': 'Bearer ${Constants.usertoken}'}));
      print("Created");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userprovider = Provider.of<UserProvider>(context, listen: false);
      print(email);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}auth/login'),
        body: jsonEncode(
          {
            'email': email.trim(),
            'password': password.trim(),
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (res.statusCode == 200) {
        // Successful login
        userprovider.setToken(jsonDecode(res.body)['token']);
        Constants.usertoken = userprovider.token;
        await UserServices.getprofileinfo();
            if(Constants.btsprofile.role != "user"){
        await BTSClubServices.btsgetSingleClub(context: context);}
        if (Constants.btsprofile.role == "user") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyBookingPage()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BehindTheScenesPage()));
        }
        // navigator.pushNamedAndRemoveUntil('/qrscanner', (route) => false);
      } else if (res.statusCode == 400) {
        // Invalid email or password
        showSnackBar(context, 'Invalid email or password');
      } else {
        // Other error occurred
        showSnackBar(context, res.statusCode.toString());
      }
    } catch (e) {
      // showSnackBar(context, e.toString());
      print(e.toString());
    }
  }

  void signOut(BuildContext context) async {
    final navigator = Navigator.of(context);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('x-auth-token', '');
    navigator.pushNamedAndRemoveUntil('/signupscreen', (route) => false);
  }
}
