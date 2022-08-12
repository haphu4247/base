import '../../../base/api_services/base_api_setup.dart';

enum AccountApi {
  accountInfo,
  signup,
  update,
  remove,
}

class AccountApiSetup extends BaseApiSetup {
  AccountApiSetup(AccountApi apiType) : _apiType = apiType;
  AccountApi _apiType;

  @override
  String getPath(dynamic appendPath) {
    switch (_apiType) {
      case AccountApi.accountInfo:
        return 'api/account';
      case AccountApi.signup:
        return 'api/account/signup';
      case AccountApi.update:
        return 'api/account';
      case AccountApi.remove:
        return 'api/account/$appendPath';
    }
  }

  @override
  HTTPMethod get method {
    switch (_apiType) {
      case AccountApi.accountInfo:
        return HTTPMethod.get;
      case AccountApi.signup:
        return HTTPMethod.post;
      case AccountApi.update:
        return HTTPMethod.post;
      case AccountApi.remove:
        return HTTPMethod.delete;
    }
  }
}
