import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/app_colors/App_Colors.dart';
import '../../../res/app_images/App_images.dart';
import '../../../res/custom_style/custom_size.dart';
import '../../../res/custom_widget/custom_text.dart';

class MostPopularCardWidget extends StatelessWidget {
  final String imagePath;
  final String likeCount;
  final String tagText;

  const MostPopularCardWidget({
    super.key,
    required this.imagePath,
    required this.likeCount,
    required this.tagText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.35.sw, // 35% of screen width
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              imagePath,
              height: 120.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          heightBox10,

          // Like + Tag
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomText(
                    title: likeCount,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainTextColor,
                  ),
                  widthBox5,
                  SizedBox(
                    height: 14.h,
                    child: Image.asset(AppImages.redHeart),
                  ),
                ],
              ),
              CustomText(
                title: tagText,
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.mainTextColor.withOpacity(0.5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
