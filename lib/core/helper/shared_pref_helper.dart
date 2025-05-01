import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;
  static late FlutterSecureStorage flutterSecureStorage;

  init() async {
    AndroidOptions getAndroidOptions() =>
        const AndroidOptions(encryptedSharedPreferences: true);
    IOSOptions getIOSOptions() =>
        const IOSOptions(accessibility: KeychainAccessibility.first_unlock);
    sharedPreferences = await SharedPreferences.getInstance();
    flutterSecureStorage = FlutterSecureStorage(
      aOptions: getAndroidOptions(),
      iOptions: getIOSOptions(),
    );
  }

  String? getDataString({required String key}) {
    return sharedPreferences.getString(key);
  }

  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    } else {
      throw UnsupportedError('Type ${value.runtimeType} is not supported');
    }
  }
  List<String>? getDataStringList({required String key}) {
  return sharedPreferences.getStringList(key);
}

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  Future<String?> getSecuredData({required String key}) async {
    return await flutterSecureStorage.read(key: key);
  }

  Future<void> saveSecuredData({
    required String key,
    required String value,
  }) async {
    return await flutterSecureStorage.write(key: key, value: value);
  }

  Future<void> deleteSecuredData({required String key}) async {
    return await flutterSecureStorage.delete(key: key);
  }

  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }
}
