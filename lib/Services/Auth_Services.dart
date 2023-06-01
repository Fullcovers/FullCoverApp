import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:venq_assessment/screens/Bookings/bookings_screen.dart';

import '../Models/User.dart';
import '../Providers/UserProvider.dart';
import '../utils/Constants.dart';
import '../utils/Utils.dart';

class AuthService {
  void signUpUser({
    required BuildContext context, //for scaffold
    required String email,
    required String password,
    required Map<String, String> name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        phoneNumber: '',
        role: 'user',
      );

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}auth/register'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Account Created! Login with the same credentials');
            print(res.body);

            final userDetails = jsonDecode(res.body);
            Provider.of<UserProvider>(context, listen: false)
                .setId(userDetails['_id']);
            Navigator.of(context).pushNamed('/login');
          });
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
      print("hello2");
      print(email);
      final navigator = Navigator.of(context);
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}auth/login'),
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          userprovider.setToken(jsonDecode(res.body)['token']);
          navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const BookingsScreen(),
              ),
              (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signOut(BuildContext context) async {
    final navigator = Navigator.of(context);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('x-auth-token', '');
    navigator.pushNamedAndRemoveUntil('/signupscreen', (route) => false);
  }
}
