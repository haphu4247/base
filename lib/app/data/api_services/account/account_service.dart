import 'package:get/get.dart';

import '../../../base/api_services/base_api_service.dart';
import 'account_api.dart';

class AccountService<T extends BaseAPIService> {
  AccountService({required this.baseService});

  final T baseService;

  Future<Response> accountInfo(Map body) {
    return baseService.fetchData(AccountApi.accountInfo, body: body);
  }

  Future<Response> signup(Map body) {
    return baseService.fetchData(AccountApi.signup, body: body);
  }

  Future<Response> update(Map body) {
    return baseService.fetchData(AccountApi.update, body: body);
  }
}
