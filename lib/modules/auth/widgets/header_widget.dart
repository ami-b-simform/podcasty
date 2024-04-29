import 'package:flutter/material.dart';
import 'package:podcasty/values/app_theme.dart';
import 'package:podcasty/values/string_constants.dart';

class HeaderWidget extends StatelessWidget {
  final bool isLeftOriented;

  const HeaderWidget({
    Key? key,
    this.isLeftOriented = true,
  }) : super(key: key);

  //Header component for Authentication module
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.01,
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Align(
        alignment:
            isLeftOriented ? Alignment.centerLeft : Alignment.centerRight,
        child: const Text(
          AppStrings.welcome,
          textAlign: TextAlign.center,
          style: AppTheme.displayHeading,
        ),
      ),
    );
  }
}
