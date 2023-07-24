import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venq_assessment/Models/Clubs.dart';
import 'package:venq_assessment/Providers/ClubProvider.dart';
import 'package:venq_assessment/utils/Constants.dart';
import "package:http/http.dart" as http;
import 'package:venq_assessment/utils/Utils.dart';

class BTSRestoServices{
  static Future<ClubModel?> btsgetSingleresto(
      {required BuildContext context}) async {
        print("object");
    final clubProvider = Provider.of<ClubProvider>(context, listen: false);
    try {
      http.Response myclub = await http.get(
        Uri.parse('${Constants.uri}resto/my-resto'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      var myclubid = jsonDecode(myclub.body)['data'][0]['_id'];
      print(myclubid);
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}resto/$myclubid'),
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
            clubProvider.setclubnull();
            final jsonData = json.decode(res.body)["data"];
            // clubProvider.setClubsData(jsonData);
            ClubModel club = clubProvider.getClubDetails(jsonData);
            clubProvider.setSingleClub(club);

            // showSnackBar(context, 'Clubs data fetched successfully');
            print(clubProvider.club!.id.toString());
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    Constants.myrestobar=clubProvider.club;
    return clubProvider.club;
  }
  static Future<dynamic> restoopenandclose({
    required BuildContext context,
  }) async {
   var responce;
    try {
      http.Response myclub = await http.get(
        Uri.parse('${Constants.uri}resto/my-resto'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      var myclubid = jsonDecode(myclub.body)['data'][0]['_id'];
      print(myclubid);

      http.Response res = await http.post(
        Uri.parse(
          '${Constants.uri}club/$myclubid/is-open',
        ),
        headers: <String, String>{
          'Authorization': 'Bearer ${Constants.usertoken}'
        },
        
      );

      responce=jsonDecode(res.body);
      print(res.body);
      if (responce['data']['is_club_open']) {
        showSnackBar(context, "Opened");
      }else{showSnackBar(context, "Closed");}
      
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e.toString());
    }
    return responce;
  }
  static Future<void> updateResto({
    required BuildContext context,
    required var body,
    required String myclubid,
    
  }) async {
    try {
     Dio dio =  Dio();
      var res = await dio.put('${Constants.uri}resto/',
          data:  body,
          options: Options(
              headers: {'Content-Type': 'application/json; charset=UTF-8','Authorization': 'Bearer ${Constants.usertoken}'}));


  

      // print(json.encode(body));
      print(res.data);
      showSnackBar(context, "Updated");
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }
}