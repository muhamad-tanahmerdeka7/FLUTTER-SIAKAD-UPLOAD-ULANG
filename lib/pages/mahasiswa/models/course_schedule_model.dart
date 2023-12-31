// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CourseScheduleModel {
  final DateTime dateStart;
  final int longTimeTeaching;
  final String course;
  final String lecturer;
  final String description;
  final String startTime;
  final String endtTime;

  CourseScheduleModel({
    required this.dateStart,
    required this.longTimeTeaching,
    required this.course,
    required this.lecturer,
    required this.description,
    required this.startTime,
    required this.endtTime,
  });

  TimeOfDay get timeStart =>
      TimeOfDay(hour: dateStart.hour, minute: dateStart.minute);

  TimeOfDay get timeEnd {
    int addedMinutes = dateStart.minute + longTimeTeaching;
    int hour = dateStart.hour + addedMinutes ~/ 60;
    int minute = addedMinutes % 60;
    return TimeOfDay(hour: hour, minute: minute);
  }
}
