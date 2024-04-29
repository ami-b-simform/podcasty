import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcasty/modules/auth/signup.dart';
import 'package:podcasty/modules/auth/widgets/form_header.dart';
import 'package:podcasty/modules/auth/widgets/header_widget.dart';
import 'package:podcasty/values/app_theme.dart';
import 'package:podcasty/values/string_constants.dart';
import 'package:podcasty/widgets/custom_button.dart';
import 'package:podcasty/widgets/input_field.dart';

import '../../values/app_colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  SigninForm createState() => SigninForm();
}

class SigninForm extends State<SignInScreen> {
  final signinFormKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeaderWidget(
              isLeftOriented: false,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.8 + 16,
              decoration: const BoxDecoration(
                color: AppColors.blueGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(130.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.04),
                child: Form(
                  key: signinFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      const FormHeader(
                        headerText: AppStrings.signIn,
                        isLeftOriented: false,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      InputField(
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
                        suffixIconPress: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: CustomButton(
                          text: AppStrings.signIn,
                          onPressed: () {
                            if (signinFormKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Hey! There '),
                                  backgroundColor: AppColors.inputLabelColor,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) => const BorderSide(
                                        width: 1.0,
                                        color: AppColors.lightYellow),
                                  ),
                                  value: rememberMe,
                                  activeColor: Colors.transparent,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      rememberMe = value!;
                                    });
                                  },
                                ),
                                const Text(
                                  AppStrings.rememberMe,
                                  style: AppTheme.displayMedium,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        AppStrings.forgotPasswordValue,
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 20.0)),
                                    backgroundColor: AppColors.inputLabelColor,
                                  ),
                                );
                              },
                              child: const Text(
                                AppStrings.forgotPassword,
                                style: AppTheme.displayMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              AppStrings.dontHaveAccount,
                              style: AppTheme.displayMedium,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.02),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  ' ${AppStrings.register}',
                                  style: TextStyle(
                                    color: AppColors.yellow,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTheme.ubuntuFont,
                                  ),
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
        ),
      ),
    ));
  }
}
