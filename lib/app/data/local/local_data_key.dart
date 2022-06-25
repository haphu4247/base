import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../base/base_model.dart';

enum LocalDataKey {
  //clear all,
  clearAll,
  //string
  appLocale,
  //bool
  firstTimeOpenApp,
  //bool
  themes,
}

extension LocalDataKeyExt on LocalDataKey {
  Future<bool> setBool(bool value) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.setBool(toString(), value);
  }

  Future<bool?> getBool() async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool(toString());
  }

  Future<bool> setString(String value) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(toString(), value);
  }

  Future<String?> getString() async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(toString());
  }

  Future<bool> clear() async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.clear();
  }

  Future<bool> saveObj<T extends BaseModel<T>>(T obj) async {
    var savedObj = jsonEncode(obj.toJson());
    return await setString(savedObj);
  }

  Future<T?> getObj<T extends BaseModel<T>>(T instance) async {
    var source = await getString();
    if (source != null) {
      var decodeJson = jsonDecode(source);
      // var obj = (T as BaseModel<T>).parsedJson(decodeJson);
      print('decodeJson: ${decodeJson.toString()}');
      var obj = instance.parsedJson(decodeJson);
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
      List<dynamic> listObj = jsonDecode(source);
      var mapList = listObj.map((e) => instance.parsedJson(e)).toList();
      return mapList;
    }
    return null;
  }
}
