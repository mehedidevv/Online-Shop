import 'package:flutter/material.dart';
import '../../../../../res/app_colors/App_Colors.dart';
import '../../../../../res/custom_style/custom_size.dart';
import '../../../../../res/custom_widget/custom_text.dart';

class SingleSizeWidget extends StatelessWidget {
  final String title;
  final List<String> sizes;
  final VoidCallback? onTap;

  const SingleSizeWidget({
    super.key,
    required this.title,
    required this.sizes,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: title,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainTextColor,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: AppColors.mainTextColor.withOpacity(0.5),
                ),
              ],
            ),

            heightBox10,

            Row(
              children: sizes.map((size) => Row(
                children: [
                  CustomText(
                    title: size,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainTextColor.withOpacity(0.5),
                  ),
                  widthBox5,
                ],
              )).toList(),
            ),

          ],
        ),
      ),
    );
  }
}
