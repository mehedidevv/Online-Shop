import 'package:flutter/material.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';

import '../../../../../res/app_colors/App_Colors.dart';
import '../../../../../res/custom_widget/customAppBar_widget.dart';

class TermsAndServiceView extends StatelessWidget {
  const TermsAndServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Terms & Services', onBackTap: () => Navigator.pop(context)),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12,vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CustomText(
                    title: 'Terms & Services',
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
                    title: termsAndServices,
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
                        title: 'Shape \n Eligibility ',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainTextColor,
                      ),
                    ],
                  ),
                  heightBox5,
                  CustomText(
                    title: eligibilityTerms,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.mainTextColor.withOpacity(0.5),
                  ),



                  heightBox20,

                  Row(
                    children: [
                      Icon(Icons.arrow_forward,color: AppColors.mainTextColor,size: 24,),
                      widthBox10,
                      Expanded(
                        child: CustomText(
                          title: 'Information We Collect  We collect the following categories of information:',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.mainTextColor,
                        ),
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



  static String termsAndServices = "Welcome to Forager, a service operated by Forager App, LLC (\"Forager,\" \"we,\" \"our,\" or \"us\"). These Terms of Service (\"Terms\") govern your access to and use of our mobile application, website, and all associated features and content (collectively, the \"Service\"). By creating an account, accessing, or using the Service, you agree to be legally bound by these Terms and our Privacy Policy. If you do not agree with these Terms, please do not use the Service.";

  static String eligibilityTerms = '''
You may use the Service only if you are at least 18 years old, capable of forming a binding contract with Forager App, LLC, and not barred from using the Service under applicable law. The Service is not intended for use by minors. By using the Service, you represent and warrant that you meet all eligibility requirements.
''';


  static String information = '''
a. Information You Provide Directly: 
Account registration data such as your name, email address, username, and password 
User profile data including clothing size preferences, profile photo, bio, and social links 
Content you submit, including images, item descriptions, store locations, comments, feedback, and messages 
Communication data, such as your responses to surveys, promotions, or support inquiries 
b. Automatically Collected Data: 
Location data (with your permission) for mapping nearby stores and listings 
Device and technical data such as IP address, browser type, device model, OS, mobile carrier, crash reports, and performance metrics 
Usage data including screens viewed, time spent in-app, listings interacted with, likes, and search queries 
c. Third-Party Login Data: 
If you use a third-party service (e.g., Google, Apple, Facebook) to log into Forager, we may receive information from that service such as your public profile name and email address 
''';


}
