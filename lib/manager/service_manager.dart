import 'dart:async';

import 'package:recyclo/models/post.dart';
import 'package:recyclo/services/network_handler.dart';

class PostServiceManager {
  final StreamController<int> _postLength = StreamController<int>();
  Stream<int> get postLength => _postLength.stream;

  //service_manager.dart networkHandler = NetworkHandler();

  Stream<List<PostModel>> get postListView async* {}

  PostServiceManager() {
    postListView.listen((list) => _postLength.add(list.length));
  }
}
