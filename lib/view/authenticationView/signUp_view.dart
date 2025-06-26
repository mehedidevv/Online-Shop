import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/RoundTextField.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/res/custom_widget/custom_button.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';
import 'package:shop_app/view/authenticationView/signUpVerifyView.dart';
import '../../res/app_images/App_images.dart';
import 'controller/signUp_controller.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

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
            
                heightBox10,
                CustomText(
                    title: 'Sign Up',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFF010101)
                ),
            
                heightBox20,
                CustomText(
                    title: 'Full Name',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF010101).withOpacity(0.6)
                ),
                RoundTextField(
                    prefixIcon: Icon(Icons.person,size: 20,color: Color(0XFF475467),),
                    fillColor: Color(0XFFF8F9FA),
                    borderColor: Color(0XFF6B6B6B),
                    borderWidth: 0.15,
                    hint: 'Kayla Smith'
                ),
            
            
                CustomText(
                    title: 'Email Address',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF010101).withOpacity(0.6)
                ),
                RoundTextField(
                    prefixIcon: Icon(Icons.email,size: 20,color: Color(0XFF475467),),
                    fillColor: Color(0XFFF8F9FA),
                    borderColor: Color(0XFF6B6B6B),
                    borderWidth: 0.15,
                    hint: 'abc@gmail.com'
                ),
            
            
            
            
                //Password
                CustomText(
                    title: 'Password',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF010101).withOpacity(0.6)
                ),
            
            
                Obx( () =>
                //Text Field For Password
                RoundTextField(
                  hint: '******',
                  fillColor: Color(0XFFF8F9FA),
                  borderColor: Color(0XFF6B6B6B),
                  borderWidth: 0.15,
                  prefixIcon: Icon(Icons.lock,size: 20,color: Color(0XFF475467),),
                  suffixIcon: IconButton(
                    icon: Icon(
                      color: Color(0XFF475467),
                      signUpController.isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      signUpController.togglePasswordVisibility();
                    },
                  ),
                  obscureText: !signUpController .isPasswordVisible.value,
                ),),
            
            
                //Password
                CustomText(
                    title: 'Confirm Password',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF010101).withOpacity(0.6)
                ),
            
                heightBox5,
            
                Obx( () =>
                //Text Field For Password
                RoundTextField(
                  hint: '******',
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
            
            
                heightBox20,
            
            
                CustomButton(title: 'Sign Up', onTap: ()=>Get.to(VerifyAccount())),
            
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
                        title: 'Already have an account?',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF010101)
                    ),
            
                    widthBox10,
            
                    GestureDetector(
                      onTap: ()=>Navigator.pop(context),
                      child: CustomText(
                          title: 'Sign In',
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
