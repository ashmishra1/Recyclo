import 'package:flutter/material.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

class BoxInkedButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const BoxInkedButton({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BoxText.inkedText(text),
    );
  }
}
