import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/app_colors/App_Colors.dart';
import '../../../res/custom_style/custom_size.dart';
import '../../../res/custom_widget/custom_text.dart';

class SingleFavouriteItemWidget extends StatelessWidget {
  final String name;
  final String color;
  final String size;
  final double price;
  final int rating; // number of filled stars (0-5)
  final int ratingCount;
  final String imagePath;  // image path (asset or network)
  final bool isNetwork;    // true if network image, false if asset image
  final VoidCallback? onRemoveTap;

  const SingleFavouriteItemWidget({
    Key? key,
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    required this.rating,
    required this.ratingCount,
    required this.imagePath,
    this.isNetwork = false, // default to asset image
    this.onRemoveTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Build image widget based on isNetwork flag
    final Widget imageWidget = isNetwork
        ? Image.network(
      imagePath,
      fit: BoxFit.cover,
    )
        : Image.asset(
      imagePath,
      fit: BoxFit.cover,
    );

    return Stack(
      children: [
        Container(
          width: double.infinity,
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
          child: Row(
            children: [
              SizedBox(
                height: 120.h,
                width: 100.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: imageWidget,
                ),
              ),

              widthBox10,

              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: name,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainTextColor,
                      ),
                      heightBox10,

                      // Color and size
                      Row(
                        children: [
                          Row(
                            children: [
                              CustomText(
                                title: 'Color:  ',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainTextColor.withOpacity(0.5),
                              ),
                              CustomText(
                                title: color,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainTextColor,
                              ),
                            ],
                          ),
                          widthBox20,
                          Row(
                            children: [
                              CustomText(
                                title: 'Size:  ',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainTextColor.withOpacity(0.5),
                              ),
                              CustomText(
                                title: size,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainTextColor,
                              ),
                            ],
                          ),
                        ],
                      ),

                      heightBox10,

                      Row(
                        children: [
                          CustomText(
                            title: '\$${price.toStringAsFixed(2)}',
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mainTextColor,
                          ),
                          widthBox50,
                          Row(
                            children: List.generate(5, (index) {
                              if (index < rating) {
                                return Icon(
                                  Icons.star,
                                  color: AppColors.appBarTextColor,
                                  size: 15.sp,
                                );
                              } else {
                                return Icon(
                                  Icons.star_border,
                                  color: Colors.grey,
                                  size: 15.sp,
                                );
                              }
                            }),
                          ),
                          CustomText(
                            title: '($ratingCount)',
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mainTextColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Positioned Close Icon
        Positioned(
          top: 5,
          right: 5,
          child: GestureDetector(
            onTap: onRemoveTap,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.close,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
