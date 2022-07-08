import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../../base/base_repository.dart';
import '../../../flavour_config/environment.dart';
import 'account_api.dart';
import 'account_params.dart';

abstract class AccountRepository extends BaseRepository {
  factory AccountRepository() {
    return _AccountRepositoryImpl();
  }
  AccountRepository._internal();

  final String accountBaseUrl = Environment().config.apiHost;
  //abstrac class
  Future<Response> fetchData(AccountApi type,
      {Map? body,
      Map<String, dynamic>? queryParams,
      Map<String, String>? headerParams});

  Future<Response> uploadFile(
      String userId, List<File> body, AccountApi type, String accessToken);
}

class _AccountRepositoryImpl extends AccountRepository {
  _AccountRepositoryImpl() : super._internal();

  @override
  Future<Response> fetchData(AccountApi type,
      {Map? body,
      Map<String, dynamic>? queryParams,
      Map<String, String>? headerParams = const {
        'accept': 'application/json'
      }}) {
    return requestData(
      AccountParams(
          baseUrl: accountBaseUrl,
          type: type,
          bodyParams: body,
          headerParams: headerParams,
          queryParams: queryParams),
    );
  }

  @override
  Future<Response> uploadFile(
      String userId, List<File> body, AccountApi type, String accessToken) {
    var list = body.map(
      (e) => MultipartFile(
        e.readAsBytes(),
        filename: basename(e.path),
      ),
    );
    final form = FormData({
      'file': list,
      'userId': userId,
    });
    var header = {
      'authorization': 'Bearer $accessToken',
      'accept': 'application/json'
    };
    return requestData(AccountParams(
        baseUrl: accountBaseUrl,
        type: type,
        bodyParams: form,
        headerParams: header));
  }
}
