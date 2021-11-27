import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/phone_auth/controller/phone_auth.dart';
import 'package:recyclo/utils/shared/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhoneAuthController phoneAuthController = Get.find();
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: kcPrimaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: phoneAuthController.phoneController,
        style: const TextStyle(color: Colors.black, fontSize: 17),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your phone Number",
          hintStyle: const TextStyle(color: Colors.black54, fontSize: 17),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 19, horizontal: 8),
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            child: Text(
              " (+91) ",
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
          ),
          suffixIcon: InkWell(
            onTap: phoneAuthController.wait.value
                ? null
                : () async {
                    phoneAuthController.setOnpress();

                    await phoneAuthController.authClass.verifyPhoneNumber(
                        "+91 ${phoneAuthController.phoneController.text}",
                        context,
                        phoneAuthController.setData);
                  },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Obx(() {
                  return Text(
                    phoneAuthController.buttonName.value,
                    style: TextStyle(
                      color: phoneAuthController.wait.value
                          ? kcLightGreyColor
                          : Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                })),
          ),
        ),
      ),
    );
  }
}
