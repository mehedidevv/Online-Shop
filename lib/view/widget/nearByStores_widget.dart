import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../../res/app_colors/App_Colors.dart';
import '../../../res/app_images/App_images.dart';
import '../../../res/custom_style/custom_size.dart';
import '../../../res/custom_widget/custom_text.dart';

class NearByStoresWidget extends StatelessWidget {
  final Callback onTab;
  const NearByStoresWidget({super.key, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: 200.w,
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Store image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                AppImages.nearShopImage,
                height: 100.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            heightBox5,

            // Store Name
            CustomText(
              title: 'Nordstrom',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.appBarTextColor,
            ),

            heightBox5,

            // Rating Row
            Row(
              children: [
                Row(
                  children: List.generate(5, (index) {
                    return Icon(Icons.star, color: AppColors.appBarTextColor, size: 12.sp);
                  }),
                ),
                widthBox10,
                CustomText(
                  title: '5.00',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainTextColor.withOpacity(0.7),
                ),
                widthBox5,
                CustomText(
                  title: '(105)',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainTextColor.withOpacity(0.7),
                ),
              ],
            ),

            heightBox5,

            // Location
            Row(
              children: [
                Image.asset(AppImages.locationIcon, height: 14.h, width: 14.w),
                widthBox5,
                Expanded(
                  child: CustomText(
                    title: 'Way Rockland, ME',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainTextColor.withOpacity(0.7),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            heightBox5,

            // Timing
            Row(
              children: [
                Image.asset(AppImages.timerIcon, height: 14.h, width: 14.w),
                widthBox5,
                Expanded(
                  child: CustomText(
                    title: 'Hours: 9:30 AM - 9:30 PM',
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainTextColor.withOpacity(0.7),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            heightBox5,
          ],
        ),
      ),
    );
  }
}
