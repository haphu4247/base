import 'package:get/get.dart';

import 'account_api.dart';
import 'account_repository.dart';

class AccountUsecase {
  AccountRepository _repo = AccountRepository();

  Future<Response> accountInfo(Map body) {
    return _repo.fetchData(AccountApi.accountInfo, body: body);
  }

  Future<Response> signup(Map body) {
    return _repo.fetchData(AccountApi.signup, body: body);
  }

  Future<Response> update(Map body) {
    return _repo.fetchData(AccountApi.update, body: body);
  }
}
