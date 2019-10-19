abstract class HttpClient {
  Future<dynamic> get(String url, {Map<String, String> headers});
}
