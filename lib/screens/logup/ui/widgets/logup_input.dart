import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/login/ui/login.dart';
import 'package:recyclo/screens/logup/controller/logup.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/shared/ui_helpers.dart';
import 'package:recyclo/utils/widgets/box_button.dart';
import 'package:recyclo/utils/widgets/box_inked_button.dart';
import 'package:recyclo/utils/widgets/box_input_field.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

class LogupInput extends StatelessWidget {
  const LogupInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logupController = Get.put(
      LogupController(),
    );
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BoxText.headline('Sign Up'),
          verticalSpaceLarge,
          BoxText.body('Enter your Email Address'),
          verticalSpaceSmall,
          BoxInputField(
            controller: emailController,
            placeholder: 'Email',
          ),
          verticalSpaceMedium,
          BoxText.body('Enter Password'),
          verticalSpaceSmall,
          BoxInputField(
            controller: passwordController,
            placeholder: 'Password',
            password: true,
          ),
          verticalSpaceLarge,
          BoxButton(
            title: 'SIGN UP',
            onTap: () async {
              await logupController.emailLogup(
                emailController,
                passwordController,
                context,
              );
              Get.snackbar(
                'Signed Up',
                '',
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.black,
                colorText: Colors.white,
              );
            },
          ),
          verticalSpaceSmall,
          BoxButton.outline(
            title: 'SIGN UP',
            leading: const Icon(
              FontAwesomeIcons.google,
              color: kcPrimaryColor,
              size: 16,
            ),
            onTap: () async {
              await logupController.googleSignIn();
            },
          ),
          verticalSpaceLarge,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BoxText.caption(
                'If you don\'t have an account? ',
              ),
              BoxInkedButton(
                text: 'Sign In',
                onTap: () async {
                  await Get.off(
                    () => const Login(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
