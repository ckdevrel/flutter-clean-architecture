import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/feed/domain/entities/feed_item.dart';

List<FeedItemModel> feedFromJson(List<dynamic> jsonItem) =>
    List<FeedItemModel>.from(jsonItem.map((x) => FeedItemModel.fromJson(x)));

List feedToJson(List<FeedItemModel> feed) {
  List jsonItems = List();
  feed.map((item) => jsonItems.add(item.toJson())).toList();
  return jsonItems;
}

class FeedItemModel extends FeedItem {
  FeedItemModel(
      {@required int id,
      @required String name,
      @required String imageUrl,
      @required String profileImageUrl,
      @required String description})
      : super(
            id: id,
            name: name,
            imageUrl: imageUrl,
            profileImageUrl: profileImageUrl,
            description: description);

  factory FeedItemModel.fromJson(Map<String, dynamic> json) {
    return FeedItemModel(
        id: json['id'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        profileImageUrl: json['profileImageUrl'],
        description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'profileImageUrl': profileImageUrl,
      'description': description
    };
  }
}
