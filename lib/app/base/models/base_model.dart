import 'dart:convert';

import 'package:equatable/equatable.dart';

abstract class BaseModel<T> extends Equatable {
  T parsedJson(dynamic json);

  Map toJson();

  @override
  List<Object?> get props => toJson().values.toList();

  @override
  String toString() => jsonEncode(toJson());
}
