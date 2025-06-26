import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/view/onBoardingView/onBoardingOne_view.dart';
import '../../res/app_colors/App_Colors.dart';
import '../../res/app_images/App_images.dart';
import 'package:get/get.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({super.key});

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation setup
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    // Navigate after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Get.off(() => const OnboardingView());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDeep.withOpacity(0.6),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: SizedBox(
            height: 250.h,
            width: 245.w,
            child: Image.asset(AppImages.logoIcon),
          ),
        ),
      ),
    );
  }
}
