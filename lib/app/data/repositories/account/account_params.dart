import '../../../base/base_repository.dart';
import 'account_api.dart';

class AccountParams extends BaseParams {
  final String baseUrl;
  final AccountApi type;
  final dynamic bodyParams;
  final Map<String, dynamic>? queries;
  final Map<String, String>? header;

  AccountParams({
    required this.type,
    required this.baseUrl,
    this.bodyParams,
    this.queries,
    this.header,
  });

  @override
  get body => bodyParams;

  @override
  Map<String, String>? get headers => header;

  @override
  HTTPMethod get method => type.getMethod();

  @override
  Map<String, dynamic>? get query => type.getQuery();

  @override
  String get url => baseUrl + type.getPath();
}
