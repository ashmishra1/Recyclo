import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/account/controller/account.dart';

import 'package:recyclo/utils/shared/ui_helpers.dart';
import 'package:recyclo/utils/widgets/box_button.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AccountController homeController = Get.put(AccountController());
    return Scaffold(
        appBar: AppBar(
          title: const BoxText.headingThree(
            'Recyclo',
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Center(
          child: BoxText.headingOne('Account'),
        ));
  }
}
