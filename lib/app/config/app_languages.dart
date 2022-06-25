import 'package:base/app/data/local/local_data_key.dart';
import 'package:base/generated/locales.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    Locale('en', 'US'),
    Locale('ja', 'JP'),
    Locale('ko', 'KR'),
    Locale('vi', 'VN')
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
    var lang = langCode ?? supportedLocales[0].languageCode;
    print('lang code: $lang');
    for (int i = 0; i < supportedLocales.length; i++) {
      if (lang == supportedLocales[i].languageCode) return supportedLocales[i];
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
