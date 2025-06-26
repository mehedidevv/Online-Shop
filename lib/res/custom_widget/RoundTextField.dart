// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_colors/App_Colors.dart';

class RoundTextField extends StatelessWidget {
  final String hint;
  final double? height;
  final double? vertical_padding;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color focusColor;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLine;
  final TextAlign textAlign;
  final bool readOnly;
  final TextStyle? style;
  final bool obscureText;
  final String obscuringCharacter;
  final Function(String?)? onSaved;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final bool? filled;
  final Color? hintColor;
  final Color fillColor;
  final double focusBorderRadius;
  final double focusBorderWidth;
  final String? errorText;
  final String? Function(String?)? validator;

  const RoundTextField({
    super.key,
    required this.hint,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.focusColor = AppColors.primaryDeep,
    this.onTap,
    this.onChanged,
    this.keyboardType,
    this.maxLine = 1,
    this.readOnly = false,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
    this.obscuringCharacter = '•',
    this.style,
    this.onSaved,
    this.borderRadius = 8,
    this.focusBorderRadius = 8,
    this.borderColor = Colors.grey,
    this.borderWidth = 0.35,
    this.filled = true,
    this.fillColor = const Color(0xffFFFFFF),
    this.focusBorderWidth = 1,
    this.errorText,
    this.validator,
    this.hintColor,
    this.height,
    this.vertical_padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        cursorColor: const Color(0xff595959),
        controller: controller,
        decoration: InputDecoration(
          filled: filled,
          fillColor: fillColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: borderWidth),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusColor, width: focusBorderWidth),
            borderRadius: BorderRadius.circular(focusBorderRadius),
          ),
          hintText: hint,
          hintStyle: GoogleFonts.urbanist(
            color: hintColor ?? const Color(0xff595959),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorText: errorText,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: vertical_padding ?? 0),
        ),
        onTap: onTap,
        onChanged: onChanged,
        keyboardType: keyboardType,
        maxLines: maxLine,
        textAlign: textAlign,
        readOnly: readOnly,
        style: style,
        obscureText: obscureText,
        obscuringCharacter: obscuringCharacter,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
