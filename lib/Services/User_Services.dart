import 'dart:convert';
import 'dart:typed_data';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:venq_assessment/Models/QrUserModel.dart';
import '../Models/UserModel.dart';
import '../Providers/FetchUserProvider.dart';
import '../Providers/UserProvider.dart';
import '../utils/Constants.dart';
import '../utils/Utils.dart';
import 'package:dio/dio.dart';

class UserServices {
  Dio dio = Dio();
  Future<void> getUserDetails(
      {required BuildContext context, required String? userId}) async {
    var fetchuserprovider = Provider.of<FetchUser>(context, listen: false);
    try {
      Map<String, dynamic> requestBody = {
        'userId': userId,
      };
      fetchuserprovider.setLoading(true);
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}user/userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );
      fetchuserprovider.setLoading(false);
      if (res.statusCode == 200) {
        QrUserModel user =
            fetchuserprovider.qrUserDetails(jsonDecode(res.body));
        print(res.body);
        fetchuserprovider.setQrFetchedUser(user);
      } else if (res.statusCode == 400) {
        showSnackBar(context, "User ID Required");
      } else {
        showSnackBar(context, "Error");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<UserData> getprofileinfo() async {
    late UserData profile;

    try {
      print(Constants.usertoken);
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}user/profile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}'
        },
      );
      var user = jsonDecode(res.body);
      Name name = Name(
          firstName: user['user']['name']['firstName'],
          lastName: user['user']['name']['lastName']);
      Constants.btsprofile = UserData(covercoin: user['user']['cover_coins'],
          name: name,
          id: user['user']['_id'],
          email: user['user']['email'],
          password: user['user']['password'],
          phoneNumber: user['user']['phoneNumber'],
          role: user['user']['role'],
          image: user['user']['image'],
          isVerified: user['user']['isVerified'],
          v: user['user']['__v']);

      // print(user['user']['name']['firstName']);
    } catch (e) {
      print(e);
      // showSnackBar(context, e.toString());
    }
    return Constants.btsprofile;
  }
}
