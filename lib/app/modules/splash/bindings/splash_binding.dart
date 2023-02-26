import 'package:get/get.dart';

import '../../../base/base_bindings.dart';
import '../controllers/splash_controller.dart';

class SplashBinding extends BaseBindings {
  @override
  void injectService() {
    Get.put<SplashController>(
      SplashController(),
    );
  }
}
