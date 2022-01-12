import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:recyclo/models/firebase_initials_model.dart';
import 'package:recyclo/screens/login/controller/login.dart';
import 'package:recyclo/screens/logup/ui/logup.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/shared/ui_helpers.dart';
import 'package:recyclo/utils/widgets/box_button.dart';
import 'package:recyclo/utils/widgets/box_inked_button.dart';
import 'package:recyclo/utils/widgets/box_input_field.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

class LoginInput extends StatelessWidget {
  const LoginInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController loginController =
        Get.put(LoginController(), permanent: true);
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BoxText.headline('Sign In'),
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
            title: 'SIGN IN',
            onTap: () async {
              await loginController.emailLogin(
                  emailController, passwordController, context);
            },
          ),
          verticalSpaceSmall,
          FutureBuilder(
            future: Authentication.initializeFirebase(
              context: context,
            ),
            builder: (
              context,
              snapshot,
            ) {
              if (snapshot.hasError) {
                return const Text(
                  'Error initializing Firebase',
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return BoxButton.outline(
                  title: 'SIGN IN',
                  leading: const Icon(
                    FontAwesomeIcons.google,
                    color: kcPrimaryColor,
                    size: 16,
                  ),
                  onTap: () async {
                    await loginController.googleSignIn();
                  },
                );
              }
              return const BoxButton(
                title: 'SIGN IN',
                busy: true,
              );
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
                text: 'Sign Up',
                onTap: () async {
                  await Get.off(
                    () => const LogUp(),
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
