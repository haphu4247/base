import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import '../../data/local_repositories/local_repository.dart';

class AppLanguages extends Translations {
  static final AppLanguages _instance = AppLanguages._internal();
  factory AppLanguages() {
    return _instance;
  }
  AppLanguages._internal() {
    // initialization logic
  }

  @override
  Map<String, Map<String, String>> get keys => AppTranslation.translations;

  static const supportedLocales = [
    // Default: English, US (en_US)
    Locale('en', 'US'),
    // Vietnamese, Vietnam (vi_VN)
    Locale('vi', 'VN'),
    // Chinese, PRC (zh_CN)
  ];

  static final fallbackLocale = supportedLocales.first;

  // update app language
  static Locale changeLocale(String langCode) {
    final locale = getLocaleFromLanguage(langCode: langCode);
    _saveLastSelectedLanguage(langCode);
    Get.updateLocale(locale);
    return locale;
  }

  static Future<void> _saveLastSelectedLanguage(String langCode) async {
    await LocalRepository().setAppLocale(langCode);
  }

  static Locale getLocaleFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale?.languageCode;
    if (lang != null) {
      for (int i = 0; i < supportedLocales.length; i++) {
        if (lang == supportedLocales[i].languageCode) {
          return supportedLocales[i];
        }
      }
    }

    return Get.locale ?? supportedLocales.first;
  }
}

class AppLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLanguages.supportedLocales.contains(locale);
  }

  @override
  Future<MaterialLocalizations> load(Locale locale) {
    return SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations());
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<MaterialLocalizations> old) {
    return false;
  }
}
