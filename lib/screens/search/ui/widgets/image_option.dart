import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recyclo/screens/search/controller/search.dart';
import 'package:recyclo/utils/shared/ui_helpers.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

class ImageOptions extends StatelessWidget {
  const ImageOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchController());
    return Container(
      height: screenHeightPercentage(context, percentage: 0.2),
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () async {
              controller.selectImage(ImageSource.camera);
              Navigator.of(context).pop();
            },
            child: Column(
              children: const [
                Icon(Icons.camera_alt),
                verticalSpaceSmall,
                BoxText.caption('Camera'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              controller.selectImage(ImageSource.gallery);
              Navigator.of(context).pop();
            },
            child: Column(
              children: const [
                Icon(Icons.photo_album),
                verticalSpaceSmall,
                BoxText.caption('Gallery'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
