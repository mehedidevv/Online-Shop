import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';

import '../../../../../res/app_images/App_images.dart';
import '../../../../../res/custom_style/custom_size.dart';
import '../../../../../res/custom_widget/RoundTextField.dart';
import '../../../../../res/custom_widget/custom_button.dart';
import '../../../../../res/custom_widget/custom_text.dart';
import '../../../../authenticationView/controller/signUp_controller.dart';
import '../../../../authenticationView/signUpVerifyView.dart';

class SupportView extends StatelessWidget {
   SupportView({super.key});

  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(text: 'Support',onBackTap: ()=>Navigator.pop(context),),

      body: SafeArea(

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                  //App Logo
                  Center(
                    child: SizedBox(
                      height: 100.h,
                      width: 120.w,
                      child: Image.asset(AppImages.supportImage),
                    ),
                  ),


                  heightBox40,

                  //Row For Fast Name And Last Name
                  Row(
                    children: [
                      // First Column (e.g., First Name)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: 'First Name',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:  Color(0XFF010101).withOpacity(0.6),
                            ),
                           heightBox10,
                            RoundTextField(
                              prefixIcon:  Icon(Icons.person, size: 20, color: Color(0XFF475467)),
                              fillColor:  Color(0XFFF8F9FA),
                              borderColor:  Color(0XFF6B6B6B),
                              borderWidth: 0.15,
                              hint: 'Kayla',
                            ),
                          ],
                        ),
                      ),

                     widthBox14,

                      // Second Column (e.g., Last Name)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              title: 'Last Name',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFF010101).withOpacity(0.6),
                            ),
                           heightBox10,
                            RoundTextField(
                              prefixIcon:  Icon(Icons.person, size: 20, color: Color(0XFF475467)),
                              fillColor:  Color(0XFFF8F9FA),
                              borderColor:  Color(0XFF6B6B6B),
                              borderWidth: 0.15,
                              hint: 'Smith',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),



                  heightBox10,

                  CustomText(
                      title: 'Email Address',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF010101).withOpacity(0.6)
                  ),
                  heightBox5,
                  RoundTextField(
                      prefixIcon: Icon(Icons.email,size: 20,color: Color(0XFF475467),),
                      fillColor: Color(0XFFF8F9FA),
                      borderColor: Color(0XFF6B6B6B),
                      borderWidth: 0.15,
                      hint: 'abc@gmail.com'
                  ),

                  heightBox10,

                  CustomText(
                      title: 'Phone Number',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF010101).withOpacity(0.6)
                  ),
                  heightBox5,
                  RoundTextField(
                      prefixIcon: Icon(Icons.call,size: 20,color: Color(0XFF475467),),
                      fillColor: Color(0XFFF8F9FA),
                      borderColor: Color(0XFF6B6B6B),
                      borderWidth: 0.15,
                      hint: '+880123456..',
                  ),


                  heightBox10,

                  CustomText(
                      title: 'Message',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF010101).withOpacity(0.6)
                  ),
                  heightBox5,
                  RoundTextField(
                    height: 100.h,
                    fillColor: Color(0XFFF8F9FA),
                    borderColor: Color(0XFF6B6B6B),
                    borderWidth: 0.15,
                    maxLine: 10,
                    vertical_padding: 5,
                    hint: 'Write Here',
                  ),
              


                  heightBox30,
                  CustomButton(title: 'Submit', onTap: ()=>Get.to(VerifyAccount())),

              
                  heightBox20,
              
              
                ],
              ),
            ),
          ),
      ),
    );
  }
}
