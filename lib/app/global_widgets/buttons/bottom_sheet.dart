import 'package:base/app/global_widgets/buttons/my_back_button.dart';
import 'package:flutter/material.dart';

import '../../core/decoration/my_decoration.dart';

class BottomSheetContent extends StatefulWidget {
  final int height;
  final Widget? children;
  final String title;
  const BottomSheetContent(
      {Key? key, this.height = 0, this.children, this.title = ''})
      : super(key: key);

  @override
  BottomSheetState createState() {
    return BottomSheetState();
  }
}

class BottomSheetState extends State<BottomSheetContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: ((MediaQuery.of(context).size.height - kToolbarHeight) / 2) +
            widget.height,
        decoration: MyDecoration.topRoundedShadow,
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MyBackButton(),
                Text(
                  widget.title,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 30,
                  width: 30,
                )
              ],
            ),
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: widget.children ?? Container()))
        ]));
  }
}
