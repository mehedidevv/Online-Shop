import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/res/app_images/App_images.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';

import '../widget/kidsCategory_widget.dart';
import '../widget/menCategory_widget.dart';
import '../widget/womenCategory_widget.dart';

class StoreDetailsView extends StatefulWidget {
  const StoreDetailsView({super.key});

  @override
  State<StoreDetailsView> createState() => _StoreDetailsViewState();
}

class _StoreDetailsViewState extends State<StoreDetailsView> {
  int selectedIndex = 0;

  final List<String> tabs = ['Women', 'Men', 'Kids'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Store Details',
        onBackTap: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image + Overlapping Avatar
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Store Image
                  SizedBox(
                    width: double.infinity,
                    height: 200.h,
                    child: Image.asset(AppImages.nearStors, fit: BoxFit.cover),
                  ),

                  // Positioned CircleAvatar
                  Positioned(
                    bottom: -100.r / 2,
                    left: 100.w,
                    child: Container(
                      width: 160.r,
                      height: 160.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryDeep,
                          width: 2.w,
                        ),
                        image: DecorationImage(
                          image: AssetImage(AppImages.nearShopImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 100.r / 2 + 10.h),

              //Main Text Content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CustomText(
                        title: 'Nordstrom',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.appBarTextColor,
                      ),
                    ),

                    heightBox5,

                    // Rating Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star, color: AppColors.appBarTextColor, size: 12.sp);
                          }),
                        ),
                        widthBox10,
                        CustomText(
                          title: '5.00',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mainTextColor.withOpacity(0.7),
                        ),
                        widthBox5,
                        CustomText(
                          title: '(105)',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mainTextColor.withOpacity(0.7),
                        ),
                      ],
                    ),

                    heightBox5,

                    // Location
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.locationIcon, height: 14.h, width: 14.w),
                        widthBox5,
                        CustomText(
                          title: 'Way Rockland, ME',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mainTextColor.withOpacity(0.7),
                        ),
                      ],
                    ),

                    heightBox5,

                    // Timing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.timerIcon, height: 14.h, width: 14.w),
                        widthBox5,
                        CustomText(
                          title: 'Hours: 9:30 AM - 9:30 PM',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mainTextColor.withOpacity(0.7),
                        ),
                      ],
                    ),

                    heightBox20,
                    CustomText(
                      title: 'Show Categories!',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainTextColor,
                    ),

                    heightBox10,

                    // Category Tab Bar
                    Container(
                      padding: EdgeInsets.all(8.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(tabs.length, (index) {
                            final isSelected = selectedIndex == index;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    title: tabs[index],
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? AppColors.mainTextColor
                                        : AppColors.mainTextColor.withOpacity(0.7),
                                  ),
                                  SizedBox(height: 6.h),
                                  Container(
                                    height: 2.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? AppColors.primaryDeep
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(1.r),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),

                    heightBox10,
                    // Show Selected Category Widget
                    IndexedStack(
                      index: selectedIndex,
                      children: [
                        WomenCategoryWidget(),
                         MenCategoryWidget(),
                         KidsCategoryWidget(),
                      ],
                    ),
                  ],
                ),
              )



            ],
          ),
        ),
      ),
    );
  }
}
