import 'package:base/app/base/api_client/base_api_client.dart';
import 'package:get/get.dart';
import 'account_api_setup.dart';

class AccountService<T extends BaseApiClient> {
  AccountService({required T apiClient}) : _apiClient = apiClient;

  final T _apiClient;

  Future<Response> accountInfo(Map body) {
    return _apiClient.fetchData(AccountapiSetup(AccountApi.accountInfo),
        body: body);
  }

  Future<Response> signup(Map body) {
    return _apiClient.fetchData(AccountapiSetup(AccountApi.signup), body: body);
  }

  Future<Response> update(Map body, String accessToken) {
    final header = _apiClient.getAuthHeader(accessToken);
    return _apiClient.fetchData(AccountapiSetup(AccountApi.update),
        body: body, headerParams: header);
  }
}
