import 'package:flutter/material.dart';
import 'package:podcasty/extensions/media_query_extension.dart';
import 'package:podcasty/values/app_theme.dart';
import 'package:podcasty/values/string_constants.dart';

class HeaderWidget extends StatelessWidget {
  final bool isLeftOriented;

  ///Header component for Authentication module
  const HeaderWidget({
    super.key,
    this.isLeftOriented = true,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = context.screenSize;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.01,
        horizontal: screenSize.width * 0.05,
      ),
      child: Align(
        alignment:
            isLeftOriented ? Alignment.centerLeft : Alignment.centerRight,
        child: const Text(
          AppStrings.welcome,
          textAlign: TextAlign.center,
          style: AppTheme.displayHeading,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
