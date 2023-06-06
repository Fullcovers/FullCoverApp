import 'dart:convert';

import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import 'package:provider/provider.dart';
import 'package:venq_assessment/utils/Utils.dart';

import '../Providers/EventProvider.dart';
import '../utils/Constants.dart';

class EventsServices {
  void getAllEvents({required BuildContext context}) async {
    try {
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}event/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            EventProvider eventProvider =
                Provider.of<EventProvider>(context, listen: false);
            final eventData = json.decode(res.body)['data'];

            eventProvider.fetchEvents(eventData);

            showSnackBar(context, 'Events data fetched successfully');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
