import 'package:intl/intl.dart';

import '../Models/Events.dart';
import 'package:flutter/cupertino.dart';

class EventProvider with ChangeNotifier {
  List<Event> events = [];
  // void fetchEvents(List<dynamic> eventData) {
  //   events = eventData
  //       .map((eventData) => Event(
  //             id: eventData['_id'],
  //             clubId: eventData['club'],
  //             name: eventData['name'],
  //             time: eventData.containsKey('time')
  //                 ? DateTime.parse(eventData['time'])
  //                 : DateTime.now(),
  //             date: DateTime.parse(eventData['date']),
  //             description: eventData['description'],
  //             imageUrl: eventData['imageUrl'],
  //             tickets: eventData['tickets'],
  //             createdAt: DateTime.parse(eventData['createdAt']),
  //             updatedAt: DateTime.parse(eventData['updatedAt']),
  //           ))
  //       .toList();

  //   notifyListeners();
  // }
  void fetchEvents(List<dynamic> eventData) {
    events = eventData.map((eventData) {
      String startAt = eventData.containsKey('timings')
          ? eventData['timings']['startAt']
          : "00:00AM";
      String endsAt = eventData.containsKey('timings')
          ? eventData['timings']['endsAt']
          : "00:00AM";

      DateTime date = DateTime.parse(eventData['date']);
      // DateTime timeStartsAt = parseDateTimeWithTime(date, startAt);
      // DateTime timeEndsAt = parseDateTimeWithTime(date, endsAt);

      return Event(
        id: eventData['_id'],
        clubId: eventData['club'],
        name: eventData['name'],
        timeStartsAt: startAt,
        timeEndsAt: endsAt,
        date: date,
        description: eventData['description'],
        imageUrl: eventData['imageUrl'],
        artists: eventData['artists'],
        ageRestriction: eventData['age_restriction'],
        createdAt: DateTime.parse(eventData['createdAt']),
        updatedAt: DateTime.parse(eventData['updatedAt']),
      );
    }).toList();

    notifyListeners();
  }

  // DateTime parseDateTimeWithTime(DateTime date, String time) {
  //   String timeFormat = 'h:mma'; // Assumes the time format is in 12-hour format
  //   String dateTimeString = '${DateFormat('yyyy-MM-dd').format(date)} $time';
  //   DateFormat dateFormat = DateFormat(timeFormat);

  //   return dateFormat.parse(dateTimeString);
  // }
}
