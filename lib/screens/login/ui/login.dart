import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recyclo/screens/navbar/ui/navbar.dart';
import 'package:recyclo/utils/shared/ui_helpers.dart';

import 'widgets/login_input.dart';

class Login extends StatelessWidget {
  const Login({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return Navbar();
          } else {
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 30,
              ),
              children: const [
                verticalSpaceSmall,
                verticalSpaceSmall,
                LoginInput(),
              ],
            );
          }
        },
      ),
    );
  }
}
