import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:venq_assessment/utils/Constants.dart';
import "package:http/http.dart" as http;
import 'package:venq_assessment/utils/Utils.dart';

class Event_Services {
  static Future<dynamic> getallEventorders(
      {required BuildContext context, required String eventid}) async {
    var orders;
    try {
      print("object");
      print(Constants.myclub!.id);
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}orders/e/$eventid/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      orders = jsonDecode(res.body);
      print(orders);
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
    return orders;
  }
}
