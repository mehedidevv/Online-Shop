import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/RoundTextField.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/res/custom_widget/customCheckBox_widget.dart';
import 'package:shop_app/res/custom_widget/custom_button.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';
import 'package:shop_app/view/authenticationView/signIn_view.dart';

import '../../res/app_images/App_images.dart';
import '../../res/custom_widget/customToggleCheckBox.dart';
import '../../res/custom_widget/custom_otp_widget.dart';
import 'controller/signUp_controller.dart';

class VerifyAccount extends StatefulWidget {
  VerifyAccount({super.key});

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  final SignUpController signUpController = Get.put(SignUpController());

  bool _isPinVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackTap: ()=> Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14,vertical: 14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //App Logo
                Center(
                  child: SizedBox(
                    height: 100.h,
                    width: 120.w,
                    child: Image.asset(AppImages.logoIcon),
                  ),
                ),

                heightBox30,

                Center(
                  child: CustomText(
                      title: 'Verify Account',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainTextColor,
                    textAlign: TextAlign.center,
                  ),
                ),

                heightBox5,
                Center(
                  child: CustomText(
                    title: 'Please enter the 4 digit code that was sent to roy@roy.com ',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF5C5C5C),
                    textAlign: TextAlign.center,
                  ),
                ),






                heightBox20,
                //Otp Pin Code
                _buildPinRow(
                  title: 'Enter your Verification Code ',
                  isVisible: _isPinVisible,
                  onToggle: () {
                    setState(() {
                      _isPinVisible = !_isPinVisible;
                    });
                  },
                  child: CustomOtpWidget(obscureText: !_isPinVisible),
                ),

                heightBox20,
                //Resend Code
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    CustomText(
                      title: 'Re-send code in',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.mainTextColor,
                    ),

                    widthBox10,

                    CustomText(
                      title: '55s',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryDeep,
                    ),
                  ],
                ),


                heightBox20,


                CustomButton(

                    title: 'Verify Account',
                    onTap: ()=>Get.to(SignInView())),



                heightBox20,



              ],
            ),
          ),
        ),
      ),
    );
  }

  //Otp Code
  Widget _buildPinRow({
    required String title,
    required bool isVisible,
    required VoidCallback onToggle,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              title: title,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor.withOpacity(0.72),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: onToggle,
              child: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: const Color(0XFF3E3E3E),
              ),
            ),
          ],
        ),
        heightBox10,
        child,
      ],
    );
  }
}
