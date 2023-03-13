// part 'package:base/app/data/local_repositories/local_data_key/local_data_key.dart';
import 'dart:io' show Directory, Platform;
import 'package:base/app/base/cached/base_local_data_key_ext.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'db/entities/account_entity.dart';
import 'db/entities/user_role.dart';
import 'local_data_key/local_data_key.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LocalRepository {
  static final LocalRepository _singleton = LocalRepository._internal();
  factory LocalRepository() {
    return _singleton;
  }
  LocalRepository._internal();

  Future initData() {
    return _initHive();
  }

  Future<bool> clearData() {
    return LocalDataKey.clearAll.clear();
  }

  Future<void> _initHive() async {
    if (kIsWeb) {
      return;
    }
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    Hive.init(appDocPath);
    Hive.registerAdapter<AccountEntity>(AccountEntityAdapter());
    Hive.registerAdapter<UserRole>(UserRoleAdapter());
  }

  Future<bool?> firstTimeOpenApp() {
    return LocalDataKey.bFirstTimeOpenApp.getBool();
  }

  Future<String?> appLocale() {
    return LocalDataKey.sAppLocale.getString();
  }

  Future<bool> setAppLocale(String langCode) {
    return LocalDataKey.sAppLocale.setString(langCode);
  }

  Future<ThemeMode> themes() {
    return LocalDataKey.sThemes.getString().then((value) {
      if (value != null) {
        return ThemeMode.values.byName(value);
      } else {
        return ThemeMode.light;
      }
    });
  }

  Future<bool> saveTheme(ThemeMode theme) {
    return LocalDataKey.sThemes.setString(theme.name);
  }
}
