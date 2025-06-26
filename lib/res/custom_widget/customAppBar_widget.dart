import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_colors/App_Colors.dart';
import 'custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? text;
  final VoidCallback? onBackTap;

  const CustomAppBar({
    Key? key,
    this.text,
    this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // Back button
          GestureDetector(
            onTap: onBackTap ?? () => Navigator.of(context).maybePop(),
            child: Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  size: 20.sp,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ),

          SizedBox(width: 10.w),

          // Title (Optional)
          if (text != null)
            Expanded(
              child: Center(
                child: CustomText(
                  title: text!,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          else
            const Spacer(), // Keeps back button left-aligned if no text
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
