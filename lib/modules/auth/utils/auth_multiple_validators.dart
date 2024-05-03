import 'package:podcasty/values/common_validators.dart';

class AuthMultipleValidators {
  ///Function to validate multiple regex
  static bool validateWithMultipleRegex(String value) {
    return CommonValidators.emailValidators.hasMatch(value) ||
        CommonValidators.numberValidators.hasMatch(value) ||
        CommonValidators.userNameValidators.hasMatch(value);
  }
}
