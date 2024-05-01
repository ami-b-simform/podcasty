import 'package:flutter/material.dart';
import 'package:podcasty/modules/auth/signin.dart';
import 'package:podcasty/modules/auth/utils/snack_bar_utils.dart';
import 'package:podcasty/values/app_theme.dart';

void main() {
  runApp(Podcasty());
}

class Podcasty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: SnackBarUtils.rootScaffoldMessengerKey,
      theme: AppTheme.appThemeLight,
      home: const SignInScreen(),
    );
  }
}
