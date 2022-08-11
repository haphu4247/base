import 'package:get/get.dart';

import '../data/services/account/account_service.dart';
import '../data/services/account/account_service_impl.dart';
import 'api_service/base_api_service.dart';

abstract class BaseBindings extends Bindings {
  @override
  void dependencies() => injectService();

  void injectService();
}

class AppBinding extends BaseBindings {
  @override
  void injectService() {
    AccountServiceBinding().injectService();
  }
}

class AccountServiceBinding extends BaseBindings {
  @override
  void injectService() {
    bool isRegistered = Get.isRegistered<AccountService>();
    if (!isRegistered) {
      BaseAPIService baseService = AccountServiceImpl();
      Get.lazyPut<AccountService>(
          () => AccountService(baseService: baseService));
    }
  }
}
