import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  // Fonts
  static const ubuntuFont = 'Ubuntu';
  static const nautigalFont = 'TheNautigal';

  //To display medium fonts
  static const TextStyle displayMedium = TextStyle(
    color: AppColors.lightYellow,
    fontSize: 16,
    fontFamily: ubuntuFont,
  );

  //To display heading
  static const TextStyle displayHeading = TextStyle(
      fontSize: 80,
      color: AppColors.welcomeColor,
      fontWeight: FontWeight.bold,
      fontFamily: AppTheme.nautigalFont);

  //To display sub heading
  static const TextStyle displaySubHeading = TextStyle(
      fontSize: 30,
      color: AppColors.lightYellow,
      fontFamily: AppTheme.ubuntuFont,
      fontWeight: FontWeight.bold);

  static ThemeData appThemeLight() {
    return ThemeData(
      primaryColor: AppColors.blueGrey,
      scaffoldBackgroundColor: AppColors.white,
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: AppColors.black), // AppBar text color
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: AppColors.inputLabelColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: AppColors.yellow),
    );
  }
}
