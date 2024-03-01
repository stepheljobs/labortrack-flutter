import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

bool hasUploadedMedia(String? mediaPath) {
  return mediaPath != null && mediaPath.isNotEmpty;
}

double? getLatitude(LatLng? currentPostition) {
  // create me function that has currentLocation and return lat only
  if (currentPostition != null) {
    return currentPostition.latitude;
  } else {
    return 0;
  }
}

double? getLongitude(LatLng? currentPosition) {
  if (currentPosition != null) {
    return currentPosition.longitude;
  } else {
    return 0;
  }
}

String? convertStringToImgPath(String? stringImage) {
  // convert the string to ImgPath
  if (stringImage != null && stringImage.isNotEmpty) {
    final bytes = base64.decode(stringImage);
    final imgPath = 'data:image/png;base64,${base64Encode(bytes)}';
    return imgPath;
  } else {
    return null;
  }
}

String getTime(DateTime attendanceTime) {
  // create a function that return the hours and min as string
  final hour = attendanceTime.hour.toString().padLeft(2, '0');
  final minute = attendanceTime.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

int getWeekNumber(DateTime currentDate) {
  // create function that return week number of the current date
  int weekNumber = int.parse(DateFormat('w').format(currentDate));
  return weekNumber;
}

String? getDayToday() {
  //  Create a function that return the date tomorrow with the format of  Tuesday
  final now = DateTime.now();
  // final tomorrow = now.add(Duration(days: 1));
  final formatter = DateFormat('EEEE');
  return formatter.format(now);
}
