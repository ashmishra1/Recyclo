import 'package:get/get.dart';
import 'package:recyclo/models/post.dart';
import 'dart:convert';
import 'package:recyclo/models/view_card_model.dart';
import 'package:recyclo/services/firestore_database.dart';
import 'package:recyclo/services/network_handler.dart';

class HomeController extends GetxController {
  final streamPosts = <PostModel>[].obs;
  var selection = ''.obs;
  var myText = ''.obs;
  var showAll = false.obs;
  var checkImage = true.obs;
  NetworkHandler networkHandler = NetworkHandler();

  @override
  Future<void> onInit() async {
    streamPosts.bindStream(postStream());
    super.onInit();
  }

  Stream<List<PostModel>> postStream() async* {
    await Future.delayed(const Duration(milliseconds: 500));
    List<PostModel> someProduct = await networkHandler.getPosts(
      "/posts",
    );
    yield someProduct;
  }

  Future<void> checkImageUrl(String url) async {
    checkImage.value = await networkHandler.checkUrl(url);
  }
}
