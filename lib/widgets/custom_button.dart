import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcasty/values/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonAppearance appearance;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.appearance = const ButtonAppearance(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: appearance.padding ??
            EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
                horizontal: MediaQuery.of(context).size.width * 0.05),
        decoration: BoxDecoration(
          color: appearance.backgroundColor ?? AppColors.blueGrey,
          borderRadius: BorderRadius.circular(appearance.borderRadius ?? 5),
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
        ),
      ),
    );
  }

  CustomButton copyWith({
    String? text,
    VoidCallback? onPressed,
    ButtonAppearance? appearance,
  }) {
    return CustomButton(
      key: key,
      text: text ?? this.text,
      onPressed: onPressed ?? this.onPressed,
      appearance: appearance ?? this.appearance,
    );
  }
}

class ButtonAppearance {
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;

  const ButtonAppearance({
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.horizontalPadding,
    this.verticalPadding,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.fontWeight,
    this.padding,
  });
}
