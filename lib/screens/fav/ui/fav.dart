import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/screens/home/controller/home.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          title: const BoxText.headingThree(
            'Fav',
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Center(
          child: BoxText.headingOne('Fav'),
        ));
  }
}
