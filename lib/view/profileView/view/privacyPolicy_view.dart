import 'package:flutter/material.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';

import '../../../res/app_colors/App_Colors.dart';
import '../../../res/custom_widget/customAppBar_widget.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Privacy Policy', onBackTap: () => Navigator.pop(context)),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12,vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                  CustomText(
                    title: 'Privacy Policy',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainTextColor,
                  ),
                  heightBox5,
                  CustomText(
                    title: 'Forager App, LLC\nEffective Date: June 16, 2025',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: AppColors.mainTextColor.withOpacity(0.5),
                  ),
                  heightBox5,
                  CustomText(
                    title: privacyPolicy,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.mainTextColor.withOpacity(0.5),
                  ),
              
              
                  heightBox20,
              
                  Row(
                    children: [
                      Icon(Icons.arrow_forward,color: AppColors.mainTextColor,size: 24,),
                      widthBox10,
                      CustomText(
                        title: 'Eligibility to Use the Service',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainTextColor,
                      ),
                    ],
                  ),
                  heightBox5,
                  CustomText(
                    title: eligibility,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.mainTextColor.withOpacity(0.5),
                  ),
              
              
              
                  heightBox20,
              
                  Row(
                    children: [
                      Icon(Icons.arrow_forward,color: AppColors.mainTextColor,size: 24,),
                      widthBox10,
                      CustomText(
                        title: 'Information We Collect ',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainTextColor,
                      ),
                    ],
                  ),
                  heightBox5,
                  CustomText(
                    title: information,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.mainTextColor.withOpacity(0.5),
                  ),
              
              
              
                ],
              ),
            ),
          )),
    );
  }



  static String privacyPolicy = "This Privacy Policy outlines how Forager App, LLC (\"we,\" \"us,\" or \"our\") collects, uses, shares, and protects personal information in relation to our mobile and web-based application, Forager (the \"Service\"). By accessing or using our Service, you agree to the collection and use of your information as described in this policy. If you do not agree with our practices, please do not use the Service.";
  static String eligibility ="Our Service is intended for users who are at least 18 years old. By using the Service, you affirm that you are at least 18 and capable of entering into a binding legal agreement. The Forager platform allows for user-generated content, including the uploading of images and descriptions which we do not pre-screen in real-time. Due to the possibility of inappropriate or objectionable content being submitted by users, our Service is not intended for use by minors. ";


  static String information = '''
a. Information You Provide Directly:
- Account registration data such as your name, email address, username, and password
- User profile data including clothing size preferences, profile photo, bio, and social links
- Content you submit, including images, item descriptions, store locations, comments, feedback, and messages
- Communication data, such as your responses to surveys, promotions, or support inquiries

b. Automatically Collected Data:
- Location data (with your permission) for mapping nearby stores and listings
- Device and technical data such as IP address, browser type, device model, OS, mobile carrier, crash reports, and performance metrics
- Usage data including screens viewed, time spent in-app, listings interacted with, likes, and search queries

c. Third-Party Login Data:
- If you use a third-party service (e.g., Google, Apple, Facebook) to log into Forager, we may receive information from that service such as your public profile name and email address
''';


}
