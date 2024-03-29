import 'package:base/app/core/colors/app_colors.dart';
import 'package:base/app/core/decoration/app_style.dart';
import 'package:base/app/global_widgets/loader/image_loader.dart';
import 'package:flutter/material.dart';

class MyDropdownView extends StatelessWidget {
  const MyDropdownView(
      {Key? key,
      required this.label,
      required this.onPress,
      this.readOnly = true,
      this.hint = 'Vui lòng chọn',
      required this.controller})
      : super(key: key);

  final String? label;
  final String hint;
  final bool readOnly;
  final VoidCallback onPress;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (label != null)
            Positioned(
                height: 17,
                left: 0,
                right: 0,
                child:
                    Text(label!, style: Theme.of(context).textTheme.caption)),
          Positioned(
              height: 44,
              top: 22,
              left: 0,
              right: 0,
              child: TextField(
                  controller: controller,
                  readOnly: readOnly,
                  onTap: onPress,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.primary, width: 1)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.primary, width: 1)),
                    hintText: hint,
                    hintStyle: AppStyles.hintText,
                    labelStyle: const TextStyle(
                        fontSize: 13, color: Colors.redAccent), //label style
                    suffixIcon: IconButton(
                      onPressed: onPress,
                      padding: const EdgeInsets.only(left: 6),
                      constraints: const BoxConstraints(),
                      icon: const ImageLoader(
                        'right-arrow.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}
