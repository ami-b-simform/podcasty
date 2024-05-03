import 'package:flutter/material.dart';
import 'package:podcasty/models/input_appearance.dart';
import 'package:podcasty/values/app_colors.dart';
import 'package:podcasty/values/enums.dart';
import 'package:podcasty/values/string_constants.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final InputFieldAppearance appearance;
  final Color iconColor;
  final TextInputAction? textInputAction;
  final ValueSetter<String>? onSubmitted;
  final VoidCallback? suffixIconPress;
  final ValidationType validationType;

  const InputField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.appearance = const InputFieldAppearance(),
    this.iconColor = AppColors.black,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
    this.suffixIconPress,
    this.validationType = ValidationType.username,
  });

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
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        textInputAction: textInputAction,
        validator: validateInput,
        decoration: InputDecoration(
          filled: true,
          fillColor: appearance.fillColor ?? AppColors.lightYellow,
          contentPadding: appearance.contentPadding ??
              const EdgeInsets.symmetric(vertical: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              appearance.borderRadius ?? appearance.cornerRadius ?? 10.0,
            ),
          ),
          suffixIcon: suffixIcon == null
              ? null
              : IconButton(
                  icon: Icon(
                    suffixIcon,
                    color: iconColor,
                  ),
                  onPressed: suffixIconPress ?? () {},
                ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: appearance.labelFontSize ?? 12,
            fontWeight: appearance.labelFontWeight ?? FontWeight.bold,
            color: appearance.labelColor ?? AppColors.inputLabelColor,
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.lightYellow,
          )),
          focusedBorder: appearance.focusedBorder ??
              const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.black,
                ),
              ),
        ),
      ),
    );
  }

  String? validateInput(String? value) {
    value = value?.trim(); // Trim the value
    if (value?.isEmpty ?? true) {
      return AppStrings.emptyError;
    }
    return validationType.validate(value); // Validate the trimmed value
  }
}
