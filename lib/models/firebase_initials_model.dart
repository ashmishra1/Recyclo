import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/navbar/ui/navbar.dart';

class Authentication {
  static Future<FirebaseApp> initializeFirebase(
      {required BuildContext context}) async {
    var firebaseApp = await Firebase.initializeApp();

    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.offAll(() => Navbar());
    }
    return firebaseApp;
  }
}
