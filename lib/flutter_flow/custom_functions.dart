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
import '/auth/firebase_auth/auth_util.dart';

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
