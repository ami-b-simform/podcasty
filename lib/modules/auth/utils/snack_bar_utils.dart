import 'package:flutter/material.dart';
import 'package:podcasty/values/app_colors.dart';
import 'package:podcasty/values/app_theme.dart';

class SnackBarUtils {
  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String message) {
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTheme.appThemeLight.textTheme.headlineLarge,
        ),
        backgroundColor: AppColors.inputLabelColor,
      ),
    );
  }
}
