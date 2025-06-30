import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/app_colors/App_Colors.dart';
import '../../../res/custom_widget/custom_text.dart';

class IndividualReviewWidget extends StatelessWidget {
  final String profileName;
  final String profileImagePath;
  final int starNumber; // 0 theke 5 moddhe
  final String dateText;
  final String description;

  const IndividualReviewWidget({
    Key? key,
    required this.profileName,
    required this.profileImagePath,
    required this.starNumber,
    required this.dateText,
    required this.description,
  })  : assert(starNumber >= 0 && starNumber <= 5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.mainTextColor.withOpacity(0.5), width: 0.1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.04),
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundImage: Image.asset(profileImagePath).image,
              ),
              SizedBox(width: 14.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: profileName,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainTextColor,
                  ),
                  Row(
                    children: List.generate(5, (index) {
                      if (index < starNumber) {
                        return const Icon(
                          Icons.star,
                          color: Color(0xFFFFBA49),
                          size: 20,
                        );
                      } else {
                        return const Icon(
                          Icons.star_border,
                          color: Color(0xFFFFBA49),
                          size: 20,
                        );
                      }
                    }),
                  ),
                ],
              ),
              Spacer(),
              CustomText(
                title: dateText,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: AppColors.mainTextColor.withOpacity(0.5),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          CustomText(
            title: description,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.mainTextColor.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
