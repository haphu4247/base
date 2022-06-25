class BaseResponse {
  String? messageCode;
  String? message;
  int? code;
  dynamic data;

  Map<String, dynamic> toJson() {
    return {
      'messageCode': messageCode,
      'message': message,
      'code': code,
      'data': data,
    };
  }

  BaseResponse.fromJson(Map<String, dynamic>? json) {
    messageCode = json?['messageCode'];
    message = json?['message'];
    code = json?['code'];
    data = json?['data'];
  }
}
