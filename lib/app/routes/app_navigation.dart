import 'package:get/route_manager.dart';

class AppNavigation {
  AppNavigation._();
  static const String _tag = 'AppNavigation';

  static void back({bool closeOverlays = false, dynamic result}) {
    Get.back<dynamic>(closeOverlays: closeOverlays, result: result);
  }
}
