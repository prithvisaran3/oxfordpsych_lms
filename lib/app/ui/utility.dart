import 'dart:async';

import 'package:deviraj_lms/app/controller/course.dart';
import 'package:flutter/material.dart';

class Utility {
  static const IconData currency_pound =
      IconData(0xf04df, fontFamily: 'MaterialIcons');
}

convertToSeconds(time) {
  dynamic totalSeconds;

  dynamic hours = int.parse(time[0].toString());
  dynamic minutes = int.parse(time[1].toString());

  dynamic seconds = int.parse(time[2].toString().split(".")[0]);
  dynamic milliSeconds = int.parse(time[2].toString().split(".")[1]);
  totalSeconds = seconds + (hours * 60 * 60) + (minutes * 60);
  print("$hours : $minutes : $seconds : $milliSeconds");
  print("$totalSeconds");

  CourseController.to.courseDuration = totalSeconds.toString();
}
