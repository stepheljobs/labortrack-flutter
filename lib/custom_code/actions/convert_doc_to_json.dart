// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> convertDocToJson(List<String>? documents) async {
  // covert firebase documents into JSON format
  List<dynamic> jsonList = [];

  if (documents != null) {
    for (String document in documents) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('projects')
          .doc(document)
          .get();

      if (snapshot.exists) {
        Object data = snapshot.data()!;
        // data['id'] = snapshot.id;
        jsonList.add(data);
      }
    }
  }

  return jsonList;
}
