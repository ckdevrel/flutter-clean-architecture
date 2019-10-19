import 'package:flutter/material.dart';

class FeedHeader extends StatelessWidget {
  String name, profileImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: ListTile(
          title: Text(name, style: TextStyle(color: Colors.white)),
          leading: CircleAvatar(
              child: Image.network(
                  profileImageUrl))),
    );
  }

  FeedHeader({this.name, this.profileImageUrl});
}
