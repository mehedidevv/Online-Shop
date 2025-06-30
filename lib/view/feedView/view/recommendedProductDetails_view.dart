import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_app/res/app_images/App_images.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/res/custom_widget/custom_button.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';
import 'package:shop_app/view/reviewView/view/review_view.dart';

import '../../../res/app_colors/App_Colors.dart';
import '../controller/dialPadLauncher_controller.dart';

class RecommendedProductDetailsView extends StatefulWidget {
   RecommendedProductDetailsView({super.key});

  @override
  State<RecommendedProductDetailsView> createState() => _RecommendedProductDetailsViewState();
}

class _RecommendedProductDetailsViewState extends State<RecommendedProductDetailsView> {
  final List<Color> colorOptions = [
    Colors.black,
    const Color(0xFF617D89),
    AppColors.primaryDeep,
    const Color(0xFFBEA9A9),
    AppColors.appBarTextColor,
    const Color(0xFF151867),
  ];

  int selectedColorIndex = -1;

  // Sizes with multiple selection support
  final List<String> sizeOptions = ['XS', 'S', 'M', 'L', 'XL'];

  Set<int> selectedSizes = {};

  final List<String> imageUrls = [
    AppImages.reviewImg1,
    AppImages.review2,
    AppImages.review3,
    AppImages.review4,
  ];


  final DialController dialController = Get.put(DialController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Product Details',onBackTap: ()=>Navigator.pop(context),),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              width: double.infinity,
              height: 300.h,
              child: Image.asset(AppImages.productDetails,fit: BoxFit.cover,),
            ),

            heightBox20,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      CustomText(
                          title: 'Venesa Long Shirt',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.appBarTextColor
                      ),
                      Row(
                        children: [

                          Container(
                            height: 24.h,
                            width: 24.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFAF4EC),
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.primaryDeep, width: 0.35),
                            ),
                            child: Center(
                              child: Image.asset(
                                AppImages.exclametory,
                                height: 20.h,
                                width: 20.w,
                                color: AppColors.primaryDeep,
                              ),
                            ),
                          ),

                          widthBox10,

                          Container(
                            height: 25.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFAF4EC),
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.primaryDeep, width: 0.35),
                            ),
                            child: Center(
                              child: Image.asset(
                                AppImages.share,
                                height: 16.h,
                                width: 16.w,
                                color: AppColors.primaryDeep,
                              ),
                            ),
                          ),


                        ],
                      )




                    ],
                  ),
                  heightBox5,
                  Row(
                    children: [

                      Icon(Icons.star,color: AppColors.primaryDeep,size: 16.sp,),
                      widthBox5,
                      CustomText(
                        title: '4.5',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.appBarTextColor
                      ),
                      widthBox5,
                      CustomText(
                        title: '( 3.4k )',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainTextColor.withOpacity(0.5)
                      ),
                    ],
                  ),
                  heightBox5,
                  CustomText(
                      title: 'Price',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainTextColor.withOpacity(0.5)
                  ),
                  heightBox5,
                  CustomText(
                      title: '\$320.00',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainTextColor
                  ),

                  heightBox20,
                  CustomText(
                      title: 'Description',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainTextColor.withOpacity(0.7)
                  ),

                  heightBox5,
                  CustomText(
                      title: 'Lorem ipsum dolor sit amet consectetur. Ultrices id feugiat venenatis habitant mattis viverra elementum purus volutpat. Lacus eu molestie pulvinar rhoncus integer proin elementum. Pretium sit fringilla massa tristique aenean commodo leo. Aliquet viverra amet sit porta elementum et pellentesque posuere.',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainTextColor.withOpacity(0.5)
                  ),

                  heightBox20,
                  //Colors
                  CustomText(
                    title: 'Colors',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainTextColor,
                  ),

                  //Colors selector (single selection)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(colorOptions.length, (index) {
                        final isSelected = selectedColorIndex == index;
                        return Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: GestureDetector(
                            onTap: () => setState(() => selectedColorIndex = index),
                            child: Container(
                              width: 50.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: isSelected
                                    ? Border.all(color: AppColors.primaryDeep, width: 1)
                                    : Border.all(color: Colors.transparent, width: 1),
                              ),
                              child: Center(
                                child: Container(
                                  width: 40.w,
                                  height: 40.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colorOptions[index],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  heightBox10,

                  //Sizes
                  CustomText(
                    title: 'Sizes',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mainTextColor,
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

                  //Container For Shop
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12.w),
                    margin: EdgeInsets.only(top: 20.h),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        CustomText(
                            title: 'Shop',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.mainTextColor
                        ),

                        heightBox5,

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            SizedBox(
                              height: 45.w,
                              width: 45.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.asset(
                                  AppImages.zara,
                                  height: 40.h,
                                  width: 40.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),


                            Column(

                              children: [

                                Row(
                                  children: [

                                    CustomText(
                                        title: 'Zara Fashion',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.mainTextColor
                                    ),

                                    widthBox5,

                                    SizedBox(
                                      height: 20.h,
                                      width: 20.w,
                                      child: Image.asset(AppImages.verified)
                                    )

                                  ],
                                ),

                                CustomText(
                                    title: '104 Products   1.5k Followers',
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.mainTextColor.withOpacity(0.7)
                                )


                              ],
                            ),

                            GestureDetector(
                              onTap: () {
                                // Handle call button tap
                                dialController.openDialPad();
                              },
                              child: Container(
                                padding: EdgeInsets.all(5.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  gradient: AppColors.primaryGradient,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      children: [
                                        Icon(Icons.call, color: AppColors.whiteColor,),
                                        widthBox5,
                                        CustomText(
                                            title: 'Call',
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.whiteColor
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )




                          ],
                        )



                      ],
                    ),



                  ),


                  heightBox10,

                  //Review Section
                  GestureDetector(
                    onTap: () =>Get.to(ReviewView()),
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      margin: EdgeInsets.only(top: 20.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 8,
                            offset: Offset(0, 4), // Shadow position
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: 'Reviews & Ratings',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mainTextColor,
                          ),
                          SizedBox(height: 10),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                                width: (imageUrls.length + 1) * 25.0 + 20, // dynamic width
                                child: Stack(
                                  children: [
                                    for (int i = 0; i < imageUrls.length; i++)
                                      Positioned(
                                        left: i * 25.0,
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(imageUrls[i]),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    Positioned(
                                      left: imageUrls.length * 25.0,
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[300],
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '...',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              CustomText(
                                title: '+120 reviews',
                                fontSize: 14,
                                color: Colors.brown,
                                fontWeight: FontWeight.w500,
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.black),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),



                  heightBox20,

                  //Button
                  Row(
                    children: [


                      Expanded(
                        child: Container(
                          height: 45.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.transparent,

                            border: Border.all(
                              color: AppColors.primaryDeep,
                              width: 1,
                            ),
                          ),
                          child: CustomText(
                            title: 'I Couldn’t Find',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.appBarTextColor,
                          ),
                        ),
                      ),

                      widthBox10,

                      Expanded(
                          child: CustomButton(
                            padding_vertical: 13.h,
                              title: 'I Bought it',
                              onTap: (){
                                // Handle call button tap
                              }
                          ),)


                    ],
                  ),




                  heightBox20,



                ],
              ),
            )






          ],
        ),
      )),
    );
  }
}
