import 'package:flutter/material.dart';
import 'package:shop_app/res/app_images/App_images.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import '../../../res/app_colors/App_Colors.dart';
import '../../../res/custom_widget/customAppBar_widget.dart';
import '../widget/singleFavourite_widget.dart';

class FavouriteView extends StatelessWidget {
  FavouriteView({super.key});

  //List of favourite items
  final List<Map<String, dynamic>> favouriteItems = [
    {
      'name': 'Lime Shirt',
      'color': 'Blue',
      'size': 'L',
      'price': 357.0,
      'rating': 4,
      'ratingCount': 10,
      'imagePath': AppImages.CardImage,
      'isNetwork': false,
    },
    {
      'name': 'Cool Jacket',
      'color': 'Black',
      'size': 'M',
      'price': 129.99,
      'rating': 5,
      'ratingCount': 25,
      'imagePath': AppImages.mostPopular1,
      'isNetwork': false,
    },
    {
      'name': 'Lime Shirt',
      'color': 'Blue',
      'size': 'L',
      'price': 357.0,
      'rating': 4,
      'ratingCount': 10,
      'imagePath': AppImages.mostPopular2,
      'isNetwork': false,
    },
    {
      'name': 'Cool Jacket',
      'color': 'Black',
      'size': 'M',
      'price': 129.99,
      'rating': 5,
      'ratingCount': 25,
      'imagePath': AppImages.mostPopular3,
      'isNetwork': false,
    },
    {
      'name': 'Lime Shirt',
      'color': 'Blue',
      'size': 'L',
      'price': 357.0,
      'rating': 4,
      'ratingCount': 10,
      'imagePath': AppImages.CardImage,
      'isNetwork': false,
    },
    {
      'name': 'Cool Jacket',
      'color': 'Black',
      'size': 'M',
      'price': 129.99,
      'rating': 5,
      'ratingCount': 25,
      'imagePath': AppImages.mostPopular1,
      'isNetwork': false,
    },
    {
      'name': 'Lime Shirt',
      'color': 'Blue',
      'size': 'L',
      'price': 357.0,
      'rating': 4,
      'ratingCount': 10,
      'imagePath': AppImages.mostPopular2,
      'isNetwork': false,
    },
    {
      'name': 'Cool Jacket',
      'color': 'Black',
      'size': 'M',
      'price': 129.99,
      'rating': 5,
      'ratingCount': 25,
      'imagePath': AppImages.mostPopular3,
      'isNetwork': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(text: 'Favourite', onBackTap: () => Navigator.pop(context)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              heightBox20,
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: favouriteItems.length,
                  itemBuilder: (context, index) {
                    final item = favouriteItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: SingleFavouriteItemWidget(
                        name: item['name'],
                        color: item['color'],
                        size: item['size'],
                        price: item['price'],
                        rating: item['rating'],
                        ratingCount: item['ratingCount'],
                        imagePath: item['imagePath'],
                        isNetwork: item['isNetwork'],
                        onRemoveTap: () {
                          print('Remove tapped for ${item['name']}');

                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
