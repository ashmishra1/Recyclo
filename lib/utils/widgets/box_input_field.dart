import 'package:flutter/material.dart';
import 'package:recyclo/utils/shared/app_colors.dart';

class BoxInputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final void Function()? trailingTapped;
  final bool? dark;

  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );

  BoxInputField({
    Key? key,
    required this.controller,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.password = false,
    this.dark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      /// Overriding the default blue color.
      ///
      /// We can also avoid this by changing the [primarySwatch] in MaterialApp
      data: ThemeData(primaryColor: kcPrimaryColor),
      child: TextField(
        controller: controller,
        style: const TextStyle(height: 1),
        obscureText: password,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: TextStyle(
            color: (dark == false) ? Colors.black45 : Colors.white,
            fontSize: 18.0,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          filled: true,
          fillColor: (dark == false)
              ? kcVeryLightGreyColor
              : Colors.black.withOpacity(0.1),
          prefixIcon: leading,
          suffixIcon: trailing != null
              ? GestureDetector(
                  onTap: trailingTapped,
                  child: trailing,
                )
              : null,
          border: circularBorder.copyWith(
            borderSide: const BorderSide(color: kcLightGreyColor),
          ),
          errorBorder: circularBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedBorder: circularBorder.copyWith(
            borderSide: BorderSide(
                color: (dark == false) ? kcPrimaryColor : Colors.transparent),
          ),
          enabledBorder: circularBorder.copyWith(
            borderSide: BorderSide(
                color: (dark == false) ? kcLightGreyColor : Colors.transparent),
          ),
        ),
      ),
    );
  }
}
