import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcasty/modules/auth/signin.dart';
import 'package:podcasty/modules/auth/widgets/form_header.dart';
import 'package:podcasty/modules/auth/widgets/header_widget.dart';
import 'package:podcasty/values/app_colors.dart';
import 'package:podcasty/values/app_theme.dart';
import 'package:podcasty/values/string_constants.dart';
import 'package:podcasty/widgets/custom_button.dart';
import 'package:podcasty/widgets/input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignupForm createState() => SignupForm();
}

class SignupForm extends State<SignUpScreen> {
  final signupFormKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const HeaderWidget(isLeftOriented: true),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8 + 16,
                    decoration: const BoxDecoration(
                      color: AppColors.blueGrey,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(130.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                      child: Form(
                        key: signupFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05),
                            const FormHeader(
                              headerText: AppStrings.signUp,
                              isLeftOriented: true,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            InputField(
                              keyboardType: TextInputType.text,
                              hintText: AppStrings.hintName,
                              suffixIcon: Icons.person_outlined,
                              iconColor: AppColors.inputLabelColor,
                              validationType: ValidationType.name,
                              appearance: const InputFieldAppearance(
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
                              keyboardType: TextInputType.emailAddress,
                              hintText: AppStrings.hintEmail,
                              suffixIcon: Icons.telegram_outlined,
                              iconColor: AppColors.inputLabelColor,
                              validationType: ValidationType.multipleRegex,
                              appearance: const InputFieldAppearance(
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
                              suffixIconPress: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.07),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: CustomButton(
                                text: AppStrings.signUp,
                                onPressed: () {
                                  if (signupFormKey.currentState!.validate()) {
                                    Navigator.pop(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            const SignInScreen(),
                                      ),
                                    );
                                  }
                                },
                                appearance: const ButtonAppearance(
                                  backgroundColor: AppColors.lightYellow,
                                  textColor: AppColors.blueGrey,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Checkbox(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                        ),
                                        side:
                                            MaterialStateBorderSide.resolveWith(
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
                                      const Text(AppStrings.rememberMe,
                                          style: AppTheme.displayMedium),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.05),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text(
                                      AppStrings.haveAccount,
                                      style: AppTheme.displayMedium,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pop(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) =>
                                                  const SignInScreen(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          ' ${AppStrings.signIn}',
                                          style: TextStyle(
                                            color: AppColors.yellow,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AppTheme.ubuntuFont,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
