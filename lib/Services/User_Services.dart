import 'dart:convert';
import 'dart:typed_data';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import '../Models/UserModel.dart';
import '../Providers/FetchUserProvider.dart';
import '../Providers/UserProvider.dart';
import '../utils/Constants.dart';
import '../utils/Utils.dart';
import 'package:dio/dio.dart';

class UserServices {
  Dio dio = Dio();
  void getUserDetails(
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
        UserModel user =
            fetchuserprovider.parseUserDetails(jsonDecode(res.body));
        fetchuserprovider.setFetchedUser(user);
      } else if (res.statusCode == 400) {
        showSnackBar(context, "User ID Required");
      } else {
        showSnackBar(context, "Error");
      }
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }
}
