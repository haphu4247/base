// part 'package:base/app/data/local_repositories/local_data_key/local_data_key.dart';
import 'dart:io' show Directory, Platform;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'db/entities/account_entity.dart';
import 'db/entities/user_role.dart';
import 'local_data_key/local_data_key.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LocalRepository {
  static final LocalRepository _singleton = LocalRepository._internal();
  LocalRepository._internal();
  factory LocalRepository() {
    return _singleton;
  }

  Future initData() async {
    await _initHive();
  }

  Future<bool> clearData() async {
    return await LocalDataKey.clearAll.clear();
  }

  Future<void> _initHive() async {
    if (kIsWeb) {
      return;
    }
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    Hive.init(appDocPath);
    Hive.registerAdapter<AccountEntity>(AccountEntityAdapter());
    Hive.registerAdapter<UserRole>(UserRoleAdapter());
  }

  Future<bool?> firstTimeOpenApp() async {
    return await LocalDataKey.bFirstTimeOpenApp.getBool();
  }

  Future<String?> appLocale() async {
    return await LocalDataKey.sAppLocale.getString();
  }

  Future<bool> setAppLocale(String langCode) async {
    return await LocalDataKey.sAppLocale.setString(langCode);
  }

  Future<ThemeMode> themes() async {
    var result = await LocalDataKey.sThemes.getString();
    if (result != null) {
      return ThemeMode.values.byName(result);
    } else {
      return ThemeMode.light;
    }
  }

  Future<bool> saveTheme(ThemeMode theme) {
    return LocalDataKey.sThemes.setString(theme.name);
  }
}
