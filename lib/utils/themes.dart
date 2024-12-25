import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.pink,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme:  TextTheme(
      displaySmall: GoogleFonts.alexandria(color: Colors.black,fontSize: 14),
      displayLarge: const TextStyle(color: Colors.black54,),
      displayMedium: GoogleFonts.alexandria(color:Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),
      labelSmall: GoogleFonts.alexandria(color:Colors.black,fontSize: 16 )
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