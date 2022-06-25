import 'package:get/get.dart';

abstract class BaseRepository extends GetConnect {
  @override
  void onInit() {
    timeout = Duration(seconds: 45);
    super.onInit();
  }

  Future<Response> requestData(BaseParams params) async {
    return await request(
      params.url,
      params.method.string,
      headers: params.headers,
      query: params.query,
      body: params.body,
    );
  }
}

enum HTTPMethod { get, post, delete, put, patch }

extension HTTPMethodString on HTTPMethod {
  String get string {
    switch (this) {
      case HTTPMethod.get:
        return "get";
      case HTTPMethod.post:
        return "post";
      case HTTPMethod.delete:
        return "delete";
      case HTTPMethod.patch:
        return "patch";
      case HTTPMethod.put:
        return "put";
    }
  }
}

abstract class BaseParams {
  String get url;
  HTTPMethod get method;
  Map<String, String>? get headers;
  Map<String, dynamic>? get query;
  dynamic get body;
}
