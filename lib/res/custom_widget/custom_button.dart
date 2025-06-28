// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../app_colors/App_Colors.dart';
import 'custom_text.dart';



class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final bool isLoading;
  final double width;
  final double padding_vertical;
  final double borderRadius;
  final double fontSize;
  final BoxBorder? border;
  final Color? titleColor;
  final Widget? widget;
  final Gradient? gradient;

  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.width = double.infinity,
    this.padding_vertical = 12.0,
    this.borderRadius = 10.0,
    this.border,
    this.titleColor = Colors.white,
    this.widget,
    this.fontSize = 16.0,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: gradient ??
              const LinearGradient(
                colors: [
                  Color(0xFFD2A56D),
                  Color(0xFF583100),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
        ),
        width: width,
        padding: EdgeInsets.symmetric(vertical: padding_vertical),
        child: isLoading
            ? const Center(
          child: SpinKitDualRing(
            size: 20,
            color: Colors.white,
          ),
        )
            : widget ??
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                 title:  title,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
      ),
    );
  }
}

