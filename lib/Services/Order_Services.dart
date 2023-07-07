import 'dart:convert';

import 'package:dio/dio.dart';
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
              quantity = data['items'][0]['qty'];
              var orderProvider =
                  Provider.of<OrderValidationProvider>(context, listen: false);
              OrderValidationModel? order = orderProvider.getOrderFromMap(data);
              print(res.body);
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
  static Future<dynamic> getAllpOrderhistory({required BuildContext context}) async {
    var orders;
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
      orders=jsonDecode(res.body);

// Access the stored orders
    } catch (e) {
      print(e.toString());
    }
    return orders;
  }

  static Future<dynamic> getAllOrderhistory({required BuildContext context}) async {
    var orders;
    try {      print("orders");

      var userprovider = Provider.of<UserProvider>(context, listen: false);
      var orderProvider = Provider.of<OrderProvider>(context, listen: false);
      await userprovider.loadToken();print(userprovider.token);
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}orders/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${userprovider.token}'
        },
      );print(res.body);
      // orderProvider.storeOrders(res.body);
      orders=jsonDecode(res.body);
      print("orders");
      print(orders);

// Access the stored orders
    } catch (e) {
      print(e.toString());
    }
    return orders;
  }
static Future<dynamic> getAlltableOrderhistory({required BuildContext context}) async {
    var orders;
    try {
      var userprovider = Provider.of<UserProvider>(context, listen: false);
      await userprovider.loadToken();
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}torders/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${userprovider.token}'
        },
      );
      orders=jsonDecode(res.body);
print(orders);
// Access the stored orders
    } catch (e) {
      print(e.toString());
    }
    return orders;
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
      print(res.statusCode);
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

  static void placeOrder(
      {required BuildContext context,
      required Map<String, dynamic> requestbody}) async {
    try {
      var userprovider = Provider.of<UserProvider>(context, listen: false);
print(requestbody.toString());
      await userprovider.loadToken();
      Dio dio = Dio();
      var res = await dio.post('${Constants.uri}orders/c/',
          data: requestbody,
          options: Options(headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${Constants.usertoken}'
          }));
      // http.Response res =
      //     await http.post(Uri.parse('${Constants.uri}orders/s/'),
      //         headers: <String, String>{
      //           'Content-Type': 'application/json; charset=UTF-8',
      //           'Authorization': 'Bearer ${userprovider.token}'
      //         },
      //         body: jsonEncode(requestbody));
      print(res.data);
      if (res.statusCode == 201) {
        showSnackBar(context, 'Order Created');
      } else {
        showSnackBar(context, 'Something went wrong');
      }
    } catch (e) {
      print(e.toString());
    }
  }
  static void placetableOrder(
      {required BuildContext context,
      required Map<String, dynamic> requestbody}) async {
    try {
      var userprovider = Provider.of<UserProvider>(context, listen: false);

      await userprovider.loadToken();
      Dio dio = Dio();
      var res = await dio.post('${Constants.uri}torders/c/',
          data: requestbody,
          options: Options(headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${Constants.usertoken}'
          }));
      // http.Response res =
      //     await http.post(Uri.parse('${Constants.uri}orders/s/'),
      //         headers: <String, String>{
      //           'Content-Type': 'application/json; charset=UTF-8',
      //           'Authorization': 'Bearer ${userprovider.token}'
      //         },
      //         body: jsonEncode(requestbody));
      print(res.data);
      if (res.statusCode == 201) {
        showSnackBar(context, 'Table Created');
      } else {
        showSnackBar(context, 'Something went wrong');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static void placeOrderforevent(
      {required BuildContext context,
      required Map<String, dynamic> requestbody}) async {
    try {
      var userprovider = Provider.of<UserProvider>(context, listen: false);

      await userprovider.loadToken();
      Dio dio = Dio();
      var res = await dio.post('${Constants.uri}orders/e/',
          data: requestbody,
          options: Options(headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${Constants.usertoken}'
          }));
      // http.Response res =
      //     await http.post(Uri.parse('${Constants.uri}orders/s/'),
      //         headers: <String, String>{
      //           'Content-Type': 'application/json; charset=UTF-8',
      //           'Authorization': 'Bearer ${userprovider.token}'
      //         },
      //         body: jsonEncode(requestbody));
      print(res.data);
      if (res.statusCode == 201) {
        showSnackBar(context, 'Order Created');
      } else {
        showSnackBar(context, 'Something went wrong');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
