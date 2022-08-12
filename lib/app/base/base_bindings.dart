import 'package:get/get.dart';

import '../data/api_services/account/account_service.dart';
import 'api_services/base_api_service.dart';

abstract class BaseBindings extends Bindings {
  @override
  void dependencies() => injectService();

  void injectService();
}

class AppBinding extends BaseBindings {
  @override
  void injectService() {
    BaseAPIServiceBinding().injectService();
    AccountServiceBinding().injectService();
  }
}

class AccountServiceBinding extends BaseBindings {
  @override
  void injectService() {
    bool isRegistered = Get.isRegistered<AccountService>();
    if (!isRegistered) {
      BaseAPIService baseService = Get.find<BaseAPIService>();
      Get.lazyPut<AccountService>(
          () => AccountService(baseService: baseService));
    }
  }
}

class BaseAPIServiceBinding extends BaseBindings {
  @override
  void injectService() {
    bool isRegistered = Get.isRegistered<BaseAPIService>();
    if (!isRegistered) {
      Get.lazyPut<BaseAPIService>(() => BaseAPIService());
    }
  }
}
