import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/RoundTextField.dart';
import 'package:shop_app/res/custom_widget/customCheckBox_widget.dart';
import 'package:shop_app/res/custom_widget/custom_button.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';
import 'package:shop_app/view/authenticationView/forgetPasasword_view.dart';
import 'package:shop_app/view/authenticationView/signUp_view.dart';
import 'package:shop_app/view/homeDashboard_view.dart';

import '../../res/app_images/App_images.dart';
import '../../res/custom_widget/customToggleCheckBox.dart';
import 'controller/signUp_controller.dart';

class SignInView extends StatelessWidget {
   SignInView({super.key});

  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14,vertical: 14),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                  heightBox20,
                  //App Logo
                  Center(
                    child: SizedBox(
                      height: 100.h,
                      width: 120.w,
                      child: Image.asset(AppImages.logoIcon),
                    ),
                  ),
              
                  heightBox30,
                  CustomText(
                      title: 'Sign In',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFF010101)
                  ),
              
                  heightBox30,
                  CustomText(
                      title: 'Email Address',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF010101).withOpacity(0.6)
                  ),
              
                  heightBox10,
              
                  RoundTextField(
                    prefixIcon: Icon(Icons.email,size: 20,color: Color(0XFF475467),),
                      fillColor: Color(0XFFF8F9FA),
                      borderColor: Color(0XFF6B6B6B),
                      borderWidth: 0.15,
                      hint: 'abc@gmail.com'
                  ),
              
                  heightBox10,
              
                  //Password
                  CustomText(
                      title: 'Password',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF010101).withOpacity(0.6)
                  ),
              
                  heightBox5,
              
                  Obx( () =>
                  //Text Field For Password
                  RoundTextField(
                    hint: 'Enter your Password',
                    fillColor: Color(0XFFF8F9FA),
                    borderColor: Color(0XFF6B6B6B),
                    borderWidth: 0.15,
                    prefixIcon: Icon(Icons.lock,size: 20,color: Color(0XFF475467),),
                    suffixIcon: IconButton(
                      icon: Icon(
                        color: Color(0XFF475467),
                        signUpController.isConfirmPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        signUpController.toggleConfirmPasswordVisibility();
                      },
                    ),
                    obscureText: !signUpController .isConfirmPasswordVisible.value,
                  ),),
              
                  heightBox10,
              
                  //Forget Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
              
                      GradientToggleSwitch(
                        label: 'Remember Me',
                        initialValue: false,
                        onChanged: (value) {
                          print("Remember Me toggled: $value");
                        },
                      ),
              
                      GestureDetector(
                        onTap: ()=>Get.to(ForgetPasswordView()),
                        child: CustomText(
                            title: 'Forgot Password',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFFD2A56D)
                        ),
                      ),
              
              
              
                    ],
                  ),
              
                  heightBox20,
              
                  //Terms & Conditions
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              
                      CustomCheckbox(
                        initialValue: false,
                        onChanged: (bool value) {
                          print("Checkbox is now: $value");
                        },
                      ),
                      widthBox15,
                      Expanded(
                        child: CustomText(
                          title: 'By signing up you confirm that you have read & agree to the Privacy Policy and Terms & conditions',
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF5C5C5C),
                        ),
                      )
                    ],
                  ),
              
                  heightBox20,
              
              
                  CustomButton(title: 'Sign In', onTap: ()=>Get.to(HomeDashboardView())),
              
                  heightBox20,
              
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Color(0XFFCECECE),
                        ),
                      ),
                      SizedBox(width: 10), // widthBox10
                      CustomText(
                        title: 'Or continue with',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF010101).withOpacity(0.5),
                      ),
                      SizedBox(width: 10), // widthBox10
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: Color(0XFFCECECE),
                        ),
                      ),
                    ],
                  ),
              
              
                heightBox20,
              
                //Continue with
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
              
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFFAF6F1), // Light cream background
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 12,
                            spreadRadius: 2,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Center(
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFD2A56D),
                              Color(0xFF583100),
                            ],
                          ).createShader(bounds),
                          blendMode: BlendMode.srcIn,
                          child: Image.asset(
                            AppImages.apple,
                            width: 40,
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
              
                    widthBox20,
              
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFFAF6F1), // Light cream background
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 12,
                            spreadRadius: 2,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Center(
                        child: ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFD2A56D),
                              Color(0xFF583100),
                            ],
                          ).createShader(bounds),
                          blendMode: BlendMode.srcIn,
                          child: Image.asset(
                            AppImages.googleIcon,
                            width: 40,
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
              
                  ],
                ),
              
                  heightBox20,
              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          title: 'Don\'t have an account?',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFF010101)
                      ),
              
                      widthBox10,
              
                      GestureDetector(
                        onTap: ()=> Get.to(SignUpView()),
                        child: CustomText(
                            title: 'Sign Up',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0XFFD2A56D)
                        ),
                      ),
              
              
                    ],
                  )
              
              
              
                ],
              ),
            ),
          ),
      ),
    );
  }
}
