import 'package:flutter/material.dart';
import 'package:match_making/utils/themes.dart';

class Decorations {
  static InputDecoration commonInputDecorations = InputDecoration(
    fillColor: Colors.white,
    border: OutlineInputBorder(borderSide: BorderSide(color: getMaterialColor(Colors.red),),
        borderRadius: BorderRadius.circular(16)),
  );

  static OutlineInputBorder commonInputBorders = OutlineInputBorder(borderSide: BorderSide(color: getMaterialColor(Colors.pink.shade400),),
      borderRadius: BorderRadius.circular(26));

  static InputDecoration commonDropDownDeco(BuildContext context) {
       double screenHeight = MediaQuery.of(context).size.height;
       return InputDecoration(
         contentPadding: EdgeInsets.symmetric(
           horizontal: 15,
           vertical: screenHeight * 0.010,
         ),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10),
           borderSide: BorderSide(color: getMaterialColor(Colors.red)),
         ),
         focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10),
           borderSide: BorderSide(color: getMaterialColor(Colors.red)),
         ),
         enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10),
           borderSide: BorderSide(color: getMaterialColor(Colors.red)),
         ),
       );
  }
}