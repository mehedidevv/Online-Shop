import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/res/custom_widget/RoundTextField.dart';

import '../app_colors/App_Colors.dart';
import '../custom_style/custom_size.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class CustomCenterDialog extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onButtonTap;

  final String? subTitle; // Optional
  final String? textFieldHint; // Optional
  final TextEditingController? controller; // Optional controller

  const CustomCenterDialog({
    super.key,
    required this.title,
    required this.buttonText,
    required this.onButtonTap,
    this.subTitle,
    this.textFieldHint,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      title: title,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF000000),
                      textAlign: TextAlign.center,
                    ),

                    if (subTitle != null) ...[
                      heightBox10,
                      CustomText(
                        title: subTitle!,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF000000).withOpacity(0.7),
                        textAlign: TextAlign.center,
                      ),
                    ],

                    if (textFieldHint != null) ...[
                      heightBox20,
                      RoundTextField(
                          controller: controller,
                          filled: true,
                          maxLine: 2,
                          vertical_padding: 10,
                          fillColor: Colors.white,
                         hint: '$textFieldHint',

                      ),
                    ],

                    heightBox20,
                    CustomButton(
                       width: 100.w,
                        title: buttonText,
                        onTap: onButtonTap),

                  ],
                ),
              ),
            ),

            // Close Button
            Positioned(
              top: -10,
              right: -10,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(6.w),
                  child: const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
