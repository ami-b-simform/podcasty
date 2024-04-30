import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcasty/models/button_appearance.dart';
import 'package:podcasty/values/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonAppearance appearance;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.appearance = const ButtonAppearance(),
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: appearance.padding ??
            EdgeInsets.symmetric(
              vertical: mediaQuery.height * 0.01,
              horizontal: mediaQuery.width * 0.05,
            ),
        decoration: BoxDecoration(
          color: appearance.backgroundColor ?? AppColors.blueGrey,
          borderRadius: BorderRadius.circular(
            appearance.borderRadius ?? 5,
          ),
          border: Border.all(
            color: appearance.borderColor ?? AppColors.lightYellow,
            width: appearance.borderWidth ?? 1,
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: appearance.textColor ?? AppColors.lightYellow,
            fontSize: appearance.fontSize ?? 16,
            fontWeight: appearance.fontWeight ?? FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
