import '../../../base/api_services/base_api_service.dart';

enum AccountApi {
  accountInfo,
  signup,
  update,
}

extension AccountApiExt on AccountApi {
  String getPath(String? appendPath) {
    switch (this) {
      case AccountApi.accountInfo:
        return 'api/account';
      case AccountApi.signup:
        return 'api/account/signup';
      case AccountApi.update:
        return 'api/account';
    }
  }

  HTTPMethod get method {
    switch (this) {
      case AccountApi.accountInfo:
        return HTTPMethod.get;
      case AccountApi.signup:
        return HTTPMethod.post;
      case AccountApi.update:
        return HTTPMethod.post;
    }
  }
}
