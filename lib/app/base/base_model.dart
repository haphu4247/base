abstract class BaseModel<T> {
  T parsedJson(dynamic data);

  Map toJson();

  factory BaseModel.fromJson(Map? json) {
    throw UnimplementedError();
  }
}

class BaseErrorModel implements BaseModel<BaseErrorModel> {
  BaseErrorModel({
    required this.messageCode,
    required this.message,
    required this.code,
  });
  String? messageCode;
  String? message;
  int? code;

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'messageCode': messageCode,
      'message': message,
      'code': code,
    };
  }

  @override
  factory BaseErrorModel.fromJson(Map? json) {
    return BaseErrorModel(
      messageCode: json?['messageCode'] as String?,
      message: json?['message'] as String?,
      code: json?['code'] as int?,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  BaseErrorModel parsedJson(dynamic data) {
    return BaseErrorModel.fromJson(data as Map?);
  }
}
