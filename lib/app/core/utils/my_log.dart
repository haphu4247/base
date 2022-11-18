import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class MyLog {
  static final _logger = Logger();

  MyLog._internal();

  static void d(String string) {
    if (kDebugMode) {
      _logger.d(string);
    }
  }

  static void e(String string) {
    if (kDebugMode) {
      _logger.e(string);
    }
  }
}
