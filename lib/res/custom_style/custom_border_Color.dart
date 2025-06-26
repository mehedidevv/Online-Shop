// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CustomBorderColor extends StatelessWidget {
  final Widget child;
  final double? radius;
  final List<Color>? gradientColors;
  final double? borderWidth;
  CustomBorderColor({
    super.key,
    required this.child,
    this.radius,
    this.gradientColors,
    this.borderWidth
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 16),
          gradient: LinearGradient(
              colors: [
                Color(0xff010101).withOpacity(0.5),
                Color(0xFF583B71).withOpacity(0.9),
                Color(0xff932973),
                Color(0xFFE2A4D1),
                Color(0xFFF6C6E4),
                Color(0xFF583B71),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
          )
      ),
      child: Container(
        margin: EdgeInsets.all(borderWidth ?? 1),
        child: child,
      ),
    );
  }
}
