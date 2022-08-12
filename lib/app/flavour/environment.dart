import 'dart:io' show Directory, Platform;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../core/languages/app_languages.dart';
import '../core/themes/app_themes.dart';
import '../data/local/db/entities/account_entity.dart';
import '../data/local/db/entities/user_role.dart';
import '../data/local/local_data_key.dart';
import '../routes/app_pages.dart';
import 'base_config.dart';
import 'flavour.dart';
import 'config_prod.dart';
import 'config_staging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Environment {
  static final Environment _singleton = Environment._internal();
  Environment._internal();
  factory Environment() {
    return _singleton;
  }

  late BaseConfig config;

  late Locale selectedLocales;

  late ThemeMode themeMode = ThemeMode.system;

  bool? _firstTimeOpenApp;

  bool isWeb = kIsWeb;
  initConfig(Flavour environment) async {
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    if (!isWeb) {
      await _initHive();
    }
    config = _getConfig(environment);

    selectedLocales = await _loadLocales();

    _firstTimeOpenApp = await LocalDataKey.firstTimeOpenApp.getBool();

    var appTheme = AppThemes.instance;
    themeMode = await appTheme.loadTheme();
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
      return Routes.SPLASH;
    }
    return Routes.SPLASH;
  }

  BaseConfig _getConfig(Flavour environment) {
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
