import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors {

  static const primaryDeep = Color(0xffD2A56D);
  static const primaryLight = Color(0xffDCD2CB);
  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF000000);
  static const mainTextColor = Color(0xFF010101);
  static const appBarTextColor = Color(0xFF824902);

  // ✅ Reusable Linear Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFFD2A56D),
      Color(0xFF583100),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );



}