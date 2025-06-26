
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/RoundTextField.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/res/custom_widget/customCheckBox_widget.dart';
import 'package:shop_app/res/custom_widget/custom_button.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';
import 'package:shop_app/view/authenticationView/otpForget_view.dart';
import 'package:shop_app/view/authenticationView/signUpVerifyView.dart';

import '../../res/app_images/App_images.dart';
import '../../res/custom_widget/customToggleCheckBox.dart';
import 'controller/signUp_controller.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});

  final SignUpController signUpController = Get.put(SignUpController());

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
                      title: 'Verify Your Account',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF010101)
                  ),
                ),

                heightBox30,
                CustomText(
                    title: 'Email Address',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF010101).withOpacity(0.6)
                ),
                heightBox8,
                RoundTextField(
                    prefixIcon: Icon(Icons.email,size: 20,color: Color(0XFF475467),),
                    fillColor: Color(0XFFF8F9FA),
                    borderColor: Color(0XFF6B6B6B),
                    borderWidth: 0.15,
                    hint: 'abc@gmail.com'
                ),




                heightBox20,


                CustomButton(title: 'Continue', 
                    onTap: ()=>Get.to(OtpVerifyAccount())),

                heightBox20,




              ],
            ),
          ),
        ),
      ),
    );
  }
}
