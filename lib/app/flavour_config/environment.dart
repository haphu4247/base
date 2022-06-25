import 'dart:io' show Directory, Platform;

import 'package:base/app/config/app_languages.dart';
import 'package:base/app/data/local/db/entities/account_entity.dart';
import 'package:base/app/data/local/db/entities/user_role.dart';
import 'package:base/app/data/local/local_data_key.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../routes/app_pages.dart';
import 'envi_config.dart';
import 'flavour.dart';
import 'prod_config.dart';
import 'staging_config.dart';

class Environment {
  static final Environment _singleton = Environment._internal();
  Environment._internal();
  factory Environment() {
    return _singleton;
  }

  late EnviConfig config;

  late Locale selectedLocales;

  bool? _firstTimeOpenApp;
  initConfig(Flavour environment) async {
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    // if (Platform.isAndroid || Platform.isIOS) {
    //   await _initHive();
    // }

    config = _getConfig(environment);

    selectedLocales = await _loadLocales();

    _firstTimeOpenApp = await LocalDataKey.firstTimeOpenApp.getBool();
  }

  Future<void> _initHive() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    Hive.init(appDocPath);
    Hive.registerAdapter<AccountEntity>(AccountEntityAdapter());
    Hive.registerAdapter<UserRole>(UserRoleAdapter());
  }

  String get initial {
    if (_firstTimeOpenApp == null || _firstTimeOpenApp == false) {
      return Routes.INTRO;
    }
    return Routes.SPLASH;
  }

  EnviConfig _getConfig(Flavour environment) {
    switch (environment) {
      case Flavour.production:
        return ProdConfig();
      case Flavour.dev:
      case Flavour.staging:
        return StagingConfig();
    }
  }

  Future<Locale> _loadLocales() async {
    String? myLocale = await LocalDataKey.appLocale.getString();
    return AppLanguages.getLocaleFromLanguage(langCode: myLocale);
  }
}
