import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/locales.g.dart';
import '../data/local/local_data_key.dart';

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

  static final supportedLocales = [
    // Default: English, US (en_US)
    Locale('en', 'US'),

    // Czech, Czech Republic (cs_CZ)
    Locale('cs', 'CZ'),
    // German, Germany (de_DE)
    Locale('de', 'DE'),
    // Spanish, US (es_US)
    Locale('es', 'US'),
    // French, France (fr_FR)
    Locale('fr', 'FR'),
    // Japanese (ja_JP)
    Locale('ja', 'JP'),
    // Korean (ko_KR)
    Locale('ko', 'KR'),
    // Russian (ru_RU)
    Locale('ru', 'RU'),
    // Thai, Thailand (th_TH)
    Locale('th', 'TH'),
    // Ukrainian, Ukraine (uk_UA)
    Locale('uk', 'UA'),
    // Vietnamese, Vietnam (vi_VN)
    Locale('vi', 'VN'),
    // Chinese, PRC (zh_CN)
    Locale('zh', 'CN'),
    // Chinese, Taiwan (zh_TW)
    Locale('zh', 'TW'),
  ];

  static final fallbackLocale = Locale('en', 'US');

  // update app language
  static Locale changeLocale(String langCode) {
    final locale = getLocaleFromLanguage(langCode: langCode);
    _saveLastSelectedLanguage(langCode);
    Get.updateLocale(locale);
    return locale;
  }

  static void _saveLastSelectedLanguage(String langCode) async {
    await LocalDataKey.appLocale.setString(langCode);
  }

  static Locale getLocaleFromLanguage({String? langCode}) {
    var lang = langCode ?? Get.deviceLocale?.languageCode;
    if (lang != null) {
      for (int i = 0; i < supportedLocales.length; i++) {
        if (lang == supportedLocales[i].languageCode)
          return supportedLocales[i];
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
