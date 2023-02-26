import 'dart:convert';

import 'package:base/app/core/utils/my_log.dart';
import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../base/models/base_model.dart';

// part of 'package:base/app/data/local_repositories/local_repository.dart';

/**
 * add prefix for specify the data type.
 * b: bool
 * i: int
 * d: double
 * s: String
 * o: Object ==> save as json String
 */
enum LocalDataKey {
  //clear all,
  clearAll,
  sAppLocale,
  bFirstTimeOpenApp,
  sThemes,
}

extension LocalDataKeyExt on LocalDataKey {
  Future<bool> setBool(bool value) async {
    return setString(value.toString());
  }

  Future<bool?> getBool() async {
    var boolValue = await getString();
    if (boolValue != null) {
      return boolValue == 'true';
    }
    return null;
  }

  Future<bool> setInt(int value) async {
    return setString(value.toString());
  }

  Future<int?> getInt() async {
    var intValue = await getString();
    if (intValue != null) {
      return int.tryParse(intValue);
    }
    return null;
  }

  Future<bool> clear() async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.clear();
  }

  Future<bool> saveObj<T extends BaseModel<T>>(T obj) {
    final savedObj = jsonEncode(obj.toJson());
    return setString(savedObj);
  }

  Future<T?> getObj<T extends BaseModel<T>>(T instance) async {
    final source = await getString();
    if (source != null) {
      final dynamic decodeJson = jsonDecode(source);
      // var obj = (T as BaseModel<T>).parsedJson(decodeJson);
      MyLog.d('decodeJson: ${decodeJson.toString()}');
      final obj = instance.parsedJson(decodeJson);
      return obj;
    }
    return null;
  }

  Future<bool> saveListObj<T extends BaseModel<T>>(List<T> obj) async {
    return await setString(jsonEncode(obj));
  }

  Future<List<T>?> getListObj<T extends BaseModel<T>>(T instance) async {
    var source = await getString();
    if (source != null) {
      final List<dynamic> listObj = jsonDecode(source) as List<dynamic>;
      final mapList =
          listObj.map((dynamic e) => instance.parsedJson(e)).toList();
      return mapList;
    }
    return null;
  }

  Future<bool> setString(String value) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(_CryptoHelper.instance.encrypt(name),
        _CryptoHelper.instance.encrypt(value));
  }

  Future<String?> getString() async {
    final _prefs = await SharedPreferences.getInstance();
    final key = name;
    final encryptKey = _CryptoHelper.instance.encrypt(key);
    var value = _prefs.getString(encryptKey);
    if (value != null && value.isNotEmpty) {
      value = _CryptoHelper.instance.decrypt(value);
    }
    MyLog.d('key: $key value:$value');
    return value;
  }
}

class _CryptoHelper {
  final Key key = Key.fromUtf8('ASDFGHJKLASDFGHJ');
  final IV iv = IV.fromLength(16);
  late final Encrypter encrypter;
  // final String _ivKey = "912QWA56CFB3SA3F";

  static final instance = _CryptoHelper();

  _CryptoHelper() {
    encrypter = Encrypter(AES(key));
  }

  String encrypt(String plainText) {
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base16;
  }

  String decrypt(String base16) {
    final decrypted = encrypter.decrypt16(base16, iv: iv);
    return decrypted;
  }
}
