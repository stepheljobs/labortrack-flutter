// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

Future<String?> generateCode(bool? isGenerateCode) async {
  //  create action that generate code with 6 digit and letter combination if the argument is true
  if (isGenerateCode == true) {
    String code = "";
    var random = new Random();
    for (var i = 0; i < 8; i++) {
      var charOrNum = random.nextInt(2);
      if (charOrNum == 0) {
        var char = random.nextInt(26) + 65;
        code += String.fromCharCode(char);
      } else {
        var num = random.nextInt(10);
        code += num.toString();
      }
    }
    return code;
  }
  return null;
}
