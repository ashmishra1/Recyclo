import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/home/controller/home.dart';
import 'package:recyclo/screens/home/ui/widgets/image_option.dart';
import 'package:recyclo/utils/shared/ui_helpers.dart';
import 'package:recyclo/utils/widgets/box_button.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const BoxText.headingThree(
          'Recyclo',
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(40.0),
              child: Obx(() {
                return Container(
                  height: screenHeightPercentage(context, percentage: 0.3),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 20.0),
                  child: (homeController.imagePath.value != '')
                      ? Image.file(
                          File(homeController.imagePath.value),
                          height: 160.0,
                          width: 400.0,
                          fit: BoxFit.contain,
                        )
                      : const SizedBox(
                          width: 140.0,
                          height: 190.0,
                          child: Icon(
                            Icons.image,
                            color: Colors.black38,
                            size: 80.0,
                          ),
                        ),
                );
              })),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => const ImageOptions(),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: const BoxButton(
                title: 'Camera',
              ),
            ),
          ),
          Obx(() {
            return BoxText.headingTwo(homeController.result.value);
          })
        ],
      ),
    );
  }
}
