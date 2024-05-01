import 'package:flutter/material.dart';
import 'package:podcasty/extensions/media_query_extension.dart';
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
    final screenSize = context.screenSize;
    final themeData = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.03,
        horizontal: screenSize.width * 0.05,
      ),
      child: Align(
        alignment:
            isLeftOriented ? Alignment.centerLeft : Alignment.centerRight,
        child: Text(
          AppStrings.welcome,
          textAlign: TextAlign.center,
          style: themeData.textTheme.displayLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
