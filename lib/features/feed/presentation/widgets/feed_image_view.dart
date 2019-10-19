import 'package:flutter/material.dart';

class FeedImageView extends StatelessWidget {
  String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 200,
        child: Image.network(
            url,
            fit: BoxFit.cover));
  }

  FeedImageView({this.url});
}