import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/app_colors/App_Colors.dart';
import '../../../res/app_images/App_images.dart';
import '../../../res/custom_style/custom_size.dart';
import '../../../res/custom_widget/custom_text.dart';

class RecommendedBrandCardWidget extends StatelessWidget {
  const RecommendedBrandCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
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
      child: IntrinsicHeight( // Makes both sides match vertically
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Section
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                ),
                child: Image.asset(
                  AppImages.CardImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey,
                      child: const Center(child: Text('Image not found')),
                    );
                  },
                ),
              ),
            ),

            // Content Section
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title & Icons Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomText(
                            title: 'Proenza Schouler',
                            fontSize: 14.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            color: AppColors.appBarTextColor,
                          ),
                        ),
                        Row(
                          children: [
                            _circleIcon(AppImages.exclametory),
                            widthBox5,
                            _circleIcon(AppImages.share),
                          ],
                        ),
                      ],
                    ),

                    heightBox5,

                    // Star Rating
                    Row(
                      children: [
                        const Icon(Icons.star, color: Color(0XFFF4B208), size: 16),
                        widthBox5,
                        CustomText(
                          title: '4.5',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryDeep,
                        ),
                      ],
                    ),

                    heightBox5,
                    _infoRow('Description:', 'T-Shirts & Long Pants'),
                    heightBox5,
                    _infoRow('Brand:', 'Proenza Schouler'),
                    heightBox5,
                Row(
                  children: [
                    Expanded(child: _infoRow('Category:', 'Dress')),
                    widthBox10,
                    Expanded(child: _infoRow('Color:', 'Black')),
                  ],),
                    heightBox5,
                    _infoRow('Stores:', 'T J Maxx'),
                    heightBox5,

                    // Size & Price Row
                    Row(
                      children: [
                        Expanded(child: _infoRow('Size:', 'Small')),
                        widthBox10,
                        Expanded(child: _infoRow('Price:', '\$55.55')),
                      ],
                    ),

                    heightBox10,

                    // Bottom Buttons
                    Row(
                      children: [
                        _actionButton('Like'),
                        widthBox5,
                        _actionButton('Couldn’t Find', fontSize: 9.sp),
                        widthBox5,
                        _actionButton('Brought', fontSize: 9.sp),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Circle Icon Widget
  Widget _circleIcon(String assetPath) {
    return GestureDetector(
      onTap: () => print('icon tapped'),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: const Color(0xFFFAF4EC),
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primaryDeep, width: 0.35),
        ),
        child: Center(
          child: Image.asset(
            assetPath,
            height: 24,
            width: 24,
            color: AppColors.primaryDeep,
          ),
        ),
      ),
    );
  }

  // Info Row Widget
  Widget _infoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: label,
          fontSize: 12.sp,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          color: AppColors.mainTextColor,
        ),
        SizedBox(width: 6.w),
        Expanded(
          child: CustomText(
            title: value,
            fontSize: 11.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: AppColors.mainTextColor.withOpacity(0.5),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // Action Button Widget
  Widget _actionButton(String text, {double? fontSize}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: const Color(0xFFD2A56D).withOpacity(0.1),
            border: Border.all(
              color: AppColors.primaryDeep,
              width: 1,
            ),
          ),
          child: Center(
            child: CustomText(
              title: text,
              fontSize: fontSize ?? 10.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.appBarTextColor,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
