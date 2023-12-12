import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA7_OWa-DM5XjP9t9wjFTb9JGtqpVurfuo",
            authDomain: "easy-invoice-platform.firebaseapp.com",
            projectId: "easy-invoice-platform",
            storageBucket: "easy-invoice-platform.appspot.com",
            messagingSenderId: "680538806937",
            appId: "1:680538806937:web:c392774081aa6ee05df608",
            measurementId: "G-P18ZLDWX80"));
  } else {
    await Firebase.initializeApp();
  }
}
