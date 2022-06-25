import 'package:base/app/config/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/base/base_bindings.dart';
import 'app/config/app_languages.dart';
import 'app/flavour_config/environment.dart';
import 'app/flavour_config/flavour.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Flavour flavour = Flavour.staging;
  await Environment().initConfig(flavour);

  runApp(
    GetMaterialApp(
      title: "Hello World",
      debugShowCheckedModeBanner: Environment().config.showBanner,
      theme: AppThemes.instance.light,
      darkTheme: AppThemes.instance.dark,
      themeMode: ThemeMode.system,
      locale: Environment().selectedLocales,
      translations: AppLanguages(),
      fallbackLocale: AppLanguages.fallbackLocale,
      supportedLocales: AppLanguages.supportedLocales,
      localizationsDelegates: const [AppLocalizationsDelegate()],
      initialRoute: Environment().initial,
      initialBinding: AppBinding(),
      getPages: AppPages.routes,
    ),
  );
}
