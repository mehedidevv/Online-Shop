import 'package:flutter/material.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/view/widget/animatedProduct_widget.dart';
import '../../../../../res/app_images/App_images.dart';
import '../widget/myRecantView_widget.dart';




class MyRecentView extends StatelessWidget {
   MyRecentView({super.key});

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
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(text: 'Recant View', onBackTap: ()=>Navigator.pop(context),),

     body:  SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: ListView.builder(
            itemCount: postList.length,
            itemBuilder: (context, index) {
              final post = postList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: AnimatedProductItem(
                  index: index,
                  child: SingleRecantWidget(
                    imagePath: post['image']!,
                    title: post['title']!,
                    subtitle: post['subtitle']!,
                    originalPrice: post['originalPrice']!,
                    discountedPrice: post['discountedPrice']!,
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
