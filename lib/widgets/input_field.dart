import 'package:flutter/material.dart';
import 'package:podcasty/modules/auth/utils/auth_multiple_validators.dart';
import 'package:podcasty/values/app_colors.dart';
import 'package:podcasty/values/common_validators.dart';
import 'package:podcasty/values/string_constants.dart';

enum InputType { email, phoneNumber, name }

enum ValidationType { name, multipleRegex, password }

class InputField extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final InputFieldAppearance appearance;
  final Color? iconColor;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;
  final void Function()? suffixIconPress;
  final ValidationType validationType;

  InputField(
      {Key? key,
      required this.hintText,
      this.suffixIcon,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.appearance = const InputFieldAppearance(),
      this.iconColor = AppColors.black,
      this.textInputAction = TextInputAction.next,
      this.onSubmitted,
      this.suffixIconPress,
      this.validationType = ValidationType.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: appearance.padding ??
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextFormField(
        cursorColor: appearance.cursorColor ?? AppColors.black,
        textAlign: TextAlign.center,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: 1,
        style: TextStyle(color: appearance.cursorColor),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        textInputAction: textInputAction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          switch (validationType) {
            case ValidationType.name:
              if (!RegExp(CommonValidators.nameValidators).hasMatch(value)) {
                return AppStrings.nameError;
              }
              break;
            case ValidationType.multipleRegex:
              if (!AuthMultipleValidators.validateWithMultipleRegex(value)) {
                return AppStrings.multipleError;
              }
              break;
            case ValidationType.password:
              if (!RegExp(CommonValidators.passwordValidators)
                  .hasMatch(value)) {
                return AppStrings.passwordError;
              }
              break;
          }
          return null; // Return null if validation passes
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: appearance.fillColor ?? AppColors.lightYellow,
          contentPadding: appearance.contentPadding ??
              const EdgeInsets.symmetric(vertical: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                appearance.borderRadius ?? appearance.cornerRadius ?? 10.0),
          ),
          suffixIcon: suffixIcon != null
              ? suffixIconPress != null
                  ? IconButton(
                      icon: Icon(suffixIcon, color: iconColor),
                      onPressed: suffixIconPress)
                  : Icon(suffixIcon, color: iconColor)
              : null,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: appearance.labelFontSize ?? 12,
            fontWeight: appearance.labelFontWeight ?? FontWeight.bold,
            color: appearance.labelColor ?? AppColors.inputLabelColor,
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.lightYellow)),
          focusedBorder: appearance.focusedBorder ??
              const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.black),
              ),
        ),
      ),
    );
  }

  InputField copyWith({
    String? hintText,
    IconData? suffixIcon,
    bool? obscureText,
    TextInputType? keyboardType,
    InputFieldAppearance? appearance,
    ValidationType? validationType,
    ValueChanged<String>? onChanged,
  }) {
    return InputField(
      key: key,
      hintText: hintText ?? this.hintText,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      obscureText: obscureText ?? this.obscureText,
      keyboardType: keyboardType ?? this.keyboardType,
      appearance: appearance ?? this.appearance,
      validationType: validationType ?? this.validationType,
    );
  }
}

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
