import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/navbar/ui/navbar.dart';
import 'package:recyclo/services/authentication.dart';

class LoginController extends GetxController {
  final authController = Get.put(AuthClass());
  Future<void> emailLogin(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) async {
    try {
      UserCredential userCredential = await authController.auth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      debugPrint(userCredential.user?.email);
      userCredential.user;

      Get.offAll(() => const Navbar());
    } catch (e) {
      Get.snackbar('Failed to Login!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.amberAccent);
    }
  }

  Future<void> googleSignIn() async {
    await authController.signInWithGoogle();
    Get.offAll(() => const Navbar());
  }
}
