import 'package:get/get.dart';
import 'package:recyclo/models/post.dart';
import 'dart:convert';
import 'package:recyclo/models/view_card_model.dart';
import 'package:recyclo/services/firestore_database.dart';
import 'package:recyclo/services/network_handler.dart';

class HomeController extends GetxController {
  //List<PostModel>? allPosts;
  var selection = ''.obs;
  var myText =
      'Make good use of an old tire, you just need to follow some simple steps, and your own ottoman will get ready.'
          .obs;
  var showAll = false.obs;
  var response;
  late Future<PostModel> allPosts;
  NetworkHandler networkHandler = NetworkHandler();

  @override
  Future<void> onInit() async {
    super.onInit();
  }
}
