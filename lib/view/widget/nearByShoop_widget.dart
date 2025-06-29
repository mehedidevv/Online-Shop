import 'package:flutter/material.dart';
import '../../../res/app_colors/App_Colors.dart';
import '../../../res/custom_widget/custom_text.dart';

class NearByShopWidget extends StatelessWidget {
  final String shopImage;
  final String shopName;

  const NearByShopWidget({
    super.key,
    required this.shopImage,
    required this.shopName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(shopImage),
        ),
        const SizedBox(height: 6),
        CustomText(
          title: shopName,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.mainTextColor.withOpacity(0.5),
        )
      ],
    );
  }
}
