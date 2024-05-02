import 'package:flutter/material.dart';

///Models for inout field
class InputFieldAppearance {
  final Color? cursorColor;
  final Color? fillColor;
  final EdgeInsets? padding;
  final double? borderRadius;
  final double? cornerRadius;
  final EdgeInsets? contentPadding;
  final double? labelFontSize;
  final FontWeight? labelFontWeight;
  final Color? labelColor;
  final InputBorder? focusedBorder;

  const InputFieldAppearance({
    this.cursorColor,
    this.fillColor,
    this.padding,
    this.borderRadius,
    this.cornerRadius,
    this.contentPadding,
    this.labelFontSize,
    this.labelFontWeight,
    this.labelColor,
    this.focusedBorder,
  });
}
