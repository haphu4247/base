import 'package:base/app/core/utils/my_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/base/base_bindings.dart';
import 'app/core/languages/app_languages.dart';
import 'app/core/themes/app_themes.dart';
import 'app/flavour/environment.dart';
import 'app/flavour/flavour.dart';
import 'app/routes/app_pages.dart';

Future<void> startApp(Flavour flavour) async {
  WidgetsFlutterBinding.ensureInitialized();

  MyLog.d('flavour:${flavour.name}');
  await Environment().initConfig(flavour);
  runApp(App(flavour: flavour));
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.flavour,
  }) : super(key: key);
  final Flavour flavour;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Base Project: ${flavour.name}',
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
    );
  }
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(EnumProperty<Flavour>('flavour', flavour));
  // }
}
