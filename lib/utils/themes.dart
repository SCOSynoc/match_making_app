import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'customTextTheme.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primarySwatch: getMaterialColor(Colors.red),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme:  TextTheme(
      displaySmall: GoogleFonts.alexandria(color: Colors.black,fontSize: 14),
      displayLarge: GoogleFonts.alexandria(color: Colors.black54,),
      displayMedium: GoogleFonts.alexandria(color:Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),
      labelSmall: GoogleFonts.alexandria(color:Colors.white,fontSize: 18 ),
      labelMedium: GoogleFonts.alexandria(color:Colors.red,fontSize: 18 )
    ),
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme:  TextTheme(
        displayLarge: TextStyle(color: Colors.white),
        displaySmall: TextStyle(color: Colors.white70, fontSize: 16),
        displayMedium:TextStyle(color: Colors.white70),
        labelSmall: GoogleFonts.alexandria(color:Colors.white,fontSize: 16, fontWeight: FontWeight.bold )
    ),
  );
}


MaterialColor getMaterialColor(Color color) {
  final int red = color.red;
  final int green = color.green;
  final int blue = color.blue;
  final int alpha = color.alpha;

  final Map<int, Color> shades = {
    50: Color.fromARGB(alpha, red, green, blue),
    100: Color.fromARGB(alpha, red, green, blue),
    200: Color.fromARGB(alpha, red, green, blue),
    300: Color.fromARGB(alpha, red, green, blue),
    400: Color.fromARGB(alpha, red, green, blue),
    500: Color.fromARGB(alpha, red, green, blue),
    600: Color.fromARGB(alpha, red, green, blue),
    700: Color.fromARGB(alpha, red, green, blue),
    800: Color.fromARGB(alpha, red, green, blue),
    900: Color.fromARGB(alpha, red, green, blue),
  };

  return MaterialColor(color.value, shades);



}



extension TextThemeExtension on BuildContext {
  // Existing code...

  TextStyle conditionalTextStyle({
    required bool isSelected,
    double fontSize = 14,
    Color selectedColor = Colors.red,
    Color defaultColor = Colors.black,
    FontWeight selectedWeight = FontWeight.bold,
    FontWeight defaultWeight = FontWeight.normal,
  }) =>
      AppTextTheme.conditionalTextStyle(
        this,
        isSelected: isSelected,
        fontSize: fontSize,
        selectedColor: selectedColor,
        defaultColor: defaultColor,
        selectedWeight: selectedWeight,
        defaultWeight: defaultWeight,
      );


}