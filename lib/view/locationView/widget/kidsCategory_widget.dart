import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';

import '../../../../../res/app_images/App_images.dart';
import '../../../../../res/custom_widget/custom_text.dart';

import '../../widget/animatedProduct_widget.dart';
import '../../widget/mostPopular_widget.dart';
import '../../widget/nearByShoop_widget.dart';
import '../../widget/newProduct_widget.dart';
import '../../widget/summerProduct_widget.dart';


class KidsCategoryWidget extends StatelessWidget {
  KidsCategoryWidget({super.key});

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


  final List<Map<String, dynamic>> summerProducts = [
    {
      'imagePath': AppImages.product,
      'brandName': 'Nike',
      'productName': 'Air Zoom Pegasus',
      'price': '\$120',
      'discountPrice': '\$90',
      'rating': 4.5,
      'ratingCount': 25,
    },
    {
      'imagePath': AppImages.summerProduct,
      'brandName': 'Adidas',
      'productName': 'Ultraboost 22',
      'price': '\$150',
      'discountPrice': '\$110',
      'rating': 4.8,
      'ratingCount': 30,
    },
    {
      'imagePath': AppImages.summer2,
      'brandName': 'Puma',
      'productName': 'Velocity Nitro',
      'price': '\$100',
      'discountPrice': '\$75',
      'rating': 4.2,
      'ratingCount': 18,
    },
    {
      'imagePath': AppImages.product,
      'brandName': 'Nike',
      'productName': 'Air Zoom Pegasus',
      'price': '\$120',
      'discountPrice': '\$90',
      'rating': 4.5,
      'ratingCount': 25,
    },
    {
      'imagePath': AppImages.summerProduct,
      'brandName': 'Adidas',
      'productName': 'Ultraboost 22',
      'price': '\$150',
      'discountPrice': '\$110',
      'rating': 4.8,
      'ratingCount': 30,
    },
    {
      'imagePath': AppImages.summer2,
      'brandName': 'Puma',
      'productName': 'Velocity Nitro',
      'price': '\$100',
      'discountPrice': '\$75',
      'rating': 4.2,
      'ratingCount': 18,
    },
  ];

  final List<Map<String, dynamic>> newProducts = [
    {
      'imagePath': AppImages.summer2,
      'brandName': 'Nike',
      'productName': 'Air Zoom Pegasus',
      'price': '\$120',
      'discountPrice': '\$90',
      'rating': 4.5,
      'ratingCount': 25,
    },
    {
      'imagePath': AppImages.product,
      'brandName': 'Adidas',
      'productName': 'Ultraboost 22',
      'price': '\$150',
      'discountPrice': '\$110',
      'rating': 4.8,
      'ratingCount': 30,
    },
    {
      'imagePath': AppImages.summerProduct,
      'brandName': 'Puma',
      'productName': 'Velocity Nitro',
      'price': '\$100',
      'discountPrice': '\$75',
      'rating': 4.2,
      'ratingCount': 18,
    },
    {
      'imagePath': AppImages.product,
      'brandName': 'Nike',
      'productName': 'Air Zoom Pegasus',
      'price': '\$120',
      'discountPrice': '\$90',
      'rating': 4.5,
      'ratingCount': 25,
    },
    {
      'imagePath': AppImages.summerProduct,
      'brandName': 'Adidas',
      'productName': 'Ultraboost 22',
      'price': '\$150',
      'discountPrice': '\$110',
      'rating': 4.8,
      'ratingCount': 30,
    },
    {
      'imagePath': AppImages.summer2,
      'brandName': 'Puma',
      'productName': 'Velocity Nitro',
      'price': '\$100',
      'discountPrice': '\$75',
      'rating': 4.2,
      'ratingCount': 18,
    },
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
                return AnimatedProductItem(
                  index: index,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: NearByShopWidget(
                      shopImage: shop['image']!,
                      shopName: shop['name']!,
                    ),
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
          // Most Popular Item
          SizedBox(
            height: 170.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularList.length,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              itemBuilder: (context, index) {
                final item = popularList[index];
                return AnimatedProductItem(
                  index: index,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w, bottom: 10),
                    child: MostPopularCardWidget(
                      imagePath: item['image'] ?? '',
                      likeCount: item['likeCount'] ?? '0',
                      tagText: item['tagText'] ?? '',
                    ),
                  ),
                );
              },
            ),
          ),



          heightBox10,
          //Most Popular
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              CustomText(
                title: 'Products',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.mainTextColor,
              ),



              CustomText(
                title: 'View All',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.mainTextColor.withOpacity(0.5),
              ),


            ],
          ),

          heightBox10,
          CustomText(
            title: 'Super summer sale',
            fontSize: 11.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: AppColors.mainTextColor.withOpacity(0.5),
          ),

          heightBox10,

          //Container For Summer Product
          SizedBox(
            height: 270.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: summerProducts.length,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              itemBuilder: (context, index) {
                final product = summerProducts[index];

                return AnimatedProductItem(
                  index: index,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: SummerProductWidget(
                      imagePath: product['imagePath'],
                      brandName: product['brandName'],
                      productName: product['productName'],
                      price: product['price'],
                      discountPrice: product['discountPrice'],
                      rating: product['rating'],
                      ratingCount: product['ratingCount'],
                      initialFavorite: false,
                    ),
                  ),
                );
              },
            ),
          ),



          heightBox10,

          //All New Product
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              CustomText(
                title: 'New',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.mainTextColor,
              ),



              CustomText(
                title: 'View All',
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.mainTextColor.withOpacity(0.5),
              ),


            ],
          ),
          heightBox10,
          CustomText(
            title: 'You’ve never seen it before!',
            fontSize: 11.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: AppColors.mainTextColor.withOpacity(0.5),
          ),

          heightBox8,
          //New Product
          SizedBox(
            height: 270.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newProducts.length,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              itemBuilder: (context, index) {
                final product = newProducts[index];

                return AnimatedProductItem(
                  index: index,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: NewProductWidget(
                      imagePath: product['imagePath'],
                      brandName: product['brandName'],
                      productName: product['productName'],
                      price: product['price'],
                      discountPrice: product['discountPrice'],
                      rating: product['rating'],
                      ratingCount: product['ratingCount'],
                      initialFavorite: false,
                    ),
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







