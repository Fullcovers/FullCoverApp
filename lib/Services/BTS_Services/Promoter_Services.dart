import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:venq_assessment/Providers/UserProvider.dart';
import 'package:venq_assessment/utils/Utils.dart';

import '../../Models/BTS_Models/Promoters.dart';
import '../../Providers/BTS_Providers/PromoterProvider.dart';
import '../../utils/Constants.dart';

class PromoterServices {
  Future<List<PromoterModel>> getAllPromoters(
      {required BuildContext context}) async {
    var promoterprovider =
        Provider.of<PromoterProvider>(context, listen: false);
    try {
      var userprovider = Provider.of<UserProvider>(context, listen: false);

      await userprovider.loadToken();
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}promoter/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${userprovider.token}'
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            promoterprovider.clearPromoters();
            promoterprovider.storePromoterDetails(jsonDecode(res.body));
          });
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
    return promoterprovider.promoters;
  }

  void addPromoter(
      {required context, required String userid, required int discount}) async {
    try {
      var userprovider = Provider.of<UserProvider>(context, listen: false);
      await userprovider.loadToken();
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}promoter/'),
        body: jsonEncode(
          {
            'userId': userid,
            'discount': discount,
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${userprovider.token}'
        },
      );
      httpErrorHandle(response: res, context: context, onSuccess: () {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
