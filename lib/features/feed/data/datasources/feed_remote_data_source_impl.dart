import 'dart:convert';

import 'package:flutter_clean_architecture/core/error/exception.dart';
import 'package:flutter_clean_architecture/core/http/http_client.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/feed/data/models/feed_item_model.dart';

class FeedRemoteDataSourceImpl implements FeedRemoteDataSource {
  FeedRemoteDataSourceImpl({this.httpClient});

  final HttpClient httpClient;

  @override
  Future<List<FeedItemModel>> getFeed() async {
    final response = await httpClient
        .get('http://www.mocky.io/v2/5da9ee773100006c184e0c8b', headers: {});
    if (response.statusCode == 200) {
      return feedFromJson(json.decode(response.body));
    } else {
      throw APIException();
    }
  }
}
