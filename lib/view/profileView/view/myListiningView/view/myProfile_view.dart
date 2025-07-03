import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/res/app_images/App_images.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/res/custom_widget/custom_button.dart';
import 'package:shop_app/view/profileView/view/aboutForager_view.dart';
import 'package:shop_app/view/profileView/view/changePassword_view.dart';
import 'package:shop_app/view/profileView/view/myListiningView/view/editPreofile_view.dart';
import 'package:shop_app/view/profileView/view/myPost_view.dart';
import 'package:shop_app/view/profileView/view/privacyPolicy_view.dart';
import 'package:shop_app/view/profileView/view/termsAndService_view.dart';
import '../../../../../res/app_colors/App_Colors.dart';
import '../../../../../res/custom_style/custom_size.dart';
import '../../../../../res/custom_widget/alertDialog_widget.dart';
import '../../../../../res/custom_widget/custom_text.dart';
import '../../../widget/myProfile_widget.dart';
import '../../../widget/profile_widget.dart';

class MyProfileView extends StatefulWidget {
  MyProfileView({super.key});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SizedBox(
        height: screenHeight,
        child: Stack(
          children: [
            // Header image
            SizedBox(
              height: 350,
              width: double.infinity,
              child: Image.asset(
                AppImages.profileHeader,
                fit: BoxFit.cover,
              ),
            ),
            // ✅ Back Button
            Positioned(
              top: 50,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
            ),

            // Positioned Card
            Positioned(
              top: 230,
              left: 20,
              right: 20,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: AppColors.whiteColor,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  height: 620,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // Profile Image with Edit Icon and Name
                        Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                                width: 100,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    // Circle Avatar
                                    Positioned(
                                      top: -50,
                                      left: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage(AppImages.profileImage) as ImageProvider,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              heightBox10,
                              // Name
                              CustomText(
                                title: 'Anna Sulaiya',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF000000),
                              ),

                            ],
                          ),
                        ),

                        heightBox30,

                        Center(
                          child: CustomButton(
                              title: 'Edit Profile',
                              height: 30.h,
                              width: 120.w,
                              onTap: (){
                                //OnTap
                                Get.to(EditPreofileView());

                              }),
                        ),

                        heightBox30,

                        Row(
                          children: [
                            
                            Icon(
                              Icons.person,
                              color: AppColors.appBarTextColor,
                              size: 24,
                            ),

                            widthBox14,
                            CustomText(
                                title: 'Mehedi Hasan',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainTextColor,
                            )
                            
                            
                          ],
                        ),



                        heightBox20,
                        Row(
                          children: [

                            Icon(
                              Icons.email,
                              color: AppColors.appBarTextColor,
                              size: 24,
                            ),

                            widthBox14,
                            CustomText(
                              title: 'abcexamle@gmail.com',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainTextColor,
                            )


                          ],
                        ),


                        heightBox20,
                        Row(
                          children: [

                            Icon(
                              Icons.call,
                              color: AppColors.appBarTextColor,
                              size: 24,
                            ),

                            widthBox14,
                            CustomText(
                              title: '+44 26537 26347',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainTextColor,
                            )


                          ],
                        ),

                        heightBox20,
                        Row(
                          children: [

                            Icon(
                              Icons.location_on,
                              color: AppColors.appBarTextColor,
                              size: 24,
                            ),

                            widthBox14,
                            CustomText(
                              title: 'United State',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainTextColor,
                            )


                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}



