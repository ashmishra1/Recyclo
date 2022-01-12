import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recyclo/models/post.dart';
import 'package:http/http.dart' as http;

class AddController extends GetxController {
  var dropdownValue = 'Tyre'.obs;
  var tags = [].obs;
  var enableNext = false.obs;
  File? imageFile;
  File? videoFile;
  File selectedFile = File('assets/image_upload.svg');
  TextEditingController priceController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  TextEditingController procedureController = TextEditingController();
  XFile? pickedFile;
  Dio dio = Dio();

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

  createPost(Map<String, String> data) async {
    final response = await dio
        .post("https://recyclo.herokuapp.com/api/add-post", data: data);
  }
}

 // final response = await http.post(Uri.parse(
      //     //'https://recyclo.herokuapp.com/api/add-post'
      //     "https://recyclo.herokuapp.com/api/add-post"), body: {
      //   "caption": name,
      //   "procedure": 'hi',
      //   "price": '400',
      //   //"photo": UploadFileInfo(_image, basename(_image.path)),

      //   // "title": "Ashutosh Mishra",
      //   // "body": "Post body",
      //   // "userId": "1",
      // });