import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/error/failure.dart';
import 'package:flutter_clean_architecture/features/feed/domain/entities/feed_item.dart';

abstract class FeedsRepository {
  Future<Either<Failure, List<FeedItem>>> getFeeds();
}