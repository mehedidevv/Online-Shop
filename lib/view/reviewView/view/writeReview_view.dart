import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/custom_button.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';

import '../../../res/app_colors/App_Colors.dart';
import '../../../res/custom_widget/RoundTextField.dart';
import '../../../res/custom_widget/customAppBar_widget.dart';

class WriteReviewView extends StatefulWidget {
  const WriteReviewView({super.key});

  @override
  State<WriteReviewView> createState() => _WriteReviewViewState();
}

class _WriteReviewViewState extends State<WriteReviewView> {
  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Write Review', onBackTap: () => Navigator.pop(context)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ⭐ Star Rating
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedRating == index + 1) {
                            selectedRating = 0;
                          } else {
                            selectedRating = index + 1;
                          }
                        });
                      },
                      child: Icon(
                        selectedRating >= index + 1
                            ? Icons.star
                            : Icons.star_border_outlined,
                        color: selectedRating >= index + 1 ? AppColors.appBarTextColor : Colors.grey,
                        size: 35,
                      ),
                    );
                  }).expand((widget) sync* {
                    yield widget;
                    if (widget != List.generate(5, (i) => i)[4]) yield widthBox10;
                  }).toList(),
                ),
              ),

              heightBox30,

              CustomText(
                title: 'Write Review',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.mainTextColor,
              ),

              heightBox20,

              RoundTextField(
                hint: 'Write Your Review',
                vertical_padding: 10,
                height: 100.h,
                maxLine: 5,
              ),

              heightBox20,

              CustomButton(title: 'Submit', onTap: () {
                // You can use selectedRating here
                Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
