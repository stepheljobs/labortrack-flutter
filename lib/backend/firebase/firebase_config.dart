import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCScgbMa_zoCHp__PLHob8JXn03FQZtNKc",
            authDomain: "labortrack-3cd62.firebaseapp.com",
            projectId: "labortrack-3cd62",
            storageBucket: "labortrack-3cd62.appspot.com",
            messagingSenderId: "1087517359140",
            appId: "1:1087517359140:web:43fef56066cd6aa3606cb1",
            measurementId: "G-49MD4YTD6G"));
  } else {
    await Firebase.initializeApp();
  }
}
