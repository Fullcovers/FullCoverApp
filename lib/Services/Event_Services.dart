import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:venq_assessment/Providers/UserProvider.dart';
import 'package:venq_assessment/utils/Utils.dart';

import '../Models/Events.dart';
import '../Providers/EventProvider.dart';
import '../utils/Constants.dart';

class EventsServices {
  Future<List<Event>> getAllEvents({required BuildContext context}) async {
    EventProvider eventProvider =
        Provider.of<EventProvider>(context, listen: false);
    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}event/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      // print(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            EventProvider eventProvider =
                Provider.of<EventProvider>(context, listen: false);
            final eventData = json.decode(res.body)['data'];

            eventProvider.fetchEvents(eventData);
            print("hello");
            print(eventProvider.events);

            // showSnackBar(context, 'Events data fetched successfully');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return eventProvider.events;
  }

  Future<List<Event>> getmyclubEvents({required BuildContext context}) async {
    EventProvider eventProvider =
        Provider.of<EventProvider>(context, listen: false);
    try {
      http.Response club = await http.get(
        Uri.parse('${Constants.uri}club/my-club'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}'
        },
      );
      final clubid = json.decode(club.body)['data'][0]['_id'];
      print(clubid);

      http.Response res = await http.get(
        Uri.parse('${Constants.uri}club/$clubid/events'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${Constants.usertoken}'
        },
      );
      // print(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            EventProvider eventProvider =
                Provider.of<EventProvider>(context, listen: false);
            final eventData = json.decode(res.body)['data'];
            print(eventData);
            eventProvider.fetchEvents(eventData);
            print("hello");
            print(eventProvider.events);

            // showSnackBar(context, 'Events data fetched successfully');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e.toString());
    }
    return eventProvider.events;
  }
}

class CreateEventmethod {
  static createeventfunction(
      {required BuildContext context,
      required String name,
      required String starttime,
      required String endtime,
      required String date,
      required String description}) async {
    var body = {
      "name": name,
      "timings": {"startAt": starttime.toString(), "endsAt": endtime.toString()},
      "date": date.toString(),
      "description": description
    };

    print(Constants.usertoken);
    try {
      Dio dio = new Dio();
      var res = await dio.post('${Constants.uri}event/',
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
}
