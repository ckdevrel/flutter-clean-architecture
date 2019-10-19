import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/http/http_client.dart';
import 'package:http/http.dart' as http;

class HttpClientImpl implements HttpClient {
  HttpClientImpl({@required this.client});
  final http.Client client;

  @override
  Future get(String url, {Map<String, String> headers}) async {
    final response = await client.get(url, headers: headers);
    return response;
  }
}
