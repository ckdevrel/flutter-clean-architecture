import 'package:flutter/material.dart';

class FeedDescription extends StatelessWidget {
  String description;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.black54,
        height: 80,
        padding: EdgeInsets.all(16),
        child: Text(
          description,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ));
  }

  FeedDescription({this.description});


}
