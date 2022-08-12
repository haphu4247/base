abstract class BaseModel<T> {
  T parsedJson(dynamic data);

  Map toJson();

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
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

  Map<String, dynamic> toJson() {
    return {
      'messageCode': messageCode,
      'message': message,
      'code': code,
    };
  }

  @override
  factory BaseErrorModel.fromJson(Map json) {
    return BaseErrorModel(
        messageCode: json['messageCode'],
        message: json['message'],
        code: json['code']);
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  BaseErrorModel parsedJson(data) {
    return BaseErrorModel.fromJson(data);
  }
}
