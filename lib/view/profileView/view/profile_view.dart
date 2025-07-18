import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/res/app_images/App_images.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/view/profileView/view/myListiningView/view/myLikes_view.dart';
import 'package:shop_app/view/profileView/view/myListiningView/view/myRecent_view.dart';
import 'package:shop_app/view/profileView/view/myListiningView/view/mySize_view.dart';
import 'package:shop_app/view/profileView/view/aboutForager_view.dart';
import 'package:shop_app/view/profileView/view/changePassword_view.dart';
import 'package:shop_app/view/profileView/view/myPost_view.dart';
import 'package:shop_app/view/profileView/view/myListiningView/view/myProfile_view.dart';
import 'package:shop_app/view/profileView/view/privacyPolicy_view.dart';
import 'package:shop_app/view/profileView/view/settingsView/view/faq_view.dart';
import 'package:shop_app/view/profileView/view/settingsView/view/rewards_view.dart';
import 'package:shop_app/view/profileView/view/settingsView/view/support_view.dart';
import 'package:shop_app/view/profileView/view/termsAndService_view.dart';
import '../../../res/app_colors/App_Colors.dart';
import '../../../res/custom_style/custom_size.dart';
import '../../../res/custom_widget/alertDialog_widget.dart';
import '../../../res/custom_widget/custom_text.dart';
import '../../../res/helper/sharedHelper.dart';
import '../widget/myProfile_widget.dart';
import '../widget/profile_widget.dart';

class ProfileView extends StatefulWidget {
   ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

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
                                        backgroundImage: _imageFile != null
                                            ? FileImage(_imageFile!)
                                            : AssetImage(AppImages.profileImage) as ImageProvider,
                                      ),
                                    ),
                                    // Edit Icon
                                    Positioned(
                                      bottom: 10,
                                      right: -4,
                                      child: GestureDetector(
                                        onTap: _pickImage,
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 4,
                                                offset: Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: Icon(
                                            Icons.edit,
                                            size: 16,
                                            color: Colors.black,
                                          ),
                                        ),
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

                        heightBox20,

                        // My Listings
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            CustomText(
                              title: 'My Listings',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color:  AppColors.mainTextColor,
                            ),

                            Icon(Icons.arrow_forward_ios,
                              size: 14.sp,
                              color: AppColors.mainTextColor,)
                          ],
                        ),
                        heightBox10,
                        //My Listing List
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomIconTextWidget(
                              imagePath: AppImages.profileIcon,
                              title: 'Profile',
                              onTap: ()=> Get.to(MyProfileView()),
                            ),

                            CustomIconTextWidget(
                              imagePath: AppImages.heartProfile,
                              title: 'Likes',
                              onTap: ()=> Get.to(MyLikesView()),
                            ),


                            CustomIconTextWidget(
                              imagePath: AppImages.sizeIcon,
                              title: 'Size',
                              onTap: ()=> Get.to(MySizeView()),
                            ),


                            CustomIconTextWidget(
                              imagePath: AppImages.visibilityIcon,
                              title: 'Recent Views',
                              onTap: ()=> Get.to(MyRecentView()),
                            ),


                          ],
                        ),



                        heightBox20,
                        //Settings
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            CustomText(
                              title: 'Settings',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color:  AppColors.mainTextColor,
                            ),

                            Icon(Icons.arrow_forward_ios,
                              size: 14.sp,
                              color: AppColors.mainTextColor,)
                          ],
                        ),
                        heightBox10,
                        //Settings List
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomIconTextWidget(
                              imagePath: AppImages.share,
                              title: 'Share',
                              onTap: (){
                                ShareHelper.shareCardData(
                                  title: 'Proenza Schouler',
                                  description: 'T-Shirts & Long Pants',
                                  category: 'Dress',
                                  color: 'Black',
                                  store: 'T J Maxx',
                                  size: 'Small',
                                  price: '\$55.55',
                                  imageAssetPath: AppImages.CardImage,
                                );
                              },
                            ),

                            CustomIconTextWidget(
                              imagePath: AppImages.faq,
                              title: 'FAQ',
                              onTap: ()=> Get.to(FaqView()),
                            ),


                            CustomIconTextWidget(
                              imagePath: AppImages.support,
                              title: 'Support',
                              onTap: ()=> Get.to(SupportView()),
                            ),


                            CustomIconTextWidget(
                              imagePath: AppImages.rewards,
                              title: 'Rewards',
                              onTap: ()=> Get.to(RewardsView()),
                            ),


                          ],
                        ),

                        heightBox30,

                        //My Post
                        CustomProfileRowWidget(
                          imagePath: AppImages.myPost,
                          title: 'My Post',
                          textColor: AppColors.mainTextColor,
                          onTap: () => Get.to(MyPostView())
                        ),


                        //About Forager
                        heightBox20,
                        CustomProfileRowWidget(
                          imagePath: AppImages.About,
                          title: 'About Forager',
                          textColor: AppColors.mainTextColor,
                          onTap: ()=> Get.to(AboutForagerView()),
                        ),


                        //Change Password
                        heightBox20,
                        CustomProfileRowWidget(
                          imagePath: AppImages.lockIcon,
                          title: 'Change Password',
                          textColor: AppColors.mainTextColor,
                          onTap: ()=> Get.to(ChangePasswordView())
                        ),


                        //Terms of Conditions
                        heightBox20,
                        CustomProfileRowWidget(
                          imagePath: AppImages.termsCondition,
                          title: 'Terms of Conditions',
                          textColor: AppColors.mainTextColor,
                          onTap: ()=>Get.to(TermsAndServiceView()),
                        ),


                        //Privacy Policy
                        heightBox20,
                        CustomProfileRowWidget(
                          imagePath: AppImages.privacy,
                          title: 'Privacy Policy',
                          textColor: AppColors.mainTextColor,
                          onTap: ()=>Get.to(PrivacyPolicyView()),
                        ),



                        //Log Out
                        heightBox20,
                        CustomProfileRowWidget(
                          imagePath: AppImages.logout,
                          title: 'Log Out',
                          textColor:Colors.red,
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) =>
                                  CustomCenterDialog(
                                    title: 'Log Out',
                                    subTitle: 'You will be logged out from this device',
                                    buttonText: 'Log Out',
                                    onButtonTap: () => Navigator.pop(context),
                                  ),
                            );
                          },
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



