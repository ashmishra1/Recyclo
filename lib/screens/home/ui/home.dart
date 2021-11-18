import 'package:flutter/material.dart';
import 'package:recyclo/screens/home/ui/widgets/image_option.dart';
import 'package:recyclo/utils/shared/app_colors.dart';
import 'package:recyclo/utils/shared/ui_helpers.dart';
import 'package:recyclo/utils/widgets/box_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => const ImageOptions(),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const BoxButton(
                title: 'Camera',
              ),
            )),
      ),
    );
  }
}
