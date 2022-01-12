import 'dart:io';

import 'package:flutter/widgets.dart';

class PostModel {
  final String caption;
  final String procedure;
  final String price;
  final File? photo;

  PostModel({
    required this.caption,
    required this.procedure,
    required this.price,
    this.photo,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      caption: json['caption'],
      procedure: json['procedure'],
      price: json['price'],
      photo: json['photo'],
    );
  }
  Map<String, dynamic> toJson() => {
        "caption": caption,
        "procedure": procedure,
        "price": price,
        "photo": photo,
      };
}
