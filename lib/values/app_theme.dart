import 'package:flutter/material.dart';
import 'package:podcasty/values/app_colors.dart';

///App theme
class AppTheme {
  const AppTheme._();

  // Fonts
  static const String ubuntuFont = 'Ubuntu';
  static const String nautigalFont = 'TheNautigal';

  static final ThemeData appThemeLight = ThemeData(
    primaryColor: AppColors.blueGrey,
    scaffoldBackgroundColor: AppColors.white,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: AppColors.inputLabelColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.black,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.black,
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.yellow,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 80,
        color: AppColors.welcomeColor,
        fontWeight: FontWeight.bold,
        fontFamily: AppTheme.nautigalFont,
      ),
      displayMedium: TextStyle(
        color: AppColors.lightYellow,
        fontSize: 14,
        fontFamily: ubuntuFont,
      ),
      headlineSmall: TextStyle(
        color: AppColors.yellow,
        fontSize: 14,
        fontFamily: ubuntuFont,
      ),
      headlineMedium: TextStyle(
        fontSize: 30,
        color: AppColors.lightYellow,
        fontFamily: AppTheme.ubuntuFont,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        color: AppColors.black,
        fontSize: 20.0,
      ),
    ),
  );
}
