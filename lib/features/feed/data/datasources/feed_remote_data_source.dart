import 'package:flutter_clean_architecture/features/feed/domain/entities/feed_item.dart';

abstract class FeedRemoteDataSource {
  Future<List<FeedItem>> getFeed();
}
