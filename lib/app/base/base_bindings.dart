import 'package:base/app/base/api_client/base_api_service.dart';
import 'package:base/app/data/api_repositories/account/account_repository.dart';
import 'package:get/get.dart';

import '../data/local_repositories/local_repository.dart';

abstract class BaseBindings extends Bindings {
  @override
  void dependencies() => injectService();

  void injectService();
}

class AppBinding extends BaseBindings {
  @override
  void injectService() {
    LocalRepositoryBinding().injectService();
    AccountServiceBinding().injectService();
  }
}

class AccountServiceBinding extends BaseBindings {
  @override
  void injectService() {
    bool isRegistered = Get.isRegistered<AccountRepository>();
    if (!isRegistered) {
      BaseApiService apiClient = Get.find<BaseApiService>();
      Get.lazyPut<AccountRepository>(
          () => AccountRepository(apiClient: apiClient));
    }
  }
}

class LocalRepositoryBinding extends BaseBindings {
  @override
  void injectService() {
    bool isRegistered = Get.isRegistered<LocalRepository>();
    if (!isRegistered) {
      Get.lazyPut<LocalRepository>(() => LocalRepository());
    }
  }
}
