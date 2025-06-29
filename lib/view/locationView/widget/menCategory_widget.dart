import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../res/custom_widget/custom_text.dart';

class MenCategoryWidget extends StatelessWidget {
  const MenCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: CustomText(
        title: 'Showing products for Men',
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.blue,
      ),
    );
  }
}


