import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          String selectedSize = ''; // Hold selected size

          Widget sizeOption(String size) {
            final bool isSelected = selectedSize == size;
            return Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedSize = size;
                  });
                },
                child: Container(
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.appBarTextColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.mainTextColor,
                      width: 0.35,
                    ),
                  ),
                  child: Center(
                    child: CustomText(
                      title: size,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : AppColors.mainTextColor,
                    ),
                  ),
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  title: 'Select size',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainTextColor,
                ),
                heightBox20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    sizeOption('L'),
                    widthBox20,
                    sizeOption('XL'),
                    widthBox20,
                    sizeOption('XXL'),
                  ],
                ),
                heightBox20,
                Row(
                  children: [
                    sizeOption('S'),
                    widthBox20,
                    sizeOption('M'),
                  ],
                ),
                heightBox20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: 'Size info',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainTextColor,
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  ),
                ),
              ],
            ),
          );

        },
      );
    },
  );
}


