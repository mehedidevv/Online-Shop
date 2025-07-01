import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/res/custom_widget/custom_button.dart';
import 'package:shop_app/view/reviewView/view/writeReview_view.dart';
import '../../../res/app_colors/App_Colors.dart';
import '../../../res/app_images/App_images.dart';
import '../../../res/custom_widget/custom_text.dart';
import '../widget/individualReview_widget.dart';
import '../widget/starWithProgressBar_widget.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(text: 'Rating And Review', onBackTap: () => Navigator.pop(context)),
      body: SafeArea(
        child: Stack(
          children: [
            // Scrollable content
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ... baki content (jei content already ase apnar)
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              title: '4.5',
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                              textAlign: TextAlign.center,
                            ),
                            CustomText(
                              title: '23 Ratings',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StarWithProgressBar(progress: 1, numberText: '10', starCount: 5),
                            StarWithProgressBar(progress: 0.6, numberText: '7', starCount: 4),
                            StarWithProgressBar(progress: 0.4, numberText: '5', starCount: 3),
                            StarWithProgressBar(progress: 0.2, numberText: '3', starCount: 2),
                            StarWithProgressBar(progress: 0.10, numberText: '0', starCount: 1),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomText(
                    title: '8 reviews',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainTextColor,
                  ),
                  heightBox10,
                  IndividualReviewWidget(
                    profileName: 'Helene Moore',
                    profileImagePath: AppImages.profileImage,
                    starNumber: 4,
                    dateText: 'June 5, 2019',
                    description:
                    'The dress is great! Very classy and comfortable. It fit perfectly! I\'m 5\'7" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn\'t recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.',
                  ),
                  heightBox10,
                  IndividualReviewWidget(
                    profileName: 'Kate Doe',
                    profileImagePath: AppImages.profileImage,
                    starNumber: 3,
                    dateText: 'April 5, 2024',
                    description:
                    'The dress is great! Very classy and comfortable. It fit perfectly! I\'m 5\'7" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn\'t recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.',
                  ),
                  heightBox10,
                  IndividualReviewWidget(
                    profileName: 'John Doe',
                    profileImagePath: AppImages.profileImage,
                    starNumber: 3,
                    dateText: 'April 5, 2024',
                    description:
                    'The dress is great! Very classy and comfortable. It fit perfectly! I\'m 5\'7" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn\'t recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.',
                  ),
                  heightBox20, // Optional bottom padding so scroll not hide under button
                  SizedBox(height: 80), // Extra space for button
                ],
              ),
            ),

            // Positioned button on bottom right
            Positioned(
              bottom: 20.h,
              right: 16.w,
              child: CustomButton(
                width: 150.w,
                title: 'Write Review',
                onTap: () => Get.to(() => WriteReviewView()),
              ),
            ),


          ],
        ),
      ),
    );
  }
}






