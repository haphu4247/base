import 'dart:io';

import 'package:base/app/base/cached/base_cached_local.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../core/utils/my_log.dart';
import '../../flavour/environment.dart';
import '../models/cached_response_model.dart';
import 'base_api_setup.dart';
import 'base_params.dart';

abstract class BaseApiService extends GetConnect {
  factory BaseApiService() {
    return _BaseApiServiceImpl();
  }
  BaseApiService._internal();

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
  void onInit() {
    timeout = const Duration(seconds: 20);
    super.onInit();
  }

  @override
  Future<Response> callApi(BaseApiSetup apiSetup,
      {String? appendPath,
      dynamic body,
      Map<String, dynamic>? queryParams,
      Map<String, String>? headerParams = const {
        'accept': 'application/json'
      }}) async {
    final cachedType = apiSetup.cachedType;
    if (cachedType != null) {
      final json = await cachedType
          .read(apiSetup.apiName)
          .then((value) => value?.response);
      if (json != null) {
        return json;
      }
    }
    return _requestData(
      BaseParams(
          apiSetup: apiSetup,
          baseUrl: apiHost,
          appendPath: appendPath,
          bodyParams: body,
          headerParams: headerParams,
          queryParams: queryParams),
    ).then((value) {
      if (cachedType != null) {
        cachedType.save(apiSetup.apiName, CachedResponseModel(response: value));
      }
      return value;
    });
  }

  @override
  Future<Response> uploadFile(
      BaseApiSetup apiSetup, String userId, String accessToken, List<File> body,
      {String? appendPath}) {
    final list = body.map(
      (e) => MultipartFile(
        e.readAsBytes(),
        filename: basename(e.path),
      ),
    );
    final map = <String, dynamic>{
      'file': list,
      'userId': userId,
    };
    final form = FormData(map);
    final header = getAuthHeader(accessToken);
    return _requestData(BaseParams(
        baseUrl: apiHost,
        appendPath: appendPath,
        apiSetup: apiSetup,
        bodyParams: form,
        headerParams: header));
  }

  Future<Response> _requestData(BaseParams params) {
    final tempQuery = params.query;
    var fullURL = params.url;
    if (tempQuery != null) {
      fullURL = '$fullURL?${_encodeQueryParameters(tempQuery)}';
    }
    MyLog.d(this, params.toString());
    return request<dynamic>(
      fullURL,
      params.method.name,
      body: params.body,
      headers: params.headers,
      contentType: params.contentType,
    );
  }

  String _encodeQueryParameters(Map params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent('${e.key}')}=${Uri.encodeComponent('${e.value}')}')
        .join('&');
  }

  String _queryParameters(Map params) {
    return params.entries.map((e) => '${e.key}=${e.value}').join('&');
  }
}
