import 'package:flutter/material.dart';

import '../../../res/app_colors/App_Colors.dart';
import '../../../res/custom_style/custom_size.dart';
import '../../../res/custom_widget/custom_text.dart';

class StarWithProgressBar extends StatelessWidget {
  final double progress; // Progress bar value (0.0 to 1.0)
  final String numberText; // Text beside progress bar
  final int starCount; // Number of stars to display
  final double starSize;
  final Color starColor;

  const StarWithProgressBar({
    Key? key,
    required this.progress,
    required this.numberText,
    required this.starCount,
    this.starSize = 20,
    this.starColor = const Color(0XFFFFBA49),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Star Icons
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            starCount,
                (index) => Icon(
              Icons.star,
              color: starColor,
              size: starSize,
            ),
          ),
        ),

        widthBox10,

        // Progress bar
        Stack(
          children: [
            Container(
              width: 120,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Container(
              width: 120 * progress.clamp(0.0, 1.0),
              height: 8,
              decoration: BoxDecoration(
                color: AppColors.appBarTextColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),

        widthBox10,

        // Text
        CustomText(
          title: numberText,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
        ),
      ],
    );
  }
}
