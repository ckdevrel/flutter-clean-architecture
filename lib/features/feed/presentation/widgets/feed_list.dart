import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/feed/domain/entities/feed_item.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/widgets/feed_description.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/widgets/feed_header.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/widgets/feed_image_view.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/widgets/feed_list_item.dart';

class FeedList extends StatelessWidget {

  List<FeedItem> feeds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final feed = feeds[index];
        return FeedListItem(header: FeedHeader(name: feed.name, profileImageUrl: feed.profileImageUrl), stackChildren: <Widget>[
          FeedImageView(url: feed.imageUrl),
          FeedDescription(description: feed.description)
        ],);
      },
      itemCount: feeds.length,
    );
  }

  FeedList({this.feeds});
}
