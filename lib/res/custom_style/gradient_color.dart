import 'package:flutter/material.dart';

class GradientColor extends StatelessWidget {
  final Widget child;
  const GradientColor({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0XFF4DB6AC),
              Color(0xFF22504C),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: child,
      ),
    );
  }
}
