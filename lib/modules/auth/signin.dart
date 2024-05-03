import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcasty/modules/auth/signup.dart';
import 'package:podcasty/modules/auth/utils/snack_bar_utils.dart';
import 'package:podcasty/modules/auth/widgets/auth_form.dart';
import 'package:podcasty/values/enums.dart';
import 'package:podcasty/values/string_constants.dart';
import 'package:podcasty/widgets/input_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: AuthForm(
            headerText: AppStrings.signIn,
            buttonText: AppStrings.signIn,
            formFields: [
              const InputField(
                hintText: AppStrings.hintUser,
                keyboardType: TextInputType.emailAddress,
                suffixIcon: Icons.person_outlined,
                validationType: ValidationType.multipleRegex,
              ),
              InputField(
                hintText: AppStrings.hintPassword,
                validationType: ValidationType.password,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: isObscure
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_red_eye,
                obscureText: isObscure,
                suffixIconPress: () => setState(
                  () => isObscure = !isObscure,
                ),
              ),
            ],
            onPressed: () {
              if (mounted) {
                SnackBarUtils.showSnackBar(AppStrings.signedIn);
              }
            },
            footerText: AppStrings.dontHaveAccount,
            footerSubText: AppStrings.register,
            onPressedFooterText: moveToSignup,
          ),
        ),
      ),
    );
  }

  void moveToSignup() => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => const SignUpScreen(),
        ),
      );
}
