import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Providers/ClubProvider.dart';
import 'package:venq_assessment/utils/Constants.dart';import "package:http/http.dart" as http;
import 'package:venq_assessment/utils/Utils.dart';


class RestobarServices{
  static Future<List<ClubModel>> getAllRestobar({required BuildContext context}) async {
        final restobarProvider = Provider.of<ClubProvider>(context, listen: false);

    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}club/?type=resto'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            final restobarProvider =
                Provider.of<ClubProvider>(context, listen: false);
            final jsonData = json.decode(res.body)["data"];
            restobarProvider.setClubsData(jsonData);

            // showSnackBar(context, 'Clubs data fetched successfully');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return restobarProvider.clubsData;
  }
}