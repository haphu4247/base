import '../../../base/base_repository.dart';
import 'account_api.dart';

class AccountParams extends BaseParams {
  final String baseUrl;
  final AccountApi type;
  final dynamic bodyParams;
  final Map<String, dynamic>? queryParams;
  final Map<String, String>? headerParams;

  AccountParams({
    required this.type,
    required this.baseUrl,
    this.bodyParams,
    this.queryParams,
    this.headerParams,
  });

  @override
  String get url => baseUrl + type.getPath();

  @override
  HTTPMethod get method => type.getMethod();

  @override
  get body => bodyParams;

  @override
  Map<String, String>? get headers => headerParams;

  @override
  Map<String, dynamic>? get query => queryParams;
}
