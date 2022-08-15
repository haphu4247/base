import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/base/base_bindings.dart';
import 'app/core/languages/app_languages.dart';
import 'app/core/themes/app_themes.dart';
import 'app/flavour/environment.dart';
import 'app/flavour/flavour.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const env = String.fromEnvironment('app_env');
  Flavour flavour;
  if (env == Flavour.staging.name) {
    flavour = Flavour.staging;
  } else {
    flavour = Flavour.production;
  }
  print('env=$env flavour:${flavour.name}');
  await Environment().initConfig(flavour);
  runApp(
    GetMaterialApp(
      title: "My Base Project: ${flavour.name}",
      debugShowCheckedModeBanner: Environment().config.showBanner,
      theme: AppThemes.instance.light,
      darkTheme: AppThemes.instance.dark,
      themeMode: Environment().themeMode,
      locale: Environment().selectedLocales,
      translations: AppLanguages(),
      fallbackLocale: AppLanguages.fallbackLocale,
      supportedLocales: AppLanguages.supportedLocales,
      localizationsDelegates: const [AppLocalizationsDelegate()],
      initialRoute: AppPages.INITIAL,
      initialBinding: AppBinding(),
      getPages: AppPages.routes,
    ),
  );
}
