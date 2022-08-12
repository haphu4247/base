import 'package:base/app/base/api_client/base_api_client.dart';
import 'package:get/get.dart';

import '../data/api_services/account/account_service.dart';

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
      BaseApiClient apiClient = Get.find<BaseApiClient>();
      Get.lazyPut<AccountService>(() => AccountService(apiClient: apiClient));
    }
  }
}

class BaseAPIServiceBinding extends BaseBindings {
  @override
  void injectService() {
    bool isRegistered = Get.isRegistered<BaseApiClient>();
    if (!isRegistered) {
      Get.lazyPut<BaseApiClient>(() => BaseApiClient());
    }
  }
}
