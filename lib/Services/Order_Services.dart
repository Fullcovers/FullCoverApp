import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:venq_assessment/screens/Bookings/bookings_screen.dart';
import 'package:venq_assessment/screens/QrScanner/Demo.dart';

import '../Models/Order.dart';
import '../Models/User.dart';
import '../Providers/OrderProvider.dart';
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
      var orderProvider = Provider.of<OrderProvider>(context, listen: false);
      orderProvider.setLoading(true);
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}orders/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-access-token': userprovider.token, // Pass access token as a header
        },
      );
      orderProvider.setLoading(false);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            Map<String, dynamic> responseJson = json.decode(res.body);

            isValid = responseJson['isValid'];
            message = responseJson['message'];

            print(responseJson);
            if (responseJson.containsKey('data')) {
              Map<String, dynamic> data = responseJson['data'];

              ticketId = data['_id'];
              quantity = data['items'][0]['quantity'];
              var orderProvider =
                  Provider.of<OrderProvider>(context, listen: false);
              OrderModel? order = orderProvider.getOrderFromMap(data);
              if (order != null) {
                orderProvider.setOrder(order);
              }
            }
            showSnackBar(context, message);
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
      print(userprovider.token);
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
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, "Ticket has been Validated");
        },
      );
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }
}
