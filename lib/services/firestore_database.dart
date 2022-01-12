import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recyclo/models/view_card_model.dart';

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Stream<List<ViewCardModel>> getPosts() {
    return _firebaseFirestore.collection('posts').snapshots().map(
      (snapshot) {
        return snapshot.docs
            .map((doc) => ViewCardModel.fromSnapshot(doc))
            .toList();
      },
    );
  }
}
