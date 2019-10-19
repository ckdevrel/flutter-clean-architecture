import 'package:flutter_clean_architecture/features/feed/domain/entities/feed_item.dart';

abstract class FeedLocalDataSource {
  Future<List<FeedItem>> getLastFeed();
  Future<void> saveFeed(List<FeedItem> feed);
}
