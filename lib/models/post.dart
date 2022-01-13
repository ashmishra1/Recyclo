import 'dart:io';

import 'package:flutter/widgets.dart';

class PostModel {
  final String id;
  final String caption;
  final String tags;
  final String procedure;
  final String price;
  final String photo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  PostModel({
    required this.id,
    required this.caption,
    required this.tags,
    required this.procedure,
    required this.price,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["_id"],
        caption: json["caption"],
        tags: json["tags"],
        procedure: json["procedure"],
        price: json["price"],
        photo: json["photo"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "caption": caption,
        "tags": tags,
        "procedure": procedure,
        "price": price,
        "photo": photo,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
