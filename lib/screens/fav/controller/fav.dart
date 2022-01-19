import 'dart:convert';

import 'package:get/get.dart';
import 'package:recyclo/models/post.dart';
import 'package:recyclo/models/view_card_model.dart';
import 'package:recyclo/services/firestore_database.dart';
import 'package:recyclo/services/network_handler.dart';

class FavController extends GetxController {
  var viewPosts = <ViewCardModel>[].obs;
  final streamPosts = <PostModel>[].obs;
  NetworkHandler networkHandler = NetworkHandler();
  var response;
  var selectedTag = 'today'.obs;
  var checkImage = true.obs;
  var imageUrl = "".obs;

  var selection = ''.obs;
  var myText =
      'Make good use of an old tire, you just need to follow some simple steps, and your own ottoman will get ready.'
          .obs;
  var showAll = false.obs;

  @override
  void onInit() {
    getPosts();
    streamPosts.bindStream(postStream());
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

  Future<void> checkImageUrl(String url) async {
    checkImage.value = await networkHandler.checkUrl(url);
  }

  Stream<List<PostModel>> postStream() async* {
    await Future.delayed(const Duration(milliseconds: 500));
    List<PostModel> someProduct = await networkHandler.getPosts(
      "/posts",
    );
    yield someProduct;
  }
}
