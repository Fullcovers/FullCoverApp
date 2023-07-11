import 'dart:convert';

import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:venq_assessment/utils/Utils.dart';

import '../Models/Clubs.dart';
import '../Providers/ClubProvider.dart';
import '../utils/Constants.dart';

class ClubServices {
 static Future<List<ClubModel>> getAllClubs({required BuildContext context}) async {
    final clubProvider = Provider.of<ClubProvider>(context, listen: false);
    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}club/'),
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

  Future<ClubModel?> getSingleClub(
      {required BuildContext context, required clubid}) async {
    final clubProvider = Provider.of<ClubProvider>(context, listen: false);
    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}club/$clubid'),
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
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return clubProvider.club;
  }
}
