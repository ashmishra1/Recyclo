import 'package:flutter/material.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/shared/styles.dart';

class BoxButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;
  final double radius;
  final bool dark;

  const BoxButton({
    Key? key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.leading,
    this.radius = 8,
    this.dark = false,
  })  : outline = false,
        super(key: key);

  const BoxButton.outline({
    Key? key,
    required this.title,
    this.onTap,
    this.leading,
    this.radius = 8,
    this.dark = false,
  })  : disabled = false,
        busy = false,
        outline = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: double.infinity,
        height: 48,
        alignment: Alignment.center,
        decoration: !outline
            ? (disabled == false)
                ? BoxDecoration(
                    gradient: (dark == false) ? grad1 : grad3,
                    borderRadius: BorderRadius.circular(radius),
                  )
                : BoxDecoration(
                    color: (dark == false) ? kcPrimaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(radius),
                  )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(
                  color: kcPrimaryColor,
                  width: 1,
                )),
        child: !busy
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) leading!,
                  if (leading != null) const SizedBox(width: 5),
                  Text(
                    title,
                    style: bodyStyle.copyWith(
                      fontWeight: !outline ? FontWeight.bold : FontWeight.w400,
                      color: !outline
                          ? (dark == false)
                              ? Colors.white.withOpacity(0.8)
                              : kcPrimaryColor
                          : kcPrimaryColor,
                    ),
                  ),
                ],
              )
            : const CircularProgressIndicator(
                strokeWidth: 8,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
      ),
    );
  }
}
