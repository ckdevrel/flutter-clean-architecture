import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/core/error/failure.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/feed/domain/entities/feed_item.dart';
import 'package:flutter_clean_architecture/features/feed/domain/repositories/feeds_repository.dart';

class FeedsRepositoryImpl implements FeedsRepository {
  FeedsRepositoryImpl({@required this.remoteDataSource});

  final FeedRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<FeedItem>>> getFeeds() async {
    try {
      final feed = await remoteDataSource.getFeed();
      return Right(feed);
    } catch (e) {
      return Left(APIFailure(message: 'API Error'));
    }
  }
}
