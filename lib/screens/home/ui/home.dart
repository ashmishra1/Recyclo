import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recyclo/models/post.dart';
import 'package:recyclo/screens/home/controller/home.dart';
import 'package:recyclo/screens/home/ui/widgets/view_card.dart';
import 'package:recyclo/services/network_handler.dart';
import 'package:recyclo/utils/widgets/box_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final NetworkHandler networkHandler = NetworkHandler();

    return Scaffold(
        appBar: AppBar(
          title: const BoxText.headingThree(
            'Recyclo',
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<List>(
              future: networkHandler.getPosts("/posts"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No Posts'),
                    );
                  }
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (ctx, index) => ViewCard(index: index));
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }
}
