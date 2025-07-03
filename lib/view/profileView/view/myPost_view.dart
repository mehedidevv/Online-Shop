import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/app_images/App_images.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/view/widget/animatedProduct_widget.dart';

import '../../../res/custom_widget/alertDialog_widget.dart';
import '../widget/singlePost_widget.dart';

class MyPostView extends StatelessWidget {
  MyPostView({super.key});

  // Dummy data list
  final List<Map<String, String>> postList = [
    {
      'image': AppImages.CardImage,
      'title': 'Dorothy Perkins',
      'subtitle': 'Sport Dress',
      'originalPrice': '\$25',
      'discountedPrice': '\$12',
    },
    {
      'image': AppImages.myPostImage,
      'title': 'Zara',
      'subtitle': 'Evening Gown',
      'originalPrice': '\$40',
      'discountedPrice': '\$22',
    },
    {
      'image': AppImages.myPost2,
      'title': 'H&M',
      'subtitle': 'Casual Shirt',
      'originalPrice': '\$30',
      'discountedPrice': '\$15',
    },
    {
      'image': AppImages.CardImage,
      'title': 'Dorothy Perkins',
      'subtitle': 'Sport Dress',
      'originalPrice': '\$25',
      'discountedPrice': '\$12',
    },
    {
      'image': AppImages.myPostImage,
      'title': 'Zara',
      'subtitle': 'Evening Gown',
      'originalPrice': '\$40',
      'discountedPrice': '\$22',
    },
    {
      'image': AppImages.myPost2,
      'title': 'H&M',
      'subtitle': 'Casual Shirt',
      'originalPrice': '\$30',
      'discountedPrice': '\$15',
    },
    {
      'image': AppImages.CardImage,
      'title': 'Dorothy Perkins',
      'subtitle': 'Sport Dress',
      'originalPrice': '\$25',
      'discountedPrice': '\$12',
    },
    {
      'image': AppImages.myPostImage,
      'title': 'Zara',
      'subtitle': 'Evening Gown',
      'originalPrice': '\$40',
      'discountedPrice': '\$22',
    },
    {
      'image': AppImages.myPost2,
      'title': 'H&M',
      'subtitle': 'Casual Shirt',
      'originalPrice': '\$30',
      'discountedPrice': '\$15',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'My Post',
        onBackTap: () => Navigator.pop(context),
      ),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: ListView.builder(
            itemCount: postList.length,
            itemBuilder: (context, index) {
              final post = postList[index];
              return Padding(
                padding:  EdgeInsets.only(bottom: 10.0),
                child: AnimatedProductItem(
                  index: index,
                  child: SinglePostWidget(
                    imagePath: post['image']!,
                    title: post['title']!,
                    subtitle: post['subtitle']!,
                    originalPrice: post['originalPrice']!,
                    discountedPrice: post['discountedPrice']!,
                    onTapEdit: () {
                      print("Edit tapped for ${post['title']}");
                    },
                    onTapDelete: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => CustomCenterDialog(
                          title: 'Are you Want to Delete!',
                          subTitle: 'Item will Be Deleted From Your Device.',
                          buttonText: 'Delete',
                          onButtonTap: () => Navigator.pop(context),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


