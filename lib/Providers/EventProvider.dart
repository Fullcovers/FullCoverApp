import '../Models/Events.dart';
import 'package:flutter/cupertino.dart';

class EventProvider with ChangeNotifier {
  List<Event> events = [];
  void fetchEvents(List<dynamic> eventData) {
    events = eventData
        .map((eventData) => Event(
              id: eventData['_id'],
              clubId: eventData['clubId'],
              name: eventData['name'],
              time: DateTime.parse(eventData['time']),
              date: DateTime.parse(eventData['date']),
              description: eventData['description'],
              imageUrl: eventData['imageUrl'],
              tickets: eventData['tickets'],
              createdAt: DateTime.parse(eventData['createdAt']),
              updatedAt: DateTime.parse(eventData['updatedAt']),
            ))
        .toList();

    notifyListeners();
  }
}
