import '../../core/utils/utils_string.dart';
import 'base_model.dart';

abstract class BaseResponse<E> extends BaseModel<E> {
  // BaseResponse();

  String? isOK;
  String? resultCode;
  String? resultMessage;
  dynamic data;
  String dataKey = '';

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'IsOK': isOK,
      'ResultCode': resultCode,
      'ResultMessage': resultMessage,
      'data': data,
    };
  }

  @override
  E parsedJson(dynamic json) {
    _parseDefaultObject(json);
    return this as E;
  }

  void _parseDefaultObject(dynamic json) {
    isOK = json['IsOK'] as String? ?? UtilsString.parse(json['status']);

    resultCode =
        json['ResultCode'] as String? ?? UtilsString.parse(json['code']);

    resultMessage =
        json['ResultMessage'] as String? ?? UtilsString.parse(json['message']);
    if (dataKey.isEmpty) {
      data = json;
    } else {
      data = json[dataKey];
    }
  }

  bool isSuccess() {
    final msg = resultMessage?.toLowerCase();
    return 'true' == isOK || msg?.contains('success') == true;
  }
}
