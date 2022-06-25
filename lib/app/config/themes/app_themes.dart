//https://api.flutter.dev/flutter/material/TextTheme-class.html
import 'package:base/app/config/themes/dark_theme.dart';
import 'package:base/app/config/themes/light_theme.dart';
import 'package:base/app/data/local/local_data_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppThemes {
  static final AppThemes instance = AppThemes._internal();
  AppThemes._internal() {
    // initialization logic
  }

  var isLightTheme = true;
  var light = lightTheme;
  var dark = darkTheme;
  Future<ThemeData> loadTheme() async {
    var result = await LocalDataKey.themes.getBool();
    isLightTheme = result ?? true;
    return isLightTheme ? light : dark;
  }

  void switchTheme() async {
    // Call this function to switch ThemeMode
    isLightTheme = !isLightTheme;
    await LocalDataKey.themes.setBool(isLightTheme);
    Get.changeThemeMode(
      isLightTheme ? ThemeMode.light : ThemeMode.dark,
    );
  }
}
