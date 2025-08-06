import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

final _base = ThemeData.light();

final lightTheme = _base.copyWith(
  primaryColor: AppColors.whiteColor,
  scaffoldBackgroundColor: AppColors.whiteColor,

  textTheme: _base.textTheme.copyWith(
    // cryptoText
    bodyMedium: const TextStyle(
      fontFamily: 'SFText',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      fontSize: 17,
      height: 24 / 17,
      letterSpacing: -0.41,
      color: AppColors.textColor,
    ),
  ),
);
