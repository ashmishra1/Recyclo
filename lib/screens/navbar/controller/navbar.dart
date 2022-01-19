import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  final name = 'Home'.obs;
  var photoUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG_yIbHjzrzghXkTcOahJZn0eZCjyyLZ_lOg&usqp=CAU'
          .obs;
  var userId = ''.obs;
  var tabIndex = 0;

  @override
  void onInit() {
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
