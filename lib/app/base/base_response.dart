import 'package:base/app/base/base_model.dart';

class BaseResponse implements BaseModel<BaseResponse> {
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

  BaseResponse();

  factory BaseResponse.fromJson(Map<String, dynamic>? json) {
    var model = BaseResponse();
    model.messageCode = json?['messageCode'];
    model.message = json?['message'];
    model.code = json?['code'];
    model.data = json?['data'];
    return model;
  }

  @override
  BaseResponse parsedJson(data) {
    return BaseResponse.fromJson(data);
  }
}
