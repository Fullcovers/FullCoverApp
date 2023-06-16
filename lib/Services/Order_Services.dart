import 'dart:convert';

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:venq_assessment/Models/OrderValidation.dart';
import 'package:venq_assessment/Providers/OrderValidationProvider.dart';

import 'package:venq_assessment/screens/Bookings/bookings_screen.dart';
import 'package:venq_assessment/screens/QrScanner/Demo.dart';

import '../Models/Order.dart';
import '../Models/User.dart';
import '../Providers/OrderProvider.dart';
import '../Providers/UserProvider.dart';
import '../utils/Constants.dart';
import '../utils/Utils.dart';

class OrderServices {
  // void checkvalidateQrCode(
  //     {required String id, required BuildContext context}) async {
  //   String message = '';
  //   String ticketId = '';
  //   late bool isValid;
  //   late int quantity;
  //   try {
  //     var userprovider = Provider.of<UserProvider>(context, listen: false);
  //     var orderProvider = Provider.of<OrderProvider>(context, listen: false);
  //     orderProvider.setLoading(true);
  //     http.Response res = await http.get(
  //       Uri.parse('${Constants.uri}orders/$id'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'x-access-token': userprovider.token, // Pass access token as a header
  //       },
  //     );
  //     orderProvider.setLoading(false);
  //     httpErrorHandle(
  //         response: res,
  //         context: context,
  //         onSuccess: () {
  //           Map<String, dynamic> responseJson = json.decode(res.body);

  //           isValid = responseJson['isValid'];
  //           message = responseJson['message'];

  //           if (responseJson.containsKey('data')) {
  //             Map<String, dynamic> data = responseJson['data'];

  //             ticketId = data['_id'];
  //             quantity = data['items'][0]['quantity'];
  //             var orderProvider =
  //                 Provider.of<OrderProvider>(context, listen: false);
  //             OrderModel? order = orderProvider.getOrderFromMap(data);
  //             if (order != null) {
  //               orderProvider.setOrder(order);
  //             }
  //           }
  //           // showSnackBar(context, message);
  //         });
  //   } catch (e) {
  //     print(e.toString());
  //     showSnackBar(context, e.toString());
  //   }
  // }
  Future<void> checkvalidateQrCode(
      {required String id, required BuildContext context}) async {
    String message = '';
    String ticketId = '';
    late bool isValid;
    late int quantity;
    try {
      var userprovider = Provider.of<UserProvider>(context, listen: false);
      var orderProvider =
          Provider.of<OrderValidationProvider>(context, listen: false);

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

            if (responseJson.containsKey('data')) {
              Map<String, dynamic> data = responseJson['data'];

              ticketId = data['_id'];
              quantity = data['items'][0]['quantity'];
              var orderProvider =
                  Provider.of<OrderValidationProvider>(context, listen: false);
              OrderValidationModel? order = orderProvider.getOrderFromMap(data);
              if (order != null) {
                orderProvider.setOrder(order);
              }
            }
            // showSnackBar(context, message);
          });
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  Future<void> getAllOrder({required BuildContext context}) async {
    try {
      var userprovider = Provider.of<UserProvider>(context, listen: false);
      var orderProvider = Provider.of<OrderProvider>(context, listen: false);
      await userprovider.loadToken();
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}orders/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${userprovider.token}'
        },
      );
      orderProvider.storeOrders(res.body);

// Access the stored orders

    } catch (e) {
      print(e.toString());
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
      String message = jsonDecode(res.body)['message'];
      if (res.statusCode == 200) {
        showSnackBar(context, "Ticket Verified Successfully!!");
      } else if (res.statusCode == 403) {
        showSnackBar(context, 'Forbidden: User not authenticated');
        return;
      } else if (res.statusCode == 400) {
        showSnackBar(context, message);
      } else if (res.statusCode == 404) {
        showSnackBar(context, message);
      } else if (res.statusCode == 405) {
        showSnackBar(context, message);
      } else if (res.statusCode == 403) {
        showSnackBar(context, "Forbidden User Not Authenticated");
      } else {
        showSnackBar(context, "Error in Fetching");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
