import 'dart:convert';

import 'package:get/get.dart';
import 'package:recyclo/models/post.dart';
import 'package:recyclo/models/view_card_model.dart';
import 'package:recyclo/services/firestore_database.dart';
import 'package:recyclo/services/network_handler.dart';

class FavController extends GetxController {
  var viewPosts = <ViewCardModel>[].obs;
  NetworkHandler networkHandler = NetworkHandler();
  var response;
  var selectedTag = 'today'.obs;

  var selection = ''.obs;
  var myText =
      'Make good use of an old tire, you just need to follow some simple steps, and your own ottoman will get ready.'
          .obs;
  var showAll = false.obs;

  @override
  void onInit() {
    getPosts();
    super.onInit();
  }

  void getPosts() {
    viewPosts.bindStream(FirestoreDB().getPosts());
  }

  Future<List> refreshPage(String tag) async {
    response = await networkHandler.explorePost("/explore", {'tag': tag});
    Map map = jsonDecode(response.body);
    List posts = map["listOfPosts"];
    List<PostModel> allPosts =
        posts.map((json) => PostModel.fromJson(json)).toList();
    return allPosts;
  }
}
