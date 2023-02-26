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
    final BaseApiService apiClient = BaseApiService();
    Get.lazyPut<BaseApiService>(() => apiClient);
    Get.lazyPut<AccountRepository>(
        () => AccountRepository(apiClient: apiClient));

    Get.lazyPut<LocalRepository>(LocalRepository.new);
  }
}
