import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/app_colors/App_Colors.dart';
import '../../../res/custom_style/custom_size.dart';
import '../../../res/custom_widget/custom_text.dart';

class CustomProfileRowWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color textColor;
  final VoidCallback onTap;

  const CustomProfileRowWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: Image.asset(imagePath),
          ),
          widthBox20,
          CustomText(
            title: title,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 14.sp,
            color: AppColors.mainTextColor,
          ),
        ],
      ),
    );
  }
}
