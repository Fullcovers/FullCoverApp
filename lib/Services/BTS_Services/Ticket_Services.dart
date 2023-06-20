import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:venq_assessment/Models/Ticket.dart';
import 'package:venq_assessment/utils/Constants.dart';
import "package:http/http.dart" as http;
import 'package:venq_assessment/utils/Utils.dart';

class BTSTicketServices {
  static Future<List<Ticket>> getclubTickets(
      {required BuildContext context}) async {
    late List<Ticket> tickets = [];

    try {
      http.Response myclub = await http.get(
        Uri.parse('${Constants.uri}club/my-club'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}',
        },
      );
      var myclubid = jsonDecode(myclub.body)['data'][0]['_id'];

      http.Response res = await http.get(
        Uri.parse('${Constants.uri}ticket/${myclubid}'),
        headers: <String, String>{
          'Authorization': 'Bearer ${Constants.usertoken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      List<dynamic> tic = (jsonDecode(res.body))['data'];
      for (var i = 0; i < tic.length; i++) {
        Ticket ticket = Ticket(
            crossed: tic[i]['price']['crossed'],
            current: tic[i]['price']['current'],
            id: tic[i]['_id'],
            club: tic[i]['club'],
            event: tic[i]['event'],
            name: tic[i]['name'],
            available: tic[i]['available'],
            v: tic[i]['__v']);
        tickets.add(ticket);
      }
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
    return tickets;
  }

  static Future<void> addclubTickets({
    required BuildContext context,
    required String name,
    required int crossed,
    required int current,
    required int available,
  }) async {
    var body = {
      "name": name,
      "price": {"crossed": crossed, "current": current},
      "available": available
    };

    try {
      Dio dio = new Dio();
      var res = await dio.post('${Constants.uri}ticket/',
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

  static Future<void> updateclubTickets({
    required BuildContext context,
    required String name,
    required int crossed,
    required int current,
  }) async {
    var body = {
      "name": name,
      "price": {"crossed": crossed, "current": current},
    };

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
      Dio dio = Dio();
      var res = await dio.put('${Constants.uri}ticket/${myclubid}/',
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

  static Future<void> delclubTickets({
    required BuildContext context,
    required String name,
  }) async {
    var body = {
      "name": name,
    };

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

      http.Response res = await http.put(
        Uri.parse(
          '${Constants.uri}ticket/d/${myclubid}',
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

  static Future<void> addEventTickets(
      {required BuildContext context,
      required String name,
      required int crossed,
      required int current,
      required int available,
      required String eventid}) async {
    var body = {
      "name": name,
      "price": {"crossed": crossed, "current": current},
      "available": available
    };

    try {
      Dio dio = new Dio();
      var res = await dio.post('${Constants.uri}ticket/c/$eventid/',
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

  static Future<void> deleventTickets(
      {required BuildContext context,
      required String name,
      required String eventid}) async {
    var body = {
      "name": name,
    };

    try {
      http.Response res = await http.put(
        Uri.parse(
          '${Constants.uri}ticket/c/$eventid/',
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

  static Future<void> updateeventTickets({
    required BuildContext context,
    required String name,    required String eventid,

    required int crossed,
    required int current,
  }) async {
    var body = {
      "name": name,
      "price": {"crossed": crossed, "current": current},
    };

    try {
  
      Dio dio = Dio();
      var res = await dio.put('${Constants.uri}ticket/c/$eventid/',
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
  static Future<List<Ticket>> getEventTickets(
      {required BuildContext context,required String eventid}) async {
    late List<Ticket> tickets = [];

    try {


      http.Response res = await http.get(
        Uri.parse('${Constants.uri}ticket/c/$eventid'),
        headers: <String, String>{
          'Authorization': 'Bearer ${Constants.usertoken}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      List<dynamic> tic = (jsonDecode(res.body))['data'];
      for (var i = 0; i < tic.length; i++) {
        Ticket ticket = Ticket(
            crossed: tic[i]['price']['crossed'],
            current: tic[i]['price']['current'],
            id: tic[i]['_id'],
            club: tic[i]['club'],
            event: tic[i]['event'],
            name: tic[i]['name'],
            available: tic[i]['available'],
            v: tic[i]['__v']);
        tickets.add(ticket);
      }
    } catch (e) {
      print(e);
      showSnackBar(context, e.toString());
    }
    return tickets;
  }
}
