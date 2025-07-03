import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/res/app_images/App_images.dart';
import '../../../res/app_colors/App_Colors.dart';
import '../../../res/custom_style/custom_size.dart';
import '../../../res/custom_widget/custom_text.dart';

class SinglePostWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String originalPrice;
  final String discountedPrice;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;

  const SinglePostWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.originalPrice,
    required this.discountedPrice,
    required this.onTapEdit,
    required this.onTapDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: const Color(0xFF000000).withOpacity(0.04),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.04),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            height: 120,
            width: 100,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          widthBox14,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: title,
                  fontSize: 12,
                  color: AppColors.mainTextColor.withOpacity(0.5),
                ),
                heightBox5,
                CustomText(
                  title: subtitle,
                  fontSize: 14,
                  color: AppColors.mainTextColor,
                  fontWeight: FontWeight.w600,
                ),
                heightBox5,
                Row(
                  children: [
                    CustomText(
                      title: originalPrice,
                      fontSize: 14,
                      color: AppColors.mainTextColor.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      lineThrough: true,
                    ),
                    widthBox10,
                    CustomText(
                      title: discountedPrice,
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onTapEdit,
                child: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: Image.asset(AppImages.editIcon),
                ),
              ),
              widthBox10,
              GestureDetector(
                onTap: onTapDelete,
                child: SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: Image.asset(AppImages.deleteIcon),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
