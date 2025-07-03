import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';

import '../../../../../res/app_images/App_images.dart';
import '../../../../widget/animatedProduct_widget.dart';
import '../../../../widget/summerProduct_widget.dart';

class MyLikesView extends StatelessWidget {
  MyLikesView({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        text: 'My Likes',
        onBackTap: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
          child: GridView.builder(
            itemCount: summerProducts.length,
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 10.w,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              final product = summerProducts[index];
              return AnimatedProductItem(
                index: index,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
