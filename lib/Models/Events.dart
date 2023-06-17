import 'package:flutter/material.dart';

// class Event {
//   final String id;
//   final String clubId;
//   final String name;
//   final DateTime time;
//   final DateTime date;
//   final String description;
//   final String imageUrl;
//   final List<dynamic> tickets;
//   final DateTime createdAt;
//   final DateTime updatedAt;

//   Event({
//     required this.id,
//     required this.clubId,
//     required this.name,
//     required this.time,
//     required this.date,
//     required this.description,
//     required this.imageUrl,
//     required this.tickets,
//     required this.createdAt,
//     required this.updatedAt,
//   });
// }
class Event {
  final String id;
  final String clubId;
  final String name;
  final String timeStartsAt;
  final String timeEndsAt;
  final DateTime date;
  final String description;
  final String imageUrl;
  final List<dynamic> artists;
  final int ageRestriction;
  final DateTime createdAt;
  final DateTime updatedAt;

  Event({
    required this.id,
    required this.clubId,
    required this.name,
    required this.timeStartsAt,
    required this.timeEndsAt,
    required this.date,
    required this.description,
    required this.imageUrl,
    required this.artists,
    required this.ageRestriction,
    required this.createdAt,
    required this.updatedAt,
  });
}

class CreateEventModel {
  final String name;
  final TimeOfDay time;
  final DateTime date;
  final String description;

  CreateEventModel({
    required this.name,
    required this.date,
    required this.description,
    required this.time,
  });
}
