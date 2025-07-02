import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../../res/app_colors/App_Colors.dart';
import '../../../res/custom_style/custom_size.dart';
import '../../../res/custom_widget/custom_text.dart';

class CustomIconTextWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final Callback? onTap;

  const CustomIconTextWidget({
    super.key,
    required this.imagePath,
    required this.title, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
              color: const Color(0xFFFAF4EC).withOpacity(0.6),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.appBarTextColor,
                width: 0.35,
              ),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                height: 20.h,
                width: 20.w,
                color: AppColors.primaryDeep,
              ),
            ),
          ),
        ),
        heightBox5,
        CustomText(
          title: title,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.mainTextColor,
        ),
      ],
    );
  }
}
