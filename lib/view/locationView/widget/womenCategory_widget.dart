import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';

import '../../../../../res/app_images/App_images.dart';
import '../../../../../res/custom_widget/custom_text.dart';

import '../../widget/mostPopular_widget.dart';
import '../../widget/nearByShoop_widget.dart';


class WomenCategoryWidget extends StatelessWidget {
   WomenCategoryWidget({super.key});

  final List<Map<String, String>> shopList = [
    {'image': AppImages.clothing, 'name': 'Clothing'},
    {'image': AppImages.accesories, 'name': 'Accessories'},
    {'image': AppImages.shoes, 'name': 'Shoes'},
    {'image': AppImages.hoodies, 'name': 'Hoodies'},
    {'image': AppImages.clothing, 'name': 'Clothing'},
    {'image': AppImages.accesories, 'name': 'Accessories'},
    {'image': AppImages.shoes, 'name': 'Shoes'},
    {'image': AppImages.hoodies, 'name': 'Hoodies'},
  ];

  //Most Popular Item
   final List<Map<String, String>> popularList = [
     {'image': AppImages.mostPopular1, 'likeCount': '1780','tagText': 'New'},
     {'image': AppImages.mostPopular2, 'likeCount': '2000','tagText': 'Hot'},
     {'image': AppImages.mostPopular3, 'likeCount': '1780','tagText': 'New'},
     {'image': AppImages.mostPopular1, 'likeCount': '2000','tagText': 'Hot'},
     {'image': AppImages.mostPopular2, 'likeCount': '1780','tagText': 'New'},
     {'image': AppImages.mostPopular3, 'likeCount': '2000','tagText': 'Hot'},
   ];


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Showing products for Women
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

          //Most Popular
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              CustomText(
                title: 'Most Popular',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.mainTextColor,
              ),



              CustomText(
                title: 'See All',
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.mainTextColor.withOpacity(0.5),
              ),


            ],
          ),


          // Inside your build method or any widget
          SizedBox(
            height: 170.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularList.length,
              itemBuilder: (context, index) {
                final item = popularList[index];
                return Padding(
                  padding: EdgeInsets.only(right: 10.w,bottom: 10),
                  child: MostPopularCardWidget(
                    imagePath: item['image'] ?? '',
                    likeCount: item['likeCount'] ?? '0',
                    tagText: item['tagText'] ?? '',
                  ),
                );
              },
            ),
          ),

          heightBox20

        ],
      ),
    );
  }
}





