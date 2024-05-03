import 'package:flutter/material.dart';
import 'package:podcasty/models/button_appearance.dart';
import 'package:podcasty/models/input_appearance.dart';
import 'package:podcasty/modules/auth/widgets/auth_form.dart';
import 'package:podcasty/values/app_colors.dart';
import 'package:podcasty/values/enums.dart';
import 'package:podcasty/values/string_constants.dart';
import 'package:podcasty/widgets/input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: AuthForm(
            headerText: AppStrings.signUp,
            buttonText: AppStrings.signUp,
            formFields: [
              const InputField(
                keyboardType: TextInputType.text,
                hintText: AppStrings.hintName,
                suffixIcon: Icons.person_outlined,
                iconColor: AppColors.inputLabelColor,
                validationType: ValidationType.username,
                appearance: InputFieldAppearance(
                  cursorColor: AppColors.lightYellow,
                  fillColor: AppColors.blueGrey,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.lightYellow,
                    ),
                  ),
                ),
              ),
              const InputField(
                keyboardType: TextInputType.emailAddress,
                hintText: AppStrings.hintEmail,
                suffixIcon: Icons.telegram_outlined,
                iconColor: AppColors.inputLabelColor,
                validationType: ValidationType.multipleRegex,
                appearance: InputFieldAppearance(
                  cursorColor: AppColors.lightYellow,
                  fillColor: AppColors.blueGrey,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.lightYellow,
                    ),
                  ),
                ),
              ),
              InputField(
                keyboardType: TextInputType.visiblePassword,
                hintText: AppStrings.hintPassword,
                iconColor: AppColors.inputLabelColor,
                textInputAction: TextInputAction.done,
                appearance: const InputFieldAppearance(
                  cursorColor: AppColors.lightYellow,
                  fillColor: AppColors.blueGrey,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.lightYellow,
                    ),
                  ),
                ),
                suffixIcon: isObscure
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_red_eye,
                obscureText: isObscure,
                validationType: ValidationType.password,
                suffixIconPress: () => setState(
                  () => isObscure = !isObscure,
                ),
              ),
            ],
            appearance: const ButtonAppearance(
              backgroundColor: AppColors.lightYellow,
              textColor: AppColors.blueGrey,
            ),
            onPressed: () => Navigator.pop(context),
            footerText: AppStrings.haveAccount,
            footerSubText: AppStrings.signIn,
            onPressedFooterText: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}
