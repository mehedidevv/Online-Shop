import 'package:flutter/material.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';

class AboutForagerView extends StatelessWidget {
  const AboutForagerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        text: 'About Forager',
        onBackTap: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Column(
              children: [

                CustomText(
                  title: aboutForager,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainTextColor,
                ),

                heightBox10,

                CustomText(
                  title: aboutForager,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainTextColor,
                ),

                heightBox10,

                CustomText(
                  title: aboutForager,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainTextColor,
                ),


                heightBox10,

                CustomText(
                  title: aboutForager,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainTextColor,
                ),


                heightBox10,

                CustomText(
                  title: aboutForager,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainTextColor,
                ),


                heightBox10,

                CustomText(
                  title: aboutForager,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainTextColor,
                ),

                heightBox10,

                CustomText(
                  title: aboutForager,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainTextColor,
                ),



              ]
          ),
        ),
      ),
    );
  }


  static String aboutForager = "1. Lorem ipsum dolor sit amet consectetur. Imperdiet iaculis convallis bibendum massa id elementum consectetur neque mauris. ";








}
