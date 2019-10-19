import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/core/error/exception.dart';
import 'package:flutter_clean_architecture/core/error/failure.dart';
import 'package:flutter_clean_architecture/core/http/network_info.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_local_data_source.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/feed/domain/entities/feed_item.dart';
import 'package:flutter_clean_architecture/features/feed/domain/repositories/feeds_repository.dart';

class FeedsRespositoryImpl implements FeedsRepository {
  FeedsRespositoryImpl(
      {@required this.remoteDataSource,
      @required this.localDataSource,
      @required this.networkInfo});

  final FeedRemoteDataSource remoteDataSource;
  final FeedLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<FeedItem>>> getFeeds() async {
    bool isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      try {
        final lastFeed = await localDataSource.getLastFeed();
        return Right(lastFeed);
      } on CacheException {
        return Left(CacheFailure(message: 'Cache Error'));
      }
    }
    try {
      final feed = await remoteDataSource.getFeed();
      localDataSource.saveFeed(feed);
      return Right(feed);
    } on APIException {
      return Left(APIFailure(message: 'Api Error'));
    }
  }
}
