import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Providers/UserProvider.dart';
import 'package:venq_assessment/utils/Constants.dart';
import "package:http/http.dart" as http;

import '../utils/Utils.dart';

class PromotersServices {
  static Future<dynamic> verifypromocode(
      {required BuildContext context,
      required String code,
      required String clubId}) async {
        print("abc");
    dynamic promoter={};
    var promocode = {"promo_code": code, "clubId": clubId};
    try {
      Dio dio = Dio();
      var res = await dio.post('${Constants.uri}promoter/promo_code',
          data: promocode,
          options: Options(
              headers: {'Authorization': 'Bearer ${Constants.usertoken}'}));
      print("Created");

      if (res.statusCode == 200) {
        promoter = res.data;
      } else if(res.statusCode == 400){
        print(res.data);
      }
    } catch (e) {
      // showSnackBar(context, e.toString());
    }
    return promoter;
  }
}
