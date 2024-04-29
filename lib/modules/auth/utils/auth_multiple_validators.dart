import 'package:podcasty/values/common_validators.dart';

class AuthMultipleValidators {
  static bool validateWithMultipleRegex(String value) {
    const emailPattern = CommonValidators.emailValidators;
    const phonePattern = CommonValidators.numberValidators;
    const namePattern = CommonValidators.nameValidators;

    return RegExp(emailPattern).hasMatch(value) ||
        RegExp(phonePattern).hasMatch(value) ||
        RegExp(namePattern).hasMatch(value);
  }
}
