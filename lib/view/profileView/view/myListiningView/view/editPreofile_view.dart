import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_widget/RoundTextField.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/res/custom_widget/custom_button.dart';

import '../../../../../res/app_images/App_images.dart';
import '../../../../../res/custom_style/custom_size.dart';
import '../../../../../res/custom_widget/custom_text.dart';

class EditPreofileView extends StatefulWidget {
  const EditPreofileView({super.key});

  @override
  State<EditPreofileView> createState() => _EditPreofileViewState();
}

class _EditPreofileViewState extends State<EditPreofileView> {
  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 85);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        text: 'Edit Profile',
        onBackTap: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox20,
              Center(
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Stack(
                    children: [
                      // Profile Image
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: _imageFile != null
                            ? FileImage(_imageFile!)
                            : AssetImage(AppImages.profileImage)
                        as ImageProvider,
                      ),

                      // Edit Icon
                      Positioned(
                        bottom: 0,
                        right: 4,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.edit,
                              size: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              heightBox20,
              Center(
                child: CustomText(
                  title: 'Anna Sulaiya',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF000000),
                ),
              ),

              heightBox20,
              CustomText(
                title: 'Name',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.mainTextColor
              ),
              heightBox10,
              RoundTextField(
                  hint: 'Mehedi Hasan',
                focusBorderWidth: 0.55,
              ),

              CustomText(
                  title: 'Email',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainTextColor
              ),
              heightBox10,
              RoundTextField(
                hint: 'abcexample@gmail.com',
                focusBorderWidth: 0.55,
              ),

              heightBox20,
              CustomText(
                  title: 'Phone Number',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainTextColor
              ),
              heightBox10,

              Row(
                children: [

                  Expanded(

                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.mainTextColor.withOpacity(0.2),
                          width: 0.55,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: CountryCodePicker(
                        onChanged: (country) {
                          print('Country code selected: ${country.dialCode}');
                        },
                        initialSelection: 'BD',
                        favorite: ['+880', 'BD'],
                        textStyle: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.mainTextColor,
                        ),
                        showFlag: true,
                        showDropDownButton: true,
                        alignLeft: false,
                      ),
                    ),
                  ),

                  widthBox10,

                  // Phone Number Input
                  Expanded(
                    child: RoundTextField(
                      hint: '12345678',
                      focusBorderWidth: 0.55,
                      vertical_padding: 18,
                    ),
                  ),
                ],
              ),




              heightBox20,
              CustomText(
                  title: 'Location',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.mainTextColor
              ),
              heightBox10,
              RoundTextField(
                hint: 'United States',
                focusBorderWidth: 0.55,
              ),

              heightBox20,
              
              CustomButton(title: 'Update', onTap: ()=> Navigator.pop(context))
              




            ],
          ),
        ),
      ),
    );
  }
}
