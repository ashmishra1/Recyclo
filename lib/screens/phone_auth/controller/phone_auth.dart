import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/services/authentication.dart';

class PhoneAuthController extends GetxController {
  final start = 30.obs;
  final wait = false.obs;
  final buttonName = "Send".obs;
  TextEditingController phoneController = TextEditingController();
  AuthClass authClass = Get.put(AuthClass());
  final verificationIdFinal = "".obs;
  final smsCode = "".obs;

  void setData(String verificationId) {
    verificationIdFinal.value = verificationId;
    update();
    startTimer();
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer _timer = Timer.periodic(onsec, (timer) {
      if (start.value == 0) {
        timer.cancel();
        wait.value = false;
        update();
      } else {
        start.value--;
        update();
      }
    });
  }

  void setOnpress() {
    start.value = 30;
    wait.value = true;
    buttonName.value = "Resend";
    setData(verificationIdFinal.value);
    update();
  }

  void setTextField(String pin) {
    smsCode.value = pin;
    update();
  }
}
