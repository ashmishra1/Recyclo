import 'package:get/get.dart';
import 'package:recyclo/models/post.dart';
import 'package:recyclo/services/network_handler.dart';

class AccountController extends GetxController {
  final streamPosts = <PostModel>[].obs;
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
}
