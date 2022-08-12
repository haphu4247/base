import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../base/api_services/base_response.dart';
import '../../base/base_model.dart';
import '../../components/app_toast.dart';

extension ResponseExt on Response {
  checkResultList<R extends BaseModel<R>>(
      {required R instance,
      required ValueChanged<List<R>> onSuccess,
      ValueChanged<BaseErrorModel>? onError,
      VoidCallback? onCompleted,
      bool showErrorToast = true,
      bool showSuccessToast = false}) {
    if (isOk) {
      var parseResponse = BaseResponse.fromJson(body);
      if (parseResponse.data != null) {
        _showCustomToast(showSuccessToast, type: ToastType.success);
        List<R> lists = List.from(parseResponse.data)
            .map((e) => instance.parsedJson(e))
            .toList();
        onSuccess(lists);
      } else {
        _handleError(showErrorToast, onError,
            errorCode: parseResponse.code,
            message: parseResponse.message,
            messageCode: parseResponse.messageCode);
      }
    } else {
      //check Http status code.
      _handleError(showErrorToast, onError, errorCode: statusCode);
    }

    if (onCompleted != null) {
      onCompleted();
    }
  }

  checkResultModel<R extends BaseModel<R>>(
      {required R instance,
      required ValueChanged<R> onSuccess,
      ValueChanged<BaseErrorModel>? onError,
      VoidCallback? onCompleted,
      bool showErrorToast = true,
      bool showSuccessToast = false}) {
    print('Response: ${jsonEncode(body)}');
    if (isOk) {
      var parseResponse = BaseResponse.fromJson(body);
      if (parseResponse.data != null) {
        _showCustomToast(showSuccessToast, type: ToastType.success);
        R model = instance.parsedJson(parseResponse.data);
        onSuccess(model);
      } else {
        _handleError(showErrorToast, onError,
            errorCode: parseResponse.code,
            message: parseResponse.message,
            messageCode: parseResponse.messageCode);
      }
    } else {
      //check Http status code.
      _handleError(showErrorToast, onError, errorCode: statusCode);
    }

    if (onCompleted != null) {
      onCompleted();
    }
  }

  checkResult(ValueChanged<dynamic> onSuccess,
      {ValueChanged<BaseErrorModel>? onError,
      bool showErrorToast = true,
      bool showSuccessToast = false}) {
    print('Response: ${jsonEncode(body)}');
    if (isOk) {
      var parseResponse = BaseResponse.fromJson(body);
      if (parseResponse.data != null) {
        _showCustomToast(showSuccessToast, type: ToastType.success);

        onSuccess(parseResponse.data);
      } else {
        _handleError(showErrorToast, onError,
            errorCode: parseResponse.code,
            message: parseResponse.message,
            messageCode: parseResponse.messageCode);
      }
    } else {
      //check Http status code.
      _handleError(showErrorToast, onError, errorCode: statusCode);
    }
  }

  checkResultLoginSocial(ValueChanged<dynamic> onSuccess,
      {ValueChanged<BaseErrorModel>? onError,
      bool showErrorToast = true,
      bool showSuccessToast = false}) {
    print('Response: ${jsonEncode(body)}');
    if (isOk) {
      if (body != null) {
        _showCustomToast(showSuccessToast, type: ToastType.success);
        onSuccess(body);
      } else {}
    } else {
      //check Http status code.
      _handleError(showErrorToast, onError, errorCode: statusCode);
    }
  }

  void _handleError(bool showErrorToast, ValueChanged<BaseErrorModel>? onError,
      {int? errorCode, String? message, String? messageCode}) {
    String errText = statusText ?? 'Unknown Error';
    switch (errorCode) {
      //400
      case HttpStatus.badRequest:
        errText = 'Bad Request';
        break;
      //401
      case HttpStatus.unauthorized:
        errText = 'Unauthorized';
        break;
      //500
      case HttpStatus.internalServerError:
        errText = 'Server Error';
        break;
    }
    BaseErrorModel errorModel;
    if (body is String) {
      errorModel = BaseErrorModel(
          code: errorCode, message: body, messageCode: messageCode);
    } else {
      errorModel = BaseErrorModel.fromJson(body);
    }

    if (errorModel.code == null) {
      if (errorCode != null) {
        errorModel.code = errorCode;
      } else {
        errorModel.code = status.code;
      }
    }
    errorModel.messageCode ??= messageCode;
    if (errorModel.message == null) {
      if (message != null) {
        errorModel.message = message;
      } else {
        errorModel.message = errText;
      }
    }

    if (onError != null) {
      onError(errorModel);
    }
    _showCustomToast(showErrorToast,
        type: ToastType.error, mainText: 'Error', subText: errorModel.message!);
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
