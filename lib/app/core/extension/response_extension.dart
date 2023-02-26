import 'dart:convert';

import 'package:base/app/core/utils/my_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../base/models/error_response.dart';
import '../../base/models/base_model.dart';
import '../../base/models/base_response.dart';
import '../../global_widgets/app_toast.dart';

extension ResponseExt on Response {
  void checkResultList<R extends BaseResponse<R>>(
      {required R instance,
      required ValueChanged<List<R>> onSuccess,
      ValueChanged<BaseResponse>? onError,
      VoidCallback? onCompleted,
      bool showErrorToast = true,
      bool showSuccessToast = false}) {
    if (isOk) {
      final decodeBody = parseBody();
      final parseResponse = instance.parsedJson(decodeBody);
      if (parseResponse.isSuccess()) {
        final List<R> list =
            List<dynamic>.from(parseResponse.data as Iterable<dynamic>)
                .map((dynamic e) => instance.parsedJson(e))
                .toList();
        onSuccess(list);
      } else {
        _checkError(showErrorToast, onError, errBody: decodeBody);
      }
    } else {
      //check Http status code.
      _checkError(showErrorToast, onError, code: statusCode?.toString());
    }

    if (onCompleted != null) {
      onCompleted();
    }
  }

  void checkResultModel<R extends BaseResponse<R>>(
      {required R instance,
      required ValueChanged<R> onSuccess,
      ValueChanged<ErrorResponse>? onError,
      VoidCallback? onCompleted,
      bool showErrorToast = true,
      bool showSuccessToast = false}) {
    MyLog.d('Response: ${jsonEncode(body)}');
    if (isOk) {
      final decodeBody = parseBody();
      final model = instance.parsedJson(decodeBody);
      if (instance.isSuccess()) {
        onSuccess(model);
      } else {
        _checkError(showErrorToast, onError,
            errBody: decodeBody, resultMessage: model.resultMessage);
      }
    } else {
      //check Http status code.
      _checkError(showErrorToast, onError, code: statusCode?.toString());
    }

    if (onCompleted != null) {
      onCompleted();
    }
  }

  Map? parseBody() {
    Map? decodeBody;
    if (body is Map) {
      decodeBody = body as Map;
    } else {
      if (bodyString != null) {
        decodeBody = jsonDecode(bodyString!) as Map;
      } else {
        decodeBody = body as Map?;
      }
    }
    return decodeBody;
  }

  void _checkError(bool showErrorToast, ValueChanged<ErrorResponse>? onError,
      {Map? errBody, String? code, String? resultMessage, String? resultCode}) {
    final err = ErrorResponse();

    if (errBody != null) {
      err.parsedJson(errBody);
    } else {
      err.resultCode = resultCode;
      err.resultMessage = resultMessage;
    }

    if (onError != null) {
      _showCustomToast(
        true,
        type: ToastType.error,
        mainText: '${err.resultCode}',
        subText: '${err.resultMessage}',
      );
      onError(err);
    }
  }
}

void _showCustomToast(
  bool showToast, {
  required ToastType type,
  String mainText = 'Success',
  String subText = 'Load Data Successfully',
}) {
  if (showToast) {
    MyToast.instance.showToast(type, mainText, subText);
  }
}
