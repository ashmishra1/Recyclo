import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/phone_auth/controller/phone_auth.dart';
import 'package:recyclo/screens/phone_auth/ui/widgets/otp_field.dart';
import 'package:recyclo/screens/phone_auth/ui/widgets/text_field.dart';
import 'package:recyclo/utils/shared/app_colors.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PhoneAuthController phoneAuthController =
        Get.put(PhoneAuthController());
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              TextFieldWidget(
                key: key,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    const Text(
                      "Enter 6 digit OTP",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.grey,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const otpField(),
              const SizedBox(
                height: 40,
              ),
              Obx(() {
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Send OTP again in ",
                        style: TextStyle(
                            fontSize: 16, color: Colors.greenAccent.shade400),
                      ),
                      TextSpan(
                        text: "00:${phoneAuthController.start.value}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      TextSpan(
                        text: " sec ",
                        style: TextStyle(
                            fontSize: 16, color: Colors.greenAccent.shade400),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(
                height: 150,
              ),
              InkWell(
                onTap: () {
                  phoneAuthController.authClass.signInwithPhoneNumber(
                      phoneAuthController.verificationIdFinal.value,
                      phoneAuthController.smsCode.value,
                      context);
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                      gradient: grad1, borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text(
                      "Lets Go",
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFFFFECC2),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
