import 'package:get/get.dart';

import '../data/repositories/account/account_usecase.dart';

abstract class BaseBindings extends Bindings {
  @override
  void dependencies() => injectService();

  void injectService();
}

class AppBinding extends BaseBindings {
  @override
  void injectService() {
    AccountBinding().injectService();
  }
}

class AccountBinding extends BaseBindings {
  @override
  void injectService() {
    bool isRegistered = Get.isRegistered<AccountUsecase>();
    if (!isRegistered) {
      Get.lazyPut<AccountUsecase>(() => AccountUsecase());
    }
  }
}
