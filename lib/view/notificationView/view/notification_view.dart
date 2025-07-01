import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/res/app_images/App_images.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';

import '../../../res/app_colors/App_Colors.dart';
import '../../../res/custom_style/custom_size.dart';
import '../widget/singleNotification_widget.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Notification',),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
              
                  CustomText(
                    title: 'Today',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainTextColor,
                  ),
              
                  heightBox16,
              
                  //Single Notification
                  SingleNotificationWidget(
                    title: '30% Special Discount!',
                    subtitle: 'Special promotion only valid today',
                    imagePath: AppImages.Discount,
                  ),
              
              
                  heightBox20,
                  CustomText(
                    title: 'Yesterday',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainTextColor,
                  ),
              
                  heightBox16,
              
                  //Single Notification
                  SingleNotificationWidget(
                    title: 'Welcome, Your account has been created successfully.',
                    subtitle: 'Your account has been created!',
                    imagePath: AppImages.Wallet,
                  ),
              
                  heightBox10,
                  //Single Notification
                  SingleNotificationWidget(
                    title: 'New Items Available!',
                    subtitle: 'Now you can track orders in real time',
                    imagePath: AppImages.Wallet,
                  ),
              
              
                  heightBox20,
                  CustomText(
                    title: 'December 22, 2024',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainTextColor,
                  ),
              
                  heightBox16,
              
                  //Single Notification
                  SingleNotificationWidget(
                    title: 'Credit Card Connected!',
                    subtitle: 'Credit Card has been linked!',
                    imagePath: AppImages.Discount,
                  ),
              
                  heightBox10,
                  //Single Notification
                  SingleNotificationWidget(
                    title: 'Account Setup Successful!',
                    subtitle: 'Your account has been created!',
                    imagePath: AppImages.Wallet,
                  ),
              
              
                ],
              ),
            ),
          ))
    );
  }
}


