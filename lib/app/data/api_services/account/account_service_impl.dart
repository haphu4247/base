import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../../base/api_services/base_api_service.dart';
import '../../../flavour/environment.dart';
import 'account_params.dart';

class AccountServiceImpl extends BaseAPIService {
  factory AccountServiceImpl() {
    return AccountServiceImpl();
  }

  final String accountBaseUrl = Environment().config.apiHost;

  @override
  Future<Response> fetchData(dynamic apiEnum,
      {String? appendPath,
      Map? body,
      Map<String, dynamic>? queryParams,
      Map<String, String>? headerParams = const {
        'accept': 'application/json'
      }}) {
    return requestData(
      AccountParams(
          apiEnum: apiEnum,
          baseUrl: accountBaseUrl,
          appendPath: appendPath,
          bodyParams: body,
          headerParams: headerParams,
          queryParams: queryParams),
    );
  }

  @override
  Future<Response> uploadFile(
      dynamic apiEnum, String userId, String accessToken, List<File> body,
      {String? appendPath}) {
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
        appendPath: appendPath,
        apiEnum: apiEnum,
        bodyParams: form,
        headerParams: header));
  }
}
