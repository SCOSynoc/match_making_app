import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:match_making/utils/themes.dart';

class AppTextTheme {
  // Main method to access text styles with optional customization
  static TextStyle getStyle(BuildContext context, {
    TextStyle? baseStyle,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
  }) {
    final defaultStyle = baseStyle ?? _baseStyle(context);
    return defaultStyle.copyWith(
      color: color ?? _textColor(context),
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle _baseStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontFamily: 'YourCustomFont',
      );

  static TextStyle placeHolderStyle(BuildContext context) =>
      GoogleFonts.alexandria(color: getMaterialColor(Colors.red.shade200)
      );

  // Color handling based on theme brightness
  static Color _textColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black;

  // Predefined text styles (customize as needed)
  static TextStyle conditionalTextStyle(
      BuildContext context, {
        required bool isSelected,
        double fontSize = 14,
        Color selectedColor = Colors.red,
        Color defaultColor = Colors.black,
        FontWeight selectedWeight = FontWeight.bold,
        FontWeight defaultWeight = FontWeight.normal,
      }) {
    return getStyle(
      context,
      fontSize: fontSize,
      color: isSelected ? selectedColor : defaultColor,
      fontWeight: isSelected ? selectedWeight : defaultWeight,
    );
  }
}