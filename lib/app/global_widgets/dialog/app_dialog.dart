import 'package:base/app/core/utils/utils_string.dart';
import 'package:base/app/routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import '../../base/api_client/api_exception.dart';
import '../../core/decoration/my_spacer.dart';
import '../buttons/my_app_button.dart';

enum AppAlertType { error, success, normal }

/// Alert dialog with background image, body, cancel & ok buttons
class AppAlertDialog {
  static void showAPIError(BuildContext context, dynamic e) {
    if (e is APIException) {
      AppAlertDialog.show(
          context: context, body: e.toString(), type: AppAlertType.error);
    } else if (e is String) {
      AppAlertDialog.show(context: context, body: e, type: AppAlertType.error);
    }
  }

  static Future<void> show(
      {required BuildContext context,
      required String body,
      String? title,
      Widget? additionalBody,
      AppAlertType? type = AppAlertType.normal,
      String? accept,
      Function()? acceptAction,
      bool hasCancelButton = false,
      bool dismissable = true,
      String? cancel,
      Function()? cancelAction}) async {
    accept ??= LocaleKeys.common_oke.trs;
    cancel ??= LocaleKeys.common_cancel.trs;
    title ??= LocaleKeys.common_caution.trs;
    return Get.dialog(WillPopScope(
      onWillPop: () async => dismissable,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                spacer15,
                Text(
                  body,
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
                if (additionalBody != null) additionalBody,
                spacer20,
                Row(
                  children: [
                    if (hasCancelButton) ...[
                      Expanded(
                          child: MyAppButton.outline(
                        onTap: () {
                          if (dismissable) {
                            AppNavigation.back();
                          }
                          cancelAction?.call();
                        },
                        title: cancel,
                      )),
                      spacer15
                    ],
                    Expanded(
                      child: MyAppButton.small(
                        onTap: () {
                          if (dismissable) {
                            AppNavigation.back();
                          }
                          acceptAction?.call();
                        },
                        title: accept,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
