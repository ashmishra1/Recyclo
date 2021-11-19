import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomeController extends GetxController {
  var result = ''.obs;
  ImagePicker? imagePicker;

  final _picker = ImagePicker();
  final imagePath = ''.obs;
  final imageUrl = ''.obs;
  var isLoading = false.obs;

  void selectImage(ImageSource imageSource) async {
    final _pickedFile = await _picker.pickImage(source: imageSource);
    if (_pickedFile != null) {
      imagePath.value = _pickedFile.path;
      doImageClassification();
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

  loadDataModelFiles() async {
    Future<String?> output = Tflite.loadModel(
      model: 'assets/datasets/model_unquant.tflite',
      labels: 'assets/datasets/labels.txt',
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
    print(output);
  }

  @override
  void onInit() {
    imagePicker = ImagePicker();
    loadDataModelFiles();
    super.onInit();
  }

  doImageClassification() async {
    var recognition = await Tflite.runModelOnImage(
      path: imagePath.value,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 1,
      threshold: 0.1,
      asynch: true,
    );
    print(recognition!.length.toString());
    result.value = '';
    update();
    recognition.forEach((element) {
      print(element.toString());
      result.value += element['label'] + '\n\n';
    });
  }
}
