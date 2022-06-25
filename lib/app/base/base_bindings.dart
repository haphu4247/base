import 'package:get/get.dart';
import '../data/repositories/account/account_repository.dart';

abstract class BaseBindings extends Bindings {
  @override
  void dependencies() {
    injectService();
  }

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
    bool isRegistered = Get.isRegistered<AccountRepository>();
    if (!isRegistered) {
      Get.lazyPut<AccountRepository>(() => AccountRepository());
    }
  }
}