// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> getEmployeeAlreadyAttendance(
  List<String>? originalState,
  List<String>? duplicateState,
) async {
  // add the orginalState in duplicateState but check if it is exist then return the duplicateState
  if (originalState == null || duplicateState == null) {
    throw Exception("Both originalState and duplicateState must not be null");
  }

  List<String> result = List.from(duplicateState);

  for (String item in originalState) {
    if (!result.contains(item)) {
      result.add(item);
    }
  }

  return result;
}
