import 'dart:convert';
import 'package:dio/dio.dart';
import "package:http/http.dart" as http;

import 'package:flutter/material.dart';
import 'package:venq_assessment/Models/Ticket.dart';
import 'package:venq_assessment/utils/Constants.dart';
import 'package:venq_assessment/utils/Utils.dart';

class BTStable {
  static Future<void> createtable({
    required BuildContext context,
    required String name,
    required String time,
    required String date,
    required int price,
    required int cover,
    required int tablenum,
    required String email,
    required String phone,
    required int number_of_people,
  }) async {
    var body = {
      "email": email.isNotEmpty,
      "phone": phone,
      "number_of_people": number_of_people,
      "price": price,
      "table_number": tablenum,
      "cover": cover,
      "time": time,
      "date": date,
      "name": name,
    };
    try {
      Dio dio = Dio();
      var res = await dio.post('${Constants.uri}table/',
          data: body,
          options: Options(
              headers: {'Authorization': 'Bearer ${Constants.usertoken}'}));
      if (res.statusCode == 201) {
        showSnackBar(context, "Created");
      } else if (res.statusCode == 403) {
        showSnackBar(context, "Forbidden User Authentication Required");
      } else {
        showSnackBar(context, "Something Wrong!!");
      }
    } catch (e) {
      // showSnackBar(context, e.toString());
      print(e);
    }
  }

  static Future<void> createtableofevent({
    required BuildContext context,
    required String name,
    required String email,
    required String phone,
    required String eventid,
    required int number_of_people,
  }) async {
    print(eventid);
    var body = {
      "email": email,
      "phone": phone,
      "number_of_people": number_of_people,
      "name": name,
      "eventId": eventid
    };
    try {
      Dio dio = Dio();
      var res = await dio.post('${Constants.uri}walkins/',
          data: body,
          options: Options(
              headers: {'Authorization': 'Bearer ${Constants.usertoken}'}));

      showSnackBar(context, "Created");

      // orders = jsonDecode(res.data);
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }

  static Future<dynamic> getalltables(
      {required BuildContext context, required String date}) async {
    var orders;
    try {
      print("object");
      print(Constants.myclub!.id);
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}table/?date=${date}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      orders = jsonDecode(res.body);
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
    return orders;
  }

  static Future<dynamic> getallonlinetables(
      {required BuildContext context, required String date}) async {
    var orders;
    try {
      print("object");
      print(Constants.myclub!.id);
      http.Response res = await http.get(
        Uri.parse(
            '${Constants.uri}torders/c/${Constants.myclub!.id}/d/?date=$date'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      orders = jsonDecode(res.body);
      print(orders);
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
    return orders;
  }

  static Future<dynamic> getalltablesofevent(
      {required BuildContext context, required String eventid}) async {
    var orders;
    try {
      print("object");
      print(Constants.myclub!.id);
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}walkins/$eventid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      orders = jsonDecode(res.body);
      print(orders['date']);
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
    return orders;
  }

  static Future<void> addtableTickets({
    required BuildContext context,
    required String name,
    required int crossed,
    required int current,
    required int available,
    // required String eventid
  }) async {
    var body = {
      "name": name,
      "price": {"crossed": crossed, "current": current},
      "available": available
    };

    try {
      Dio dio = new Dio();
      var res = await dio.post('${Constants.uri}tables/',
          data: body,
          options: Options(
              headers: {'Authorization': 'Bearer ${Constants.usertoken}'}));

      print(json.encode(body));
      print(res.data);
      showSnackBar(context, "Created");
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }

  static Future<List<Ticket>> getTableTickets({
    String myclubid = "",
    required BuildContext context,
  }) async {
    late List<Ticket> tickets = [];
    print("getTableTickets");
    try {
        http.Response myclub = await http.get(
          Uri.parse('${Constants.uri}club/my-club'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${Constants.usertoken}',
          },
        );
        var myclubid = jsonDecode(myclub.body)['data'][0]['_id'];
      
      print(myclubid);
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}tables/c/$myclubid'),
        headers: <String, String>{
          'Authorization': 'Bearer ${Constants.usertoken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      List<dynamic> tic = (jsonDecode(res.body))['data'];
      print(res);
      for (var i = 0; i < tic.length; i++) {
        Ticket ticket = Ticket(
          crossed: tic[i]['price']['crossed'],
          current: tic[i]['price']['current'],
          id: tic[i]['_id'],
          club: tic[i]['club'],
          event: tic[i]['event'],
          name: tic[i]['name'],
          available: tic[i]['available'],
          v: tic[i]['__v'],
        );

        tickets.add(ticket);
      }
      print(tickets.length);
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
    return tickets;
  }

  static Future<List<Ticket>> getTableTicketsbyclubid({
    required String myclubid,
    required BuildContext context,
  }) async {
    late List<Ticket> tickets = [];
    print("getTableTickets");
    try {
   
      print(myclubid);
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}tables/c/$myclubid'),
        headers: <String, String>{
          'Authorization': 'Bearer ${Constants.usertoken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      List<dynamic> tic = (jsonDecode(res.body))['data'];
      print(res);
      for (var i = 0; i < tic.length; i++) {
        Ticket ticket = Ticket(
          crossed: tic[i]['price']['crossed'],
          current: tic[i]['price']['current'],
          id: tic[i]['_id'],
          club: tic[i]['club'],
          event: tic[i]['event'],
          name: tic[i]['name'],
          available: tic[i]['available'],
          v: tic[i]['__v'],
        );

        tickets.add(ticket);
      }
      print(tickets.length);
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
    return tickets;
  }

  static Future<void> deltableTickets(
      {required BuildContext context,
      required String name,
      required String tableid}) async {
    var body = {
      "name": name,
    };

    try {
      http.Response res = await http.delete(
        Uri.parse(
          '${Constants.uri}tables/$tableid',
        ),
        headers: <String, String>{
          'Authorization': 'Bearer ${Constants.usertoken}'
        },
        body: body,
      );

      // Dio dio = Dio();
      // var res = await dio.delete('${Constants.uri}ticket/${myclubid}/',
      //     data: body,
      //     options: Options(headers: {
      //       'Content-Type': 'application/json; charset=UTF-8',
      //       'Authorization': 'Bearer ${Constants.usertoken}'
      //     }));

      print(json.encode(body));
      print(res.body);
      showSnackBar(context, "Deleted");
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }

  static Future<void> accepttableTickets(
      {required BuildContext context, required String orderid}) async {
    try {
      http.Response res = await http.post(
        Uri.parse(
          '${Constants.uri}torders/$orderid',
        ),
        headers: <String, String>{
          'Authorization': 'Bearer ${Constants.usertoken}'
        },
      );

      // Dio dio = Dio();
      // var res = await dio.delete('${Constants.uri}ticket/${myclubid}/',
      //     data: body,
      //     options: Options(headers: {
      //       'Content-Type': 'application/json; charset=UTF-8',
      //       'Authorization': 'Bearer ${Constants.usertoken}'
      //     }));

      print(res.body);
      showSnackBar(context, "Accepted");
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }

  static Future<void> declinetableTickets(
      {required BuildContext context, required String orderid}) async {
    try {
      http.Response res = await http.post(
        Uri.parse(
          '${Constants.uri}torders/$orderid/r',
        ),
        headers: <String, String>{
          'Authorization': 'Bearer ${Constants.usertoken}'
        },
      );

      // Dio dio = Dio();
      // var res = await dio.delete('${Constants.uri}ticket/${myclubid}/',
      //     data: body,
      //     options: Options(headers: {
      //       'Content-Type': 'application/json; charset=UTF-8',
      //       'Authorization': 'Bearer ${Constants.usertoken}'
      //     }));

      print(res.body);
      showSnackBar(context, "Declined");
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }

  static Future<void> updatetableTickets({
    required BuildContext context,
    required String name,
    required int ava,
    required String tableid,
    required int crossed,
    required int current,
  }) async {
    var body = {
      "name": name,
      "price": {"crossed": crossed, "current": current},
      "available": ava
    };

    try {
      Dio dio = Dio();
      var res = await dio.put('${Constants.uri}tables/$tableid',
          data: body,
          options: Options(headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${Constants.usertoken}'
          }));

      print(json.encode(body));
      print(res.data);
      showSnackBar(context, "Updated");
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }
}
