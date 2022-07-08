import 'package:base/app/config/colors/app_colors.dart';
import 'package:base/app/utils/utils.dart';
import 'package:flutter/material.dart';

class SkillGrade extends StatelessWidget {
  const SkillGrade({
    Key? key,
    required this.title,
    required this.grade,
    this.height = 30,
  }) : super(key: key);
  final double grade;
  final double height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(
            height: Utils.height(context, 4),
          ),
          Container(
            height: 18,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: LinearProgressIndicator(
                value: grade,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                backgroundColor: AppColors.primary85,
              ),
            ),
          )
        ],
      ),
    );
  }
}
