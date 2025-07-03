import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/view/profileView/view/myListiningView/widget/kidsSize_widget.dart';
import 'package:shop_app/view/profileView/view/myListiningView/widget/manSize_widget.dart';
import 'package:shop_app/view/profileView/view/myListiningView/widget/womanSize_widget.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';

// Enum for tab categories
enum SizeCategory { women, men, kids }

class MySizeView extends StatefulWidget {
  const MySizeView({super.key});

  @override
  State<MySizeView> createState() => _MySizeViewState();
}

class _MySizeViewState extends State<MySizeView> {
  int selectedIndex = 0;

  // Map enum to display names
  final Map<SizeCategory, String> categoryNames = {
    SizeCategory.women: 'Women',
    SizeCategory.men: 'Men',
    SizeCategory.kids: 'Kids',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Size',
        onBackTap: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Category Tab Bar
            Container(
              padding: EdgeInsets.all(8.w),
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: SizeCategory.values.map((category) {
                  final index = SizeCategory.values.indexOf(category);
                  final isSelected = selectedIndex == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Semantics(
                        label: categoryNames[category],
                        selected: isSelected,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              title: categoryNames[category]!,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? AppColors.mainTextColor
                                  : AppColors.mainTextColor.withOpacity(0.7),
                            ),
                            SizedBox(height: 6.h),
                            Container(
                              height: 2.h,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primaryDeep
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(1.r),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            SizedBox(height: 10.h), // Replaced heightBox10
            // Show Selected Category Widget
            Expanded(
              child: IndexedStack(
                index: selectedIndex,
                children: [
                  WomanSizeWidget(),
                   ManSizeWidget(),
                   KidsSizeWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}