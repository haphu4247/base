import '../../../base/base_repository.dart';

enum AccountApi {
  //HTTPMethod.get;
  accountInfo,

  //HTTPMethod.post
  signup,
  update,
}

extension AccountApiExt on AccountApi {
  String getPath() {
    switch (this) {
      case AccountApi.accountInfo:
        return 'api/account';
      case AccountApi.signup:
        return 'api/account/signup';
      case AccountApi.update:
        return 'api/account';
    }
  }

  HTTPMethod getMethod() {
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
