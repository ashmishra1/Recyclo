import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/navbar/ui/navbar.dart';
import 'package:recyclo/screens/nickname/ui/nickname.dart';
import 'package:recyclo/services/authentication.dart';

final authController = Get.put(AuthClass());

class LogupController extends GetxController {
  Future<void> emailLogup(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) async {
    try {
      UserCredential userCredential = await authController.auth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      // ignore: avoid_print
      print(userCredential.user?.email);
      // ignore: unused_local_variable
      User? user = userCredential.user;
      authController.firebaseData(user);

      Get.offAll(() => const Navbar());
    } catch (e) {
      Get.snackbar(
        'Failed to Sign Up',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.amberAccent,
      );
    }
  }

  Future<void> googleSignIn() async {
    // ignore: unused_local_variable
    var user = await authController.signInWithGoogle();
    authController.firebaseData(
      user,
    );

    Get.offAll(() => const NicknameScreen());
  }
}
