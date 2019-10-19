import 'package:flutter_clean_architecture/features/feed/data/models/feed_item_model.dart';

abstract class FeedRemoteDataSource {
  Future<List<FeedItemModel>> getFeed();
}
