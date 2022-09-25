import 'package:base/app/base/api_client/base_api_service.dart';
import 'package:get/get.dart';
import 'account_api_setup.dart';

class AccountRepository<T extends BaseApiService> {
  AccountRepository({required T apiClient}) : _apiClient = apiClient;

  final T _apiClient;

  Future<Response> accountInfo(Map body) {
    return _apiClient.callApi(AccountApiSetup(AccountApi.accountInfo),
        body: body);
  }

  Future<Response> signup(Map body) {
    return _apiClient.callApi(AccountApiSetup(AccountApi.signup), body: body);
  }

  Future<Response> update(Map body, String accessToken) {
    final header = _apiClient.getAuthHeader(accessToken);
    return _apiClient.callApi(AccountApiSetup(AccountApi.update),
        body: body, headerParams: header);
  }

  Future<Response> changeAvatar(Map body) {
    return _apiClient.callApi(AccountApiSetup(AccountApi.changeAvatar),
        body: body);
  }
}
