import 'package:cloud_firestore/cloud_firestore.dart';

class ViewCardModel {
  String accntId;
  String viewId;
  String description;
  String username;
  String photoUrl;
  String timestamp;
  String avtar;
  bool buy;

  ViewCardModel({
    required this.accntId,
    required this.viewId,
    required this.description,
    required this.username,
    required this.photoUrl,
    required this.timestamp,
    required this.avtar,
    required this.buy,
  });

  static ViewCardModel fromSnapshot(DocumentSnapshot snap) {
    ViewCardModel viewCardModel = ViewCardModel(
      accntId: snap['accntId'],
      viewId: snap['viewId'],
      description: snap['description'],
      username: snap['username'],
      photoUrl: snap['photoUrl'],
      timestamp: snap['timestamp'],
      avtar: snap['avtar'],
      buy: snap['buy'],
    );
    return viewCardModel;
  }
}
