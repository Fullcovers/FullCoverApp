import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/utils/Utils.dart';

class StoriesServices {
  static Future<dynamic> getstories({required BuildContext context}) async {
    dynamic stories;
    try {
      http.Response myclub = await http.get(
        Uri.parse('${Constants.uri}club/my-club'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      var myclubid = jsonDecode(myclub.body)['data'][0]['_id'];

      http.Response res = await http.get(
        Uri.parse(
          '${Constants.uri}stories/$myclubid',
        ),
        headers: <String, String>{
          'Authorization': 'Bearer ${Constants.usertoken}'
        },
      );
      stories = jsonDecode(res.body);
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
    return stories;
  }
  static Future<void> uploadstories(
      {required BuildContext context, required String url}) async {
    var body = {"imageUrl": url};
    try {
      Dio dio = new Dio();
      var res = await dio.post('${Constants.uri}stories/i',
          data: body,
          options: Options(
              headers: {'Authorization': 'Bearer ${Constants.usertoken}'  }));

      showSnackBar(context, "Uploded");
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }
}
