import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:venq_assessment/screens/Bookings/bookings_screen.dart';
import 'package:venq_assessment/screens/QrScanner/Demo.dart';

import '../Models/User.dart';
import '../Providers/UserProvider.dart';
import '../utils/Constants.dart';
import '../utils/Utils.dart';

class OrderServices {
  void checkvalidateQrCode(
      {required String id, required BuildContext context}) async {
    String message = '';
    String ticketId = '';
    late bool isValid;
    late int quantity;
    try {
      var userprovider = Provider.of<UserProvider>(context, listen: false);
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}orders/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-access-token': userprovider.token, // Pass access token as a header
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            Map<String, dynamic> responseJson = json.decode(res.body);

            isValid = responseJson['isValid'];
            message = responseJson['message'];

            if (responseJson.containsKey('data')) {
              Map<String, dynamic> data = responseJson['data'];

              ticketId = data['_id'];
              quantity = data['items'][0]['quantity'];
              // String ticket = data['items'][0]['ticket'];
            }
            showSnackBar(context, message);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Demo(
                  ticketId: ticketId,
                  quantity: quantity,
                  isValid: isValid,
                ),
              ),
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void validateQrCode(
      {required String id, required BuildContext context}) async {
    String orderId = id;
    try {
      var userprovider = Provider.of<UserProvider>(context, listen: false);
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}orders/$orderId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${userprovider.token}'
        },
      );

      if (res.statusCode == 403) {
        // Handle the forbidden response
        showSnackBar(context, 'Forbidden: User not authenticated');
        // Perform any other necessary actions or show an appropriate message
        return;
      }
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          // Map<String, dynamic> responseJson = json.decode(res.body);

          // bool isValid = responseJson['isValid'];
          // message = responseJson['message'];

          // if (responseJson.containsKey('data')) {
          //   Map<String, dynamic> data = responseJson['data'];

          //   ticketId = data['_id'];
          //   quantity = data['items'][0]['quantity'];
          //   // String ticket = data['items'][0]['ticket'];
          // }

          showSnackBar(context, "Ticket has been Validated");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
