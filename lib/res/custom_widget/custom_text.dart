import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final bool underline;
  final bool lineThrough;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? decorationThickness;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final String? fontFamily;
  final bool useGoogleFont;
  final bool isAllCaps;

  const CustomText({
    super.key,
    required this.title,
    this.fontSize = 12,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.underline = false,
    this.lineThrough = false,
    this.decoration,
    this.decorationColor = Colors.black, // <-- default black line color
    this.decorationThickness = 1,
    this.textAlign = TextAlign.start,
    this.overflow,
    this.maxLines,
    this.fontFamily,
    this.useGoogleFont = true,
    this.isAllCaps = false,
  });

  @override
  Widget build(BuildContext context) {
    final textDecoration = decoration ??
        (underline && lineThrough
            ? TextDecoration.combine([
          TextDecoration.underline,
          TextDecoration.lineThrough,
        ])
            : underline
            ? TextDecoration.underline
            : lineThrough
            ? TextDecoration.lineThrough
            : TextDecoration.none);

    TextStyle baseStyle;

    if (fontFamily != null && fontFamily!.isNotEmpty) {
      if (useGoogleFont) {
        baseStyle = GoogleFonts.getFont(
          fontFamily!,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          decoration: textDecoration,
          decorationColor: decorationColor,
          decorationThickness: decorationThickness,
        );
      } else {
        baseStyle = TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          decoration: textDecoration,
          decorationColor: decorationColor,
          decorationThickness: decorationThickness,
        );
      }
    } else {
      baseStyle = GoogleFonts.montserrat(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        decoration: textDecoration,
        decorationColor: decorationColor,
        decorationThickness: decorationThickness,
      );
    }

    return Text(
      isAllCaps ? title.toUpperCase() : title,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: baseStyle,
    );
  }
}
