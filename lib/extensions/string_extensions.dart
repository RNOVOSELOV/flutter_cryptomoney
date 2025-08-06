import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

extension StringExtensions on String {
  /// Parse color from String
  ///
  /// '#000000' => 0x000000
  /// '#FF000000' => 0xFF000000
  Color parseColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return AppColors.primaryColor;
  }
}
