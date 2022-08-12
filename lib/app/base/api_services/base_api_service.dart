import 'dart:io';

import 'package:get/get.dart';

enum HTTPMethod { get, post, delete, put, patch }

abstract class BaseParams {
  String get url;
  HTTPMethod get method;
  dynamic get body;
  Map<String, String>? get headers;
  Map<String, dynamic>? get query;
}

abstract class BaseAPIService extends GetConnect {
  @override
  void onInit() {
    timeout = Duration(seconds: 45);
    // baseUrl = Environment().config.apiHost;
    super.onInit();
  }

  Future<Response> requestData(BaseParams params) async {
    var tempQuery = params.query;
    var temUrl = params.url;
    if (tempQuery != null) {
      temUrl = '${params.url}?${encodeQueryParameters(tempQuery)}';
    }
    return await request(
      temUrl,
      params.method.name,
      body: params.body,
      headers: params.headers,
      query: tempQuery,
    );
  }

  String encodeQueryParameters(Map params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<Response> fetchData(
    dynamic apiEnum, {
    String? appendPath,
    Map? body,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headerParams,
  });

  Future<Response> uploadFile(
    dynamic apiEnum,
    String userId,
    String accessToken,
    List<File> body, {
    String? appendPath,
  }) {
    throw UnimplementedError();
  }
}
