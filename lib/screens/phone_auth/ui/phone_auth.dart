import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:recyclo/screens/navbar/ui/navbar.dart';
import 'package:recyclo/screens/phone_auth/controller/phone_auth.dart';
import 'package:recyclo/screens/phone_auth/ui/widgets/auth_screen.dart';
import 'package:recyclo/screens/phone_auth/ui/widgets/text_field.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

import 'widgets/otp_field.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return Navbar();
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}
