import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart';
import 'base_api_setup.dart';
import 'base_params.dart';
import '../../flavour/environment.dart';

abstract class BaseApiService extends GetConnect {
  BaseApiService._internal();
  factory BaseApiService() {
    return _BaseApiServiceImpl();
  }

  @override
  void onInit() {
    timeout = Duration(seconds: 45);
    // baseUrl = Environment().config.apiHost;
    super.onInit();
  }

  Future<Response> callApi(
    BaseApiSetup apiSetup, {
    String? appendPath,
    dynamic body,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headerParams,
  });

  Future<Response> uploadFile(
    BaseApiSetup apiSetup,
    String userId,
    String accessToken,
    List<File> body, {
    String? appendPath,
  }) {
    throw UnimplementedError();
  }

  Future<Response> _requestData(BaseParams params) async {
    var tempQuery = params.query;
    var fullURL = params.url;
    if (tempQuery != null) {
      fullURL = '${fullURL}?${_encodeQueryParameters(tempQuery)}';
    }
    return await request(
      fullURL,
      params.method.name,
      body: params.body,
      headers: params.headers,
      // query: tempQuery,
    );
  }

  String _encodeQueryParameters(Map params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  String _queryParameters(Map params) {
    return params.entries.map((e) => '${e.key}=${e.value}').join('&');
  }

  Map<String, String> getAuthHeader(String accessToken) {
    return {
      'authorization': 'Bearer $accessToken',
      'accept': 'application/json'
    };
  }
}

class _BaseApiServiceImpl extends BaseApiService {
  _BaseApiServiceImpl() : super._internal();

  final String apiHost = Environment().config.apiHost;

  @override
  Future<Response> callApi(BaseApiSetup apiSetup,
      {String? appendPath,
      dynamic body,
      Map<String, dynamic>? queryParams,
      Map<String, String>? headerParams = const {
        'accept': 'application/json'
      }}) {
    return _requestData(
      BaseParams(
          apiSetup: apiSetup,
          baseUrl: apiHost,
          appendPath: appendPath,
          bodyParams: body,
          headerParams: headerParams,
          queryParams: queryParams),
    );
  }

  @override
  Future<Response> uploadFile(
      BaseApiSetup apiSetup, String userId, String accessToken, List<File> body,
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
    var header = getAuthHeader(accessToken);
    return _requestData(BaseParams(
        baseUrl: apiHost,
        appendPath: appendPath,
        apiSetup: apiSetup,
        bodyParams: form,
        headerParams: header));
  }
}
