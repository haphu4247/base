import 'package:base/app/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class MyAppButton extends StatelessWidget {
  const MyAppButton({
    Key? key,
    this.onTap,
    this.style,
    this.outline = false,
    this.shape,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    this.btnPadding = const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
    this.textColor,
    this.backgroundColor,
    required this.title,
  }) : super(key: key);

  factory MyAppButton.small({
    required String title,
    Function()? onTap,
  }) {
    return MyAppButton(
      title: title,
      onTap: onTap,
      padding: EdgeInsets.zero,
      btnPadding: EdgeInsets.zero,
    );
  }

  factory MyAppButton.outline({
    required String title,
    Function()? onTap,
    EdgeInsets padding = EdgeInsets.zero,
    EdgeInsets btnPadding = EdgeInsets.zero,
    BorderRadius? shape,
    Color? textColor,
  }) {
    return MyAppButton(
      title: title,
      onTap: onTap,
      padding: padding,
      btnPadding: btnPadding,
      outline: true,
      shape: shape,
      textColor: textColor,
    );
  }

  factory MyAppButton.rectangle({
    required String title,
    Function()? onTap,
    EdgeInsets padding = EdgeInsets.zero,
    EdgeInsets btnPadding = EdgeInsets.zero,
    Color? textColor,
    Color? backgroundColor,
  }) {
    return MyAppButton(
      title: title,
      onTap: onTap,
      padding: padding,
      btnPadding: btnPadding,
      shape: BorderRadius.zero,
      textColor: textColor,
      backgroundColor: backgroundColor,
    );
  }

  final Function()? onTap;
  final String title;
  final EdgeInsets padding;
  final EdgeInsets btnPadding;
  final TextStyle? style;
  final bool outline;
  final BorderRadius? shape;
  final Color? textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    Color? _textColor = textColor;
    _textColor ??= outline
        ? Theme.of(context).primaryColor
        : Theme.of(context).primaryColorLight;

    Color? _backgroundColor = backgroundColor;
    _backgroundColor ??= outline
        ? Theme.of(context).primaryColorLight
        : Theme.of(context).primaryColor;

    final _shape = shape ?? BorderRadius.circular(100);
    return Padding(
      padding: padding,
      child: outline
          ? OutlinedButton(
              onPressed: onTap,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_backgroundColor),
                  padding: MaterialStateProperty.all(btnPadding),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(borderRadius: _shape),
                  ),
                  side:
                      MaterialStateProperty.all(BorderSide(color: _textColor))),
              child: Text(
                title,
                style: style ??
                    Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: _textColor,
                        ),
              ),
            )
          : ElevatedButton(
              onPressed: onTap,
              style: ButtonStyle(
                splashFactory: InkRipple.splashFactory,
                overlayColor: MaterialStateProperty.resolveWith((states) {
                  // if (states.contains(MaterialState.pressed)) {
                  //   return Theme.of(context).primaryColorLight;
                  // }
                  return AppColors.lightGrey;
                }),
                backgroundColor: MaterialStateProperty.all(_backgroundColor),
                padding: MaterialStateProperty.all(
                  btnPadding,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: _shape),
                ),
              ),
              child: Text(
                title,
                style: style ??
                    Theme.of(context).textTheme.headline6?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: _textColor,
                        ),
              ),
            ),
    );
  }
}
