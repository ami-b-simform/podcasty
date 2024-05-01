import 'package:flutter/material.dart';
import 'package:podcasty/models/button_appearance.dart';
import 'package:podcasty/modules/auth/utils/snack_bar_utils.dart';
import 'package:podcasty/modules/auth/widgets/form_header.dart';
import 'package:podcasty/modules/auth/widgets/header_widget.dart';
import 'package:podcasty/values/app_colors.dart';
import 'package:podcasty/values/string_constants.dart';
import 'package:podcasty/widgets/custom_button.dart';

class AuthForm extends StatefulWidget {
  final String headerText;
  final List<Widget> formFields;
  final VoidCallback onPressed;
  final String buttonText;
  final bool showRememberMe;
  final bool isSignUp;
  final ButtonAppearance appearance;
  final VoidCallback onPressedFooterText;
  final String footerText;
  final String footerSubText;

  const AuthForm({
    super.key,
    required this.headerText,
    required this.formFields,
    required this.onPressed,
    required this.buttonText,
    this.showRememberMe = false,
    this.isSignUp = false,
    this.appearance = const ButtonAppearance(),
    required this.footerText,
    required this.footerSubText,
    required this.onPressedFooterText,
  });

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.height * 0.05;
    final width = screenSize.width * 0.05;
    final smallHeight = screenSize.height * 0.02;
    final themeData = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HeaderWidget(
          isLeftOriented: widget.isSignUp,
        ),
        Container(
          height: screenSize.height,
          decoration: BoxDecoration(
            color: AppColors.blueGrey,
            borderRadius: BorderRadius.only(
              topRight:
                  widget.isSignUp ? const Radius.circular(130.0) : Radius.zero,
              topLeft:
                  widget.isSignUp ? Radius.zero : const Radius.circular(130.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: smallHeight),
                  FormHeader(
                    headerText: widget.headerText,
                    isLeftOriented: widget.isSignUp,
                  ),
                  SizedBox(height: height),
                  ...widget.formFields,
                  SizedBox(height: screenSize.height * 0.08),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width),
                    child: CustomButton(
                      appearance: widget.appearance,
                      text: widget.buttonText,
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          widget.onPressed();
                        }
                      },
                    ),
                  ),
                  SizedBox(height: smallHeight),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            Checkbox(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(2.0),
                                ),
                              ),
                              side: const BorderSide(
                                width: 1.0,
                                color: AppColors.lightYellow,
                              ),
                              value: rememberMe,
                              activeColor: AppColors.transparentColor,
                              onChanged: updateRememberMe,
                            ),
                            Text(
                              AppStrings.rememberMe,
                              style: themeData.textTheme.displayMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Visibility(
                          visible: !widget.isSignUp,
                          child: InkWell(
                            onTap: () {
                              if (mounted) {
                                SnackBarUtils.showSnackBar(
                                  AppStrings.forgotPasswordValue,
                                );
                              }
                            },
                            child: Text(
                              AppStrings.forgotPassword,
                              style: themeData.textTheme.displayMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.footerText,
                          style: themeData.textTheme.displayMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: smallHeight),
                          child: InkWell(
                            onTap: widget.onPressedFooterText,
                            child: Text(
                              ' ${widget.footerSubText}',
                              style: themeData.textTheme.headlineSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void updateRememberMe(bool? value) {
    if (value != null) {
      setState(
        () => rememberMe = value,
      );
    }
  }
}
