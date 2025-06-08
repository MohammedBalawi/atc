import 'package:flutter/material.dart';

class EventModel {
  DateTime start;
  DateTime end;
  String title;
  Color color;
  List<DateTime> days = [];

  EventModel({
    required this.start,
    required this.end,
    required this.title,
    required this.color,
    required this.days,
  });
}
