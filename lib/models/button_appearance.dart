import 'package:flutter/material.dart';

///Model for button
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
