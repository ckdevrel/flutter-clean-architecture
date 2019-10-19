import 'package:flutter_clean_architecture/features/feed/data/feed_item_model.dart';
import 'package:flutter_clean_architecture/features/feed/domain/entities/feed_item.dart';

abstract class FeedRemoteDataSource {
  Future<List<FeedItemModel>> getFeed();
}
