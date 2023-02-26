import 'package:flutter/material.dart';

import 'debounce_button.dart';

class StepperCounter extends StatelessWidget {
  const StepperCounter({
    Key? key,
    this.counter = 0,
    required this.countChangedHandler,
    this.minCount = 0,
    this.maxCount,
    this.textSize = 48,
    this.iconSize = 28,
    this.color,
  }) : super(key: key);
  final int counter;
  final double textSize;
  final double iconSize;
  final int minCount;
  final int? maxCount;
  final Color? color;
  final Function(int count, bool up) countChangedHandler;

  @override
  Widget build(BuildContext context) {
    final _color = color ?? Theme.of(context).primaryColor;
    final ValueNotifier<int> _count = ValueNotifier(counter);
    return Container(
      height: 48,
      // width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _color),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DeboundcedButton(
            onTap: () {
              if (_count.value > minCount) {
                // _count.value--;
                countChangedHandler(_count.value, false);
              }
            },
            child: Icon(
              Icons.remove,
              size: iconSize,
              color: _color,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _count,
            builder: (context, value, child) => SizedBox(
              width: textSize,
              child: Center(
                child: Text(
                  '${_count.value}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: _color, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          DeboundcedButton(
            child: Icon(
              Icons.add,
              size: iconSize,
              color: _color,
            ),
            onTap: () async {
              if (maxCount != null) {
                if (_count.value < maxCount!) {
                  _count.value++;
                }
              } else {
                // _count.value++;
              }
              countChangedHandler(_count.value, true);
            },
          )
        ],
      ),
    );
  }
}
