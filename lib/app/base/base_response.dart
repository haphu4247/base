import 'package:base/app/base/base_model.dart';

class BaseResponse implements BaseModel<BaseResponse> {
  BaseResponse();

  String? messageCode;
  String? message;
  int? code;
  dynamic data;

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'messageCode': messageCode,
      'message': message,
      'code': code,
      'data': data,
    };
  }

  factory BaseResponse.fromJson(Map? json) {
    final model = BaseResponse();
    model.messageCode = json?['messageCode'] as String?;
    model.message = json?['message'] as String?;
    model.code = json?['code'] as int?;
    model.data = json?['data'];
    return model;
  }

  @override
  BaseResponse parsedJson(dynamic data) {
    return BaseResponse.fromJson(data as Map?);
  }
}
