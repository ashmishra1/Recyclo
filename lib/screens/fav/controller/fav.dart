import 'package:get/get.dart';
import 'package:recyclo/models/view_card_model.dart';
import 'package:recyclo/services/firestore_database.dart';

class FavController extends GetxController {
  var viewPosts = <ViewCardModel>[].obs;
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
}
