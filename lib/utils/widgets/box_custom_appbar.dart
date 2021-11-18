import 'package:flutter/material.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: BoxText.subheading(title),
      backgroundColor: Colors.white,
      elevation: 5.0,
      shadowColor: Colors.black38,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
