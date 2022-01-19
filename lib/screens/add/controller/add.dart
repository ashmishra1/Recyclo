import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recyclo/models/post.dart';
import 'package:http/http.dart' as http;

class AddController extends GetxController {
  var dropdownValue = 'Tyre'.obs;
  var tags = [].obs;
  var validateCaption = ''.obs;
  var validateProcedure = ''.obs;
  var validatePrice = ''.obs;
  var validateItems = ''.obs;
  File? imageFile;
  File? videoFile;
  File selectedFile = File('assets/image_upload.svg');
  TextEditingController priceController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  TextEditingController procedureController = TextEditingController();
  TextEditingController itemsController = TextEditingController();
  XFile? pickedFile;

  ImagePicker? imagePicker;

  final _picker = ImagePicker();
  final imagePath = ''.obs;
  final imageUrl = ''.obs;

  void selectImage(ImageSource imageSource) async {
    pickedFile = await _picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      imagePath.value = pickedFile!.path;
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.TOP,
        animationDuration: const Duration(seconds: 1),
      );
    }
    update();
  }
}
