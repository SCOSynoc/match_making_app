import 'package:flutter/material.dart';

class Decorations {
  static InputDecoration commonInputDecorations = InputDecoration(
    fillColor: Colors.white,
    border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white12,),
        borderRadius: BorderRadius.circular(16)),
  );

  static OutlineInputBorder commonInputBorders = OutlineInputBorder(borderSide: const BorderSide(color: Colors.white12,),
      borderRadius: BorderRadius.circular(16));
}