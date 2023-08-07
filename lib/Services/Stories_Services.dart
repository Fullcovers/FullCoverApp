import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Providers/ClubProvider.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/utils/Utils.dart';

class StoriesServicesUser {
  static Future<List<ClubModel>> getAllClubs(
      {required BuildContext context}) async {
    final clubProvider = Provider.of<ClubProvider>(context, listen: false);
    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}club/?type=club'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            final clubProvider =
                Provider.of<ClubProvider>(context, listen: false);
            final jsonData = json.decode(res.body)["data"];
            clubProvider.setClubsData(jsonData);

            // showSnackBar(context, 'Clubs data fetched successfully');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return clubProvider.clubsData;
  }

  static Future<Map<ClubModel, dynamic>> getstories(
      {required BuildContext context}) async {
    List<ClubModel> allclubs = await getAllClubs(context: context);
    dynamic stories;
    Map<ClubModel, dynamic> allclubstories = {};
    try {
      for (var i = 0; i < allclubs.length; i++) {
        http.Response clubstories = await http.get(
          Uri.parse('${Constants.uri}stories/${allclubs[i].id}'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${Constants.usertoken}',
          },
        );
        var clubstoriesjson = jsonDecode(clubstories.body);
        print(clubstoriesjson['data']);
        if (clubstoriesjson['data'].isNotEmpty) {
          print("added");
          allclubstories[allclubs[i]] = clubstoriesjson;
        }
      }
      Constants.allclubstories = allclubstories;
      // print(allclubstories);
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
    return allclubstories;
  }
}
