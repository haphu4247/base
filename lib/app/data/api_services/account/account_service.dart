import 'package:get/get.dart';

import '../../../base/api_services/base_api_service.dart';
import 'account_api_setup.dart';

class AccountService<T extends BaseAPIService> {
  AccountService({required T baseService}) : _baseService = baseService;

  final T _baseService;

  Future<Response> accountInfo(Map body) {
    return _baseService.fetchData(AccountApiSetup(AccountApi.accountInfo),
        body: body);
  }

  Future<Response> signup(Map body) {
    return _baseService.fetchData(AccountApiSetup(AccountApi.signup),
        body: body);
  }

  Future<Response> update(Map body, String accessToken) {
    final header = _baseService.getAuthHeader(accessToken);
    return _baseService.fetchData(AccountApiSetup(AccountApi.update),
        body: body, headerParams: header);
  }
}
