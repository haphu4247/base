import 'package:base/app/config/colors/app_colors.dart';
import 'package:base/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastType { success, removed, error, warning, info, added }

extension ToastTypeExt on ToastType {
  Color getColor() {
    switch (this) {
      case ToastType.success:
      case ToastType.removed:
        return AppColors.oke;
      case ToastType.error:
        return AppColors.failed;
      case ToastType.warning:
        return AppColors.warning;
      case ToastType.info:
      case ToastType.added:
        return AppColors.primary;
    }
  }

  IconData iconData() {
    switch (this) {
      case ToastType.success:
      case ToastType.removed:
        return Icons.celebration;
      case ToastType.error:
        return Icons.error;
      case ToastType.warning:
        return Icons.back_hand;
      case ToastType.info:
      case ToastType.added:
        return Icons.bookmark_added;
    }
  }
}

class MyToast {
  late FToast _fToast;

  static final MyToast instance = MyToast._internal();

  /// Prmary Constructor for FToast
  factory MyToast() {
    return instance;
  }

  /// Take users Context and saves to avariable
  MyToast initToast(BuildContext context) {
    _fToast = FToast();
    _fToast.init(context);
    return instance;
  }

  MyToast._internal();

  void showToast(
    ToastType type,
    String text,
    String subText, {
    VoidCallback? onClose,
  }) {
    _fToast.showToast(
      child: _MyCustomToast(
          onClose: onClose, type: type, text: text, subText: subText),
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 1),
    );
  }
}

class _MyCustomToast extends StatelessWidget {
  _MyCustomToast(
      {Key? key,
      this.onClose,
      required this.type,
      required this.text,
      required this.subText})
      : super(key: key);
  ToastType type;
  String text;
  String subText;
  VoidCallback? onClose;
  @override
  Widget build(BuildContext context) {
    var color = type.getColor();
    return Card(
      elevation: 2.0,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [0.02, 0.02], colors: [color, Colors.white]),
            borderRadius: BorderRadius.all(const Radius.circular(6.0))),
        child: Row(
          children: [
            Padding(
              padding: Utils.paddingHorizontal(context, padding: 20),
              child: Icon(
                type.iconData(),
                color: color,
                size: Utils.width(context, 20),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                padding: Utils.paddingVertical(context, padding: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      textAlign: TextAlign.left,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w700),
                      maxLines: 1,
                    ),
                    Container(
                      width: double.infinity,
                      height: Utils.height(context, 30),
                      child: Text(
                        subText,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: onClose,
                icon: Icon(Icons.close,
                    size: Utils.width(context, 15), color: AppColors.primary))
          ],
        ),
      ),
    );
  }
}
