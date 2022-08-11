import '../../../base/api_service/base_api_service.dart';
import 'account_api.dart';

class AccountParams extends BaseParams {
  final String? baseUrl;
  final String? appendPath;
  final AccountApi apiEnum;
  final dynamic bodyParams;
  final Map<String, dynamic>? queryParams;
  final Map<String, String>? headerParams;

  AccountParams({
    required this.apiEnum,
    this.baseUrl,
    this.appendPath,
    this.bodyParams,
    this.queryParams,
    this.headerParams,
  });

  @override
  String get url => '$baseUrl${apiEnum.getPath(appendPath)}';

  @override
  HTTPMethod get method => apiEnum.method;

  @override
  get body => bodyParams;

  @override
  Map<String, String>? get headers => headerParams;

  @override
  Map<String, dynamic>? get query => queryParams;
}
