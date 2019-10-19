import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/persistence/key_value_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStoreImpl implements KeyValueStore {
  static const FEED = 'FEED';

  KeyValueStoreImpl({@required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Future<String> getString({String key}) {
    return sharedPreferences.get(key);
  }

  @override
  Future<void> setString({String value, String key}) {
    return sharedPreferences.setString(key, value);
  }
}
