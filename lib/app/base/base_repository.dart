import 'package:get/get.dart';

abstract class BaseRepository extends GetConnect {
  @override
  void onInit() {
    timeout = Duration(seconds: 45);
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
}

enum HTTPMethod { get, post, delete, put, patch }

// extension HTTPMethodString on HTTPMethod {
//   String get string {
//     switch (this) {
//       case HTTPMethod.get:
//         return "get";
//       case HTTPMethod.post:
//         return "post";
//       case HTTPMethod.delete:
//         return "delete";
//       case HTTPMethod.patch:
//         return "patch";
//       case HTTPMethod.put:
//         return "put";
//     }
//   }
// }

abstract class BaseParams {
  String get url;
  HTTPMethod get method;
  dynamic get body;
  Map<String, String>? get headers;
  Map<String, dynamic>? get query;
}
