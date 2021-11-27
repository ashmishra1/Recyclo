import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:recyclo/screens/phone_auth/controller/phone_auth.dart';

class otpField extends StatelessWidget {
  const otpField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhoneAuthController phoneAuthController = Get.find();
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width - 34,
      fieldWidth: 58,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: CupertinoColors.systemGrey6,
        borderColor: Colors.transparent,
        disabledBorderColor: Colors.transparent,
        enabledBorderColor: Colors.transparent,
        focusBorderColor: Colors.tealAccent.shade200,
      ),
      style: const TextStyle(fontSize: 17, color: Colors.black),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      onChanged: (val) {},
      onCompleted: (pin) {
        print("Completed: " + pin);
        phoneAuthController.setTextField(pin);
      },
    );
  }
}
