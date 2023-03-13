import 'package:base/app/base/models/base_model.dart';
import 'package:get/get_connect.dart';

import '../cached/base_cached_local.dart';

class CachedResponseModel extends BaseModel<CachedResponseModel> {
  CachedResponseModel({
    this.response,
    this.type = CachedLocalType.withinDay,
  });
  CachedResponseModel.fromJson(dynamic json) {
    if (json == null) {
      return;
    }
    final millisecondsSinceEpoch = json['json'] as int?;
    if (millisecondsSinceEpoch != null) {
      lastSaveDate =
          DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    }

    final statusCode = json['statusCode'] as int?;
    final bodyString = json['bodyString'] as String?;
    if (statusCode != null && bodyString != null) {
      response =
          Response<dynamic>(statusCode: statusCode, bodyString: bodyString);
    }

    final type = json['type'] as String?;
    if (type != null) {
      this.type = CachedLocalType.values.byName(type);
    }
  }

  DateTime lastSaveDate = DateTime.now();
  Response? response;
  late CachedLocalType type;

  @override
  CachedResponseModel parsedJson(dynamic json) {
    return CachedResponseModel.fromJson(json);
  }

  @override
  Map toJson() {
    return <dynamic, dynamic>{
      'statusCode': 200,
      'bodyString': response?.bodyString,
      'lastSaveDate': lastSaveDate.millisecondsSinceEpoch,
      'type': type.name
    };
  }

  bool equalDay(DateTime other) {
    return other.day == lastSaveDate.day &&
        other.month == lastSaveDate.month &&
        other.year == lastSaveDate.year;
  }
}
