import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/RoundTextField.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';
import '../../../res/app_colors/App_Colors.dart';
import '../../../res/app_images/App_images.dart';
import '../controller/addShop_controller.dart';
import '../controller/imageController.dart';

class AddView extends StatefulWidget {
  AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  final AddShopController controller = Get.put(AddShopController());

  final PhotoPickerContainer imageController = Get.put(PhotoPickerContainer());

  final List<String> options = ['Cancel', 'Listing Details', 'Submit'];

  // Sizes with multiple selection support
  final List<String> sizeOptions = ['XS', 'S', 'M', 'L', 'XL'];

  Set<int> selectedSizes = {};

  //Horizontal Image Picker
  Widget buildImagePickerContainer(int index) {
    return Obx(() {
      final imagePath = imageController.selectedImages[index].value;
      return DottedBorder(
        options: RoundedRectDottedBorderOptions(
          color: AppColors.appBarTextColor,
          strokeWidth: 1,
          dashPattern: [6, 3],
          radius: Radius.circular(8),
        ),
        child: Container(
          height: 140.h,
          width: 100.w,
          child: Stack(
            children: [
              if (imagePath.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    File(imagePath),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () => imageController.pickImage(index),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(text: 'Add Shop'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tab Options Row
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(options.length, (index) {
                        final isSelected = controller.selectedIndex.value == index;
                        return GestureDetector(
                          onTap: () {
                            controller.selectedIndex.value = index;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              gradient: isSelected ? AppColors.primaryGradient : null,
                              color: isSelected ? null : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: isSelected
                                  ? [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ]
                                  : [],
                            ),
                            child: CustomText(
                              title: options[index],
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? AppColors.whiteColor
                                  : AppColors.mainTextColor,
                            ),
                          ),
                        );
                      }),
                    )),
                  ),
                ),
            
                heightBox20,
            
                // Photo & Video Title
                CustomText(
                  title: 'Photo & Video',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainTextColor,
                ),
                heightBox10,
                CustomText(
                  title: 'Select up to 16 photos and 1 video.',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainTextColor.withOpacity(0.6),
                ),
            
                heightBox20,
            
                // Image Picker Row
                SizedBox(
                  height: 150.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageController.selectedImages.length,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    separatorBuilder: (_, __) => SizedBox(width: 20.w),
                    itemBuilder: (context, index) {
                      return buildImagePickerContainer(index);
                    },
                  ),
                ),
            
            
                heightBox20,
            
                // Photo & Video Title
                CustomText(
                  title: 'Store',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainTextColor,
                ),
            
                heightBox20,
                //Store Container
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
            
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
            
                        CircleAvatar(
                          radius: 30.r,
                          backgroundImage: Image.asset(AppImages.zara).image,
                        ),
            
                        widthBox10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
            
                            Row(
                              children: [
            
                                CustomText(
                                  title: 'Zara Fashion',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.mainTextColor,
                                ),
            
                                widthBox5,
            
                                SizedBox(
                                  height: 24.h,
                                  width: 24.w,
                                  child: Image.asset(AppImages.verified),
                                )
            
            
                              ],
                            ),
            
                            CustomText(
                              title: '104 Products   1.5k Followers',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.mainTextColor.withOpacity(0.6),
                            ),
                            heightBox5,
                            CustomText(
                              title: '3 Newbridge Court',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.mainTextColor.withOpacity(0.6),
                            ),
                            heightBox5,
                            CustomText(
                              title: 'Chino Hills, CA 91709, United States',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.mainTextColor.withOpacity(0.6),
                            ),
            
            
            
                          ],
                        ),
            
            
                        Spacer(),
                        CustomText(
                            title: 'Edit',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        )
            
            
                      ],
                    ),
                  ),
            
                ),
            
            
                heightBox20,
                // Specification
                CustomText(
                  title: 'Specification',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainTextColor,
                ),
            
                heightBox20,

                Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
            
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
            
                        Row(
                          children: [
            
                            CustomText(
                              title: 'Category',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainTextColor.withOpacity(0.6),
                            ),
            
                            Spacer(),
            
                            Row(
                              children: [
            
                                CustomText(
                                  title: 'Woman',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.mainTextColor,
                                ),
            
                                widthBox20,
                                CustomText(
                                  title: 'Pants & Jumpsuits',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.mainTextColor,
                                ),
            
                              ],
                            )
            
            
                          ],
                        ),
            
                        heightBox10,
                        Row(
                          children: [
                            CustomText(
                              title: 'Brand   (Optional)',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainTextColor.withOpacity(0.6),
                            ),
                            Spacer(),
                            Expanded(child: RoundTextField(
                              height: 33.h,
                                hint: 'Anthropologie',
            
                            ))
                          ],
                        ),
            
                        heightBox10,
                        Row(
                          children: [
                            CustomText(
                              title: 'Color   (Optional)',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainTextColor.withOpacity(0.6),
                            ),
                            Spacer(),
                            Expanded(child: RoundTextField(
                              height: 33.h,
                              hint: 'Pink',
            
                            ))
                          ],
                        ),
            
                        //Sizes
                        CustomText(
                          title: 'Sizes',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.mainTextColor.withOpacity(0.6),
                        ),
                        heightBox10,
            
                        // Multiple selectable sizes
                        SizedBox(
                          height: 40.w,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: sizeOptions.length,
                            itemBuilder: (context, index) {
                              bool isSelected = selectedSizes.contains(index);
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isSelected) {
                                      selectedSizes.remove(index);
                                    } else {
                                      selectedSizes.add(index);
                                    }
                                  });
                                },
                                child: Container(
                                  width: 40.w,
                                  margin: EdgeInsets.only(right: 8.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: isSelected ? AppColors.primaryDeep : Colors.transparent,
                                    border: Border.all(
                                      color: AppColors.primaryDeep,
                                      width: 1,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: CustomText(
                                    title: sizeOptions[index],
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected
                                        ? AppColors.whiteColor
                                        : AppColors.mainTextColor.withOpacity(0.5),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        heightBox10,

                        heightBox10,
                        Row(
                          children: [
                            CustomText(
                              title: 'Price',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mainTextColor.withOpacity(0.6),
                            ),
                            Spacer(),
                            Expanded(child: RoundTextField(
                              height: 33.h,
                              hint: '\$80.00',

                            ))
                          ],
                        ),


                        heightBox10,
                      ],
                    ),
                  ),
            
            
                ),

                heightBox20,
            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
