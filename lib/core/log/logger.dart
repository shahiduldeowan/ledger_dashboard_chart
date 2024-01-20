import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

class Logger {
  static LogMode _logMode = LogMode.debug;

  static void init() {
    Logger._logMode = kDebugMode ? LogMode.debug : LogMode.live;
  }

  static void logger({
    String message = 'An error occurred!!!',
    Object? error,
    StackTrace? stackTrace,
    String name = '',
  }) {
    if (_logMode == LogMode.debug) {
      log(
        message,
        error: error,
        stackTrace: stackTrace,
        name: name,
      );
    }
  }

  static void dioLogger({
    DioException? dioError,
    String name = '',
  }) {
    if (_logMode == LogMode.debug) {
      logger(
        message: dioError?.message ?? 'An error occurred!!!',
        name: name,
        error: dioError?.error,
        stackTrace: dioError?.stackTrace,
      );
    }
  }
}

enum LogMode { debug, live }
