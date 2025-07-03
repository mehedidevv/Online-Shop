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
import 'package:shop_app/view/authenticationView/signIn_view.dart';
import '../../../res/app_images/App_images.dart';
import '../../authenticationView/controller/signUp_controller.dart';

class ChangePasswordView extends StatelessWidget {
  ChangePasswordView({super.key});

  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Create New Password',
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
                      title: 'Create New Password',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0XFF010101)
                  ),
                ),

                heightBox30,




                //Password
                CustomText(
                    title: 'Current Password',
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
                    title: 'New  Password',
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


                //Password
                CustomText(
                    title: 'Confirm  Password',
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


                CustomButton(title: 'Update Password', onTap: ()=>Navigator.pop(context)),

                heightBox20,





              ],
            ),
          ),
        ),
      ),
    );
  }
}
