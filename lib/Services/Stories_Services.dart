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

// Map<ClubModel, dynamic>
  static Future<Map<String, List<String>>> getstories({required BuildContext context}) async {
    // List<ClubModel> allclubs = await getAllClubs(context: context);
//     http.Response allstories = await http.get(
//       Uri.parse('${Constants.uri}stories/'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         'Authorization': 'Bearer ${Constants.usertoken}',
//       },
//     );
//     var allstoriesjson = jsonDecode(allstories.body);
//     Map<String, dynamic> allclubstories = {};

//     for (var i = 0; i < allstoriesjson['data'].length; i++) {
//       if (!allclubstories.containsKey(allstoriesjson)) {
// allclubstories[allstories[0]]
//       }
//     }
    http.Response allstories = await http.get(
      Uri.parse('${Constants.uri}stories/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${Constants.usertoken}',
      },
    );
    var allstoriesjson = jsonDecode(allstories.body);
    Map<String, List<String>> allclubstories = {};

    for (var i = 0; i < allstoriesjson['data'].length; i++) {
      allclubstories[allstoriesjson['data'][i]['items'][0]['club']['logo']]=[];
      
    }
    for (var i = 0; i < allstoriesjson['data'].length; i++) {
          for (var j = 0; j < allstoriesjson['data'][i]['items'].length; j++) {
        allclubstories[allstoriesjson['data'][i]['items'][0]['club']['logo']]
            ?.add(allstoriesjson['data'][i]['items'][j]['imageUrl']);
      }
    }

    print("allclubstories.toString()");
return allclubstories;
    // dynamic stories;
    // try {
    //   for (var i = 0; i < allclubs.length; i++) {
    //     http.Response clubstories = await http.get(
    //       Uri.parse('${Constants.uri}stories/${allclubs[i].id}'),
    //       headers: <String, String>{
    //         'Content-Type': 'application/json; charset=UTF-8',
    //         'Authorization': 'Bearer ${Constants.usertoken}',
    //       },
    //     );
    //     var clubstoriesjson = jsonDecode(clubstories.body);
    //     print(clubstoriesjson['data']);
    //     if (clubstoriesjson['data'].isNotEmpty) {
    //       print("added");
    //       allclubstories[allclubs[i]] = clubstoriesjson;
    //     }
    //   }
    //   Constants.allclubstories = allclubstories;
    //   // print(allclubstories);
    // } catch (e) {
    //   print(e);
    //   showSnackBar(context, e.toString());
    // }
    // return allclubstories;
  }
}
