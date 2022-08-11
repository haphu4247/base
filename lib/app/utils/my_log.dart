import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class MyLog {
  static final _logger = Logger();

  MyLog._internal();

  static d(String string) {
    if (kDebugMode) {
      log(string);
    }
  }

  static e(String string) {
    if (kDebugMode) {
      _logger.e(string);
    }
  }
}
