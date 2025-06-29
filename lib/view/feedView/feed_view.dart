import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/app_images/App_images.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/RoundTextField.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';
import '../../../../res/custom_widget/alertDialog_widget.dart';
import '../../../../res/helper/sharedHelper.dart';
import '../controller/likeButtonController.dart';
import '../widget/nearByShoop_widget.dart';
import '../widget/recommendedBrandCard_widget.dart';
import '../widget/recommendedCard_widget.dart';
import 'filter_view.dart';

class FeedView extends StatelessWidget {
  FeedView({super.key});

  final controller = Get.put(HeartController());

  final List<Map<String, String>> shopList = [
    {'image': AppImages.addidasShop, 'name': 'Adidas'},
    {'image': AppImages.nike, 'name': 'Nike'},
    {'image': AppImages.zara, 'name': 'Zara'},
    {'image': AppImages.addidasShop, 'name': 'Reebok'},
    {'image': AppImages.nike, 'name': 'Puma'},
    {'image': AppImages.zara, 'name': 'Kelbin'},
    {'image': AppImages.addidasShop, 'name': 'CR7'},
    {'image': AppImages.zara, 'name': 'LM10'},
  ];

  final List<Map<String, String>> recommendedList = [
    {
      'title': 'Discover unique finds at Nordstrom',
      'subtitle': 'Dive in and find your next favorite item!',
      'imagePath': AppImages.CardImage,
    },
    {
      'title': 'Style your summer',
      'subtitle': 'Check out the latest trends!',
      'imagePath': AppImages.CardImage,
    },
    {
      'title': 'Explore new arrivals',
      'subtitle': 'Fresh styles just for you!',
      'imagePath': AppImages.CardImage,
    },
    {
      'title': 'Winter collection unveiled',
      'subtitle': 'Stay warm and stylish!',
      'imagePath': AppImages.CardImage,
    },
    {
      'title': 'Exclusive sportswear deals',
      'subtitle': 'Gear up for your next workout!',
      'imagePath': AppImages.CardImage
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30.r,
                          backgroundImage: AssetImage(AppImages.profileImage),
                        ),
                        widthBox14,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: 'Isha Ahmed',
                              fontSize: 16.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF333333),
                            ),
                            SizedBox(height: 2.h),
                            CustomText(
                              title: 'London, UK',
                              fontSize: 10.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF1E1E1E).withOpacity(0.8),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Obx(() => GestureDetector(
                      onTap: controller.toggleLike,
                      child: Container(
                        height: 30.h,
                        width: 30.h,
                        decoration: BoxDecoration(
                          color: controller.isLiked.value
                              ? AppColors.primaryDeep
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(4.w),
                        child: Image.asset(
                          AppImages.hertIcon,
                          color: controller.isLiked.value
                              ? AppColors.whiteColor
                              : AppColors.primaryDeep,
                        ),
                      ),
                    )),
                  ],
                ),

                heightBox20,

                // Search
                RoundTextField(
                  vertical_padding: 10.h,
                  borderColor: AppColors.primaryDeep,
                  fillColor: AppColors.whiteColor,
                  borderWidth: 1,
                  hint: 'Search',
                  maxLine: 1,
                  borderRadius: 25.r,
                  focusBorderRadius: 25.r,
                  prefixIcon: Icon(Icons.search_outlined, color: Color(0xFF4A4A4A)),
                ),

                heightBox20,

                // Nearby Shops
                CustomText(
                  title: 'Show nearby stores !',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainTextColor,
                ),
                heightBox10,

                SizedBox(
                  height: 90.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: shopList.length,
                    itemBuilder: (context, index) {
                      final shop = shopList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: NearByShopWidget(
                          shopImage: shop['image']!,
                          shopName: shop['name']!,
                        ),
                      );
                    },
                  ),
                ),

                heightBox20,

                // Recommended Horizontal Cards
                CustomText(
                  title: 'Recommended for you',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainTextColor,
                ),

                heightBox10,

                SizedBox(
                  height: 180.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recommendedList.length,
                    itemBuilder: (context, index) {
                      final card = recommendedList[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: RecommendedCardWidget(
                          title: card['title']!,
                          subtitle: card['subtitle']!,
                          imagePath: card['imagePath']!,
                          onTap: () => debugPrint('Tapped card ${index + 1}'),
                        ),
                      );
                    },
                  ),
                ),

                heightBox20,

                // Explore Brands Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      title: 'Explore Unique Brands and Items!',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainTextColor,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(FilterView()),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFAF4EC),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primaryDeep,
                            width: 0.35,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImages.newsFeedIcon,
                            height: 24,
                            width: 24,
                            color: AppColors.primaryDeep,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                heightBox20,

                // Recommended Brand Cards
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: RecommendedBrandCardWidget(

                        onExclamatoryTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) =>
                                CustomCenterDialog(
                                  title: 'What do you want to report?',
                                  subTitle: 'Report Reason',
                                  textFieldHint: 'Type  here...',
                                  buttonText: 'Submit',
                                  onButtonTap: () => Navigator.pop(context),
                                ),
                          );
                        },

                        onShareTap: () {
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
                        onLikeTap: () => print('Like tapped on card $index'),
                        onCouldntFindTap: () => print('Couldn’t Find tapped on card $index'),
                        onBroughtTap: () => print('Brought tapped on card $index'),



                      ),
                    );
                  },
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


