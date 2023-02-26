import 'dart:async';

import 'package:flutter/material.dart';

class DeboundcedButton extends StatelessWidget {
  const DeboundcedButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  final Widget child;
  final Function onTap;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> _isEnabled = ValueNotifier<bool>(true);
    Timer? _timer;
    return ValueListenableBuilder<bool>(
      valueListenable: _isEnabled,
      child: child,
      builder: (context, isEnabled, child) => InkWell(
        onTap: () {
          if (isEnabled) {
            _isEnabled.value = false;
            onTap.call();
            _timer = Timer(duration, () {
              _isEnabled.value = true;
              _timer?.cancel();
            });
          }
        },
        child: Container(
          margin: const EdgeInsets.only(right: 8),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: child,
        ),
      ),
    );
  }
}
