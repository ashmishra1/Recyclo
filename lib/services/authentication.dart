import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recyclo/screens/navbar/ui/navbar.dart';
import 'package:recyclo/utils/shared/app_colors.dart';

class AuthClass extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final signedOut = false.obs;
  final gooleSignIn = GoogleSignIn();

  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context, Function setData) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(context, "Verification Completed");
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      showSnackBar(context, exception.toString());
    };
    void Function(String verificationID, [int? forceResnedingtoken]) codeSent =
        (String verificationID, [int? forceResnedingtoken]) {
      Get.snackbar('', 'OTP sent');
      setData(verificationID);
    };

    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationID) {
      showSnackBar(context, "Time out");
    };
    try {
      await auth.verifyPhoneNumber(
          timeout: Duration(seconds: 60),
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<void> signInwithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (builder) => Navbar()), (route) => false);

      showSnackBar(context, "logged In");
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> signOut() async {
    try {
      await gooleSignIn.signOut();
      await auth.signOut();
    } catch (e) {
      Get.snackbar(
        e.toString(),
        'Error Signing out',
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.black,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(
          Icons.error,
          color: Colors.red,
        ),
      );
    }
  }

  Future<User> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    // ignore: unused_local_variable
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      user = userCredential.user;
    }

    return Future.value(user);
  }

  Future<User> firebaseData(
    User? user,
  ) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    try {
      var userData = {
        'name': user?.displayName,
        'photoUrl': user?.photoURL,
        'email': user?.email,
        'bio': '',
      };

      await users.doc(user!.uid).get().then((doc) {
        if (doc.exists) {
          doc.reference.update(userData);
        } else {
          users.doc(user.uid).set(userData);
        }
      });

      return Future.value(user);
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.code,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: kcLightGreyColor);
      return Future.delayed(Duration.zero);
    }
  }
}
