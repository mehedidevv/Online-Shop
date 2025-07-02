import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../res/app_colors/App_Colors.dart';
import '../../../res/custom_widget/custom_text.dart';

class RecommendedCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onTap;

  const RecommendedCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: 300.w,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: title,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFDFDFD),
                  ),
                  SizedBox(height: 5.h),
                  CustomText(
                    title: subtitle,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFFDFDFD),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 80.w,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.whiteColor,
                      ),
                      child: Center(
                        child: CustomText(
                          title: 'View',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF545454),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity, // Ensure image fills the available space
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey, // Fallback for image loading errors
                    child: const Center(child: Text('Image not found')),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}