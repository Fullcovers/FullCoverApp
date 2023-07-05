import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:venq_assessment/utils/Constants.dart';
import "package:http/http.dart" as http;
import 'package:venq_assessment/utils/Utils.dart';

class Gustlist_Services{
  static Future<dynamic> getallpromoters({required BuildContext context}) async {
    var promoters;
    try {
      // print(Constants.myclub!.id);
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}promoter/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      promoters = jsonDecode(res.body)['data'];
      print("promoters");
      print(promoters);
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
    return promoters;
  }
static Future<dynamic> getguestlist({required BuildContext context,required String date}) async {
    var guest;
    try {
      // print(Constants.myclub!.id);
       http.Response club = await http.get(
        Uri.parse('${Constants.uri}club/my-club'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}'
        },
      );
      final clubid = json.decode(club.body)['data'][0]['_id'];
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}orders/g/$clubid/d/?date=$date'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      guest = jsonDecode(res.body);
      print("guest");
      print(guest);
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
    return guest;
  }
  
  static Future<dynamic> getpromotersbyid({required BuildContext context,required String promoterid}) async {
    var gustlist;
    try {
      print("object121");
      // print(Constants.myclub!.id);
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}promoter/$promoterid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      gustlist = jsonDecode(res.body)['guestList'];
      print(gustlist);
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
    return gustlist;
  }

  
}