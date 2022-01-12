import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NicknameController extends GetxController {
  final TextEditingController nicknametext = TextEditingController();
  final enable = false.obs;
  final nickname = 'Anonymous'.obs;

  void updateStatus() {
    if (nicknametext == null) {
      nickname.value = nicknametext.text;
      enable.value = false;
    } else {
      nickname.value = nicknametext.text;
      enable.value = true;
    }
  }
}
