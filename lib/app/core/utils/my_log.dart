import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class MyLog {
  static final _logger = Logger();

  MyLog._internal();

  static void console(dynamic e) {
    if (kDebugMode && e is String) {
      log(e);
    }
  }

  static void d(dynamic tag, dynamic e) {
    if (kDebugMode) {
      _logger.d('${tag.runtimeType} : $e');
    }
  }

  static void e(
    dynamic tag, {
    dynamic message,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    if (kDebugMode) {
      _logger.e(
        '${tag.runtimeType} : $message',
        error,
        stackTrace,
      );
    }
  }
}
