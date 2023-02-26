import 'package:base/app/core/colors/app_colors.dart';
import 'package:base/app/routes/app_navigation.dart';
import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  factory MyBackButton.btnClose({bool closeOverlays = false}) {
    return MyBackButton(
      closeOverlays: closeOverlays,
      btnClose: true,
    );
  }
  const MyBackButton(
      {Key? key, this.closeOverlays = false, this.btnClose = false})
      : super(key: key);
  final bool closeOverlays;
  final bool btnClose;
  @override
  Widget build(BuildContext context) {
    if (btnClose) {
      return CloseButton(
        color: AppColors.white,
        onPressed: () => AppNavigation.back(closeOverlays: closeOverlays),
      );
    }
    return BackButton(
      color: AppColors.white,
      onPressed: () => AppNavigation.back(closeOverlays: closeOverlays),
    );
  }
}
