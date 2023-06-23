import 'dart:convert';
import 'package:dio/dio.dart';
import "package:http/http.dart" as http;

import 'package:flutter/material.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/utils/Utils.dart';

class BTSwalkins {
  static Future<void> createWalkins({
    required BuildContext context,
    required String name,
    required int price,
    required int cover,
    required String email,
    required String phone,
    required String date,
    required int number_of_people,
  }) async {
    var body = {
      "email": email,
      "price": price,
      "cover": cover,
      "phone": phone,
      "date": date,
      "number_of_people": number_of_people,
      "name": name,
    };

    try {
      Dio dio = Dio();
      var res = await dio.post('${Constants.uri}walkins/',
          data: body,
          options: Options(
              headers: {'Authorization': 'Bearer ${Constants.usertoken}'}));
      if (res.statusCode == 201) {
        showSnackBar(context, "Created");
      } else if (res.statusCode == 403) {
        showSnackBar(context, "Forbidden User Authentication Required");
      } else {
        showSnackBar(context, "Something Wrong!!");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<void> createWalkinsofevent({
    required BuildContext context,
    required String name,
    required int price,
    required int cover,
    required String email,
    required String phone,
    required String date,
    required String eventid,
    required int number_of_people,
  }) async {
    var body = {
      "email": email,
      "phone": phone,
      "price": price,
      "cover": cover,
      "date": date,
      "number_of_people": number_of_people,
      "name": name,
      "eventId": eventid
    };

    try {
      Dio dio = Dio();
      var res = await dio.post('${Constants.uri}walkins/',
          data: body,
          options: Options(
              headers: {'Authorization': 'Bearer ${Constants.usertoken}'}));
      if (res.statusCode == 201) {
        showSnackBar(context, "Created");
      } else if (res.statusCode == 403) {
        showSnackBar(context, "Forbidden User Authentication Required");
      } else {
        showSnackBar(context, "Something Wrong!!");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<dynamic> getallWalkins({required BuildContext context}) async {
    var orders;
    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}walkins/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      orders = jsonDecode(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
    return orders;
  }

  static Future<dynamic> getallWalkinsbydate(
      {required BuildContext context, required String date}) async {
    var orders;
    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}walkins/?date=$date'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      orders = jsonDecode(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
    return orders;
  }

  static Future<dynamic> getallWalkinsofevent(
      {required BuildContext context, required String eventid}) async {
    var orders;
    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}walkins/$eventid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      orders = jsonDecode(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
    return orders;
  }
}
