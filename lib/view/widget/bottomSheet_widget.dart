import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_widget/custom_button.dart';

import '../../../res/custom_style/custom_size.dart';
import '../../../res/custom_widget/customCheckBox_widget.dart';
import '../../../res/custom_widget/custom_text.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.r,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        children: [

          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.only(bottom: 12.h),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),

          heightBox10,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                CustomText(
                  title: 'Nordstrom ',
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainTextColor,
                ),

                CustomCheckbox(
                  initialValue: false,
                  onChanged: (bool value) {
                    print("Checkbox is now: $value");
                  },
                ),


              ],
            ),
          ),


          heightBox10,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                CustomText(
                  title: 'Goodwill ',
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainTextColor,
                ),

                CustomCheckbox(
                  initialValue: false,
                  onChanged: (bool value) {
                    print("Checkbox is now: $value");
                  },
                ),


              ],
            ),
          ),

          heightBox10,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                CustomText(
                  title: 'Zara',
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainTextColor,
                ),

                CustomCheckbox(
                  initialValue: false,
                  onChanged: (bool value) {
                    print("Checkbox is now: $value");
                  },
                ),


              ],
            ),
          ),


          heightBox10,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                CustomText(
                  title: 'Calvine',
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainTextColor,
                ),

                CustomCheckbox(
                  initialValue: false,
                  onChanged: (bool value) {
                    print("Checkbox is now: $value");
                  },
                ),


              ],
            ),
          ),


          heightBox10,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                CustomText(
                  title: 'T J Maxx',
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainTextColor,
                ),

                CustomCheckbox(
                  initialValue: false,
                  onChanged: (bool value) {
                    print("Checkbox is now: $value");
                  },
                ),


              ],
            ),
          ),


          Spacer(),
          CustomButton(title: 'Save', onTap: ()=> Navigator.pop(context),),

          heightBox30,
          // Add more content here
        ],
      ),
    );
  }
}
