import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';
import 'package:shop_app/view/authenticationView/signIn_view.dart';
import '../../res/app_images/App_images.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": AppImages.onBoardingOne,
      "text": "TAP THE MAP TO FIND\nSTORES AND ITEMS NEAR YOU."
    },
    {
      "image": AppImages.oonBoardingTwo,
      "text": "Discover unique items near you!"
    },
    {
      "image": AppImages.onBoardingThree,
      "text": "Let’s start foraging together—your next great find is just a tap away!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView for Background Image and Text
          PageView.builder(
            controller: _controller,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  // Background Image
                  SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.asset(
                      onboardingData[index]["image"]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Gradient Overlay
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 350.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black,
                            Colors.black,
                          ],
                        ),
                      ),
                      // Only Text changes here
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                          child: CustomText(
                            title: onboardingData[index]["text"]!,
                            fontSize: 20.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            color: AppColors.whiteColor,
                            isAllCaps: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          // Fixed Bottom Content (Arrow and Dot Indicator)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Forward Arrow
                  GestureDetector(
                    onTap: () {
                      if (currentPage < onboardingData.length - 1) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Get.offAll(() =>  SignInView());
                      }
                    },
                    child: Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  // Dot Indicator
                  SmoothPageIndicator(
                    controller: _controller,
                    count: onboardingData.length,
                    effect: WormEffect(
                      dotHeight: 8.h,
                      dotWidth: 8.w,
                      activeDotColor: const Color(0xFFCE8B54),
                      dotColor: Colors.white54,
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}