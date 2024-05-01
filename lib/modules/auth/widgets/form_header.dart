import 'package:flutter/material.dart';
import 'package:podcasty/values/assets_path.dart';

class FormHeader extends StatelessWidget {
  final String headerText;
  final bool isLeftOriented;

  ///Form Header component for Authentication module
  const FormHeader({
    super.key,
    required this.headerText,
    this.isLeftOriented = true,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Align(
      alignment: isLeftOriented ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        children: [
          Text(
            headerText,
            style: themeData.textTheme.headlineMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Image.asset(
            AssetsPath.arrowAsset,
          ),
        ],
      ),
    );
  }
}
