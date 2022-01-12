import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/navbar/ui/navbar.dart';
import 'package:recyclo/screens/nickname/controller/nickname.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/widgets/box_button.dart';

class NicknameScreen extends StatelessWidget {
  const NicknameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NicknameController nicknameController = Get.put(NicknameController());
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: grad1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'So nice to meet you! What do your friends call you?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
            child: TextField(
              controller: nicknameController.nicknametext,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 20.0,
                  height: 2,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: 'Your Nickname...',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 18.0,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                filled: true,
                fillColor: Colors.black.withOpacity(0.05),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ).copyWith(
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ).copyWith(
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 100.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: BoxButton(
              disabled: true,
              title: 'CONTINUE',
              radius: 40.0,
              dark: true,
              onTap: () {
                nicknameController.updateStatus();
                Get.offAll(() => Navbar());
              },
            ),
          )
        ],
      ),
    ));
  }
}
