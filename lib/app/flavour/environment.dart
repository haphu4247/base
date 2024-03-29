import 'package:base/app/data/local_repositories/local_repository.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import '../core/languages/app_languages.dart';
import '../core/themes/app_themes.dart';
import '../routes/app_pages.dart';
import 'base_config.dart';
import 'config_prod.dart';
import 'config_staging.dart';
import 'flavour.dart';

final Environment _singleton = Environment._internal();

class Environment {
  factory Environment() {
    return _singleton;
  }
  Environment._internal();

  late BaseConfig config;

  late Locale selectedLocales;

  late ThemeMode themeMode = ThemeMode.system;

  bool? _firstTimeOpenApp;

  bool isWeb = kIsWeb;
  Future<void> initConfig(Flavour environment) async {
    LocalRepository().initData();

    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    config = BaseConfig(environment);

    selectedLocales = await _loadLocales();

    _firstTimeOpenApp = await LocalRepository().firstTimeOpenApp();

    final AppThemes appTheme = AppThemes.instance;
    themeMode = await appTheme.loadTheme();
  }

  String get initial {
    if (_firstTimeOpenApp == null || _firstTimeOpenApp == false) {
      return Routes.SPLASH;
    }
    return Routes.SPLASH;
  }

  Future<Locale> _loadLocales() async {
    final String? myLocale = await LocalRepository().appLocale();
    return AppLanguages.getLocaleFromLanguage(langCode: myLocale);
  }
}
