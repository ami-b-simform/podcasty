import 'package:flutter/material.dart';
import 'package:podcasty/values/app_theme.dart';

class FormHeader extends StatelessWidget {
  final String headerText;
  final bool isLeftOriented;

  const FormHeader({
    Key? key,
    required this.headerText,
    this.isLeftOriented = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isLeftOriented ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        children: [
          Text(headerText, style: AppTheme.displaySubHeading),
          Image.asset(
            'assets/images/arrow.png',
          ),
        ],
      ),
    );
  }
}
