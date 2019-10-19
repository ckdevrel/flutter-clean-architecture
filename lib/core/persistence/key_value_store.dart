abstract class KeyValueStore {
  Future<void> setString({String value, String key});
  Future<String> getString({String key});
}
