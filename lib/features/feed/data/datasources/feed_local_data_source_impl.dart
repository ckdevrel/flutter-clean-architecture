import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/error/exception.dart';
import 'package:flutter_clean_architecture/core/persistence/key_value_store.dart';
import 'package:flutter_clean_architecture/core/persistence/key_value_store_impl.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_local_data_source.dart';
import 'package:flutter_clean_architecture/features/feed/data/models/feed_item_model.dart';
import 'package:flutter_clean_architecture/features/feed/domain/entities/feed_item.dart';

class FeedLocalDataSourceImpl implements FeedLocalDataSource {
  FeedLocalDataSourceImpl({@required this.keyValueStore});
  final KeyValueStore keyValueStore;

  @override
  Future<List<FeedItem>> getLastFeed() async {
    final jsonString =
        await keyValueStore.getString(key: KeyValueStoreImpl.FEED);
    if (jsonString != null) {
      return Future.value(feedFromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> saveFeed(List<FeedItem> feed) {
    return keyValueStore.setString(
      key: KeyValueStoreImpl.FEED,
      value: json.encode(feedToJson(feed)),
    );
  }
}
