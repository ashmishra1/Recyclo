import 'package:get/get.dart';
import 'package:recyclo/screens/navbar/ui/navbar.dart';
import 'package:sawo/sawo.dart';

class LoginController extends GetxController {
  // sawo object
  Sawo sawo = Sawo(
    apiKey: "9ce8d846-8e88-4662-b657-f383aa6ac4f9",
    secretKey: "61a0e7dc3ec0815552768db6BMdy2qmujuXhGmqotznZFGNa",
  );

  // user payload
  final user = "".obs;

  void payloadCallback(context, payload) {
    if (payload == null || (payload is String && payload.length == 0)) {
      payload = "Login Failed :(";
    } else {
      user.value = payload;
      update();
      Get.offAll(() => const Navbar());
    }
  }
}
