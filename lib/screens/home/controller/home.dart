import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  final _picker = ImagePicker();
  final imagePath = ''.obs;
  final imageUrl = ''.obs;
  var isLoading = false.obs;

  void selectImage(ImageSource imageSource) async {
    final _pickedFile = await _picker.pickImage(source: imageSource);
    if (_pickedFile != null) {
      imagePath.value = _pickedFile.path;
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.TOP,
        animationDuration: const Duration(seconds: 1),
      );
    }
    notifyChildrens();
  }
}
