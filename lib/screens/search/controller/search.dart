import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class SearchController extends GetxController {
  var result = [].obs;
  ImagePicker? imagePicker;

  final _picker = ImagePicker();
  final imagePath = ''.obs;
  final imageUrl = ''.obs;
  var isLoading = false.obs;
  var searchImage = false.obs;

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
      model: 'assets/datasets/ssd_mobilenet_v1_1_metadata_1.tflite',
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
    var recognition = await Tflite.detectObjectOnImage(
      path: imagePath.value,
      model: "SSDMobileNet",
      imageMean: 127.5,
      imageStd: 127.5,
      threshold: 0.4,
      numResultsPerClass: 10,
      asynch: true,
    );
    print(recognition!.length.toString());
    //result.add(item) = '';
    update();
    for (var element in recognition) {
      print(element.toString());
      if (element["confidenceInClass"] > 0.50) {
        result.add(element['detectedClass']);
        result.value = Set.of(result).toList();
        //result.value += element['detectedClass'] + "\n";
        print(result);
      }
    }
  }

  void getKeywords(String keywords) {
    if (keywords != '') {
      result.value = keywords.split(",");
    }
  }

  void refreshdata() {
    result.value = [];
    imagePath.value = '';
  }
}
