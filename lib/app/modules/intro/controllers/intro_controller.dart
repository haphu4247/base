import 'package:base/app/config/themes/app_themes.dart';
import 'package:get/get.dart';

class IntroController extends GetxController {
  //TODO: Implement IntroController

  var appTheme = AppThemes.instance;
  var isLightTheme = Rx(true);
  @override
  void onInit() {
    initData();
    super.onInit();
  }

  initData() async {
    await appTheme.loadTheme();
    isLightTheme.value = appTheme.isLightTheme;
  }

  onChangeTheme() {
    appTheme.switchTheme();
    isLightTheme.value = appTheme.isLightTheme;
  }
}
