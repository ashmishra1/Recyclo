import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/login/controller/login.dart';

import 'package:recyclo/utils/widgets/box_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController loginContoller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: const BoxText.headingThree(
          'Recyclo',
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("UserData :- $loginContoller.user"),
              ElevatedButton(
                onPressed: () {
                  loginContoller.sawo.signIn(
                    context: context,
                    identifierType: 'email',
                    callback: loginContoller.payloadCallback,
                  );
                },
                child: Text('Email Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  loginContoller.sawo.signIn(
                    context: context,
                    identifierType: 'phone_number_sms',
                    callback: loginContoller.payloadCallback,
                  );
                },
                child: Text('Phone Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
