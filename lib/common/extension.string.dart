import 'package:flutter/material.dart';

class FontWeightHelper {
  static FontWeight get light => FontWeight.w200;
  static FontWeight get medium => FontWeight.w500;
  static FontWeight get bold => FontWeight.w700;
  static FontWeight get book => FontWeight.w300;
}

extension FontHelperExtension on String {
  FontWeight get toFontWeight {
    switch (this.toLowerCase()) {
      case 'light':
        return FontWeightHelper.light;
      case 'medium':
        return FontWeightHelper.medium;
      case 'bold':
        return FontWeightHelper.bold;
      case 'book':
        return FontWeightHelper.book;
      default:
        return FontWeightHelper.book;
    }
  }
}
