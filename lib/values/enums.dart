import 'package:podcasty/modules/auth/utils/auth_multiple_validators.dart';
import 'package:podcasty/values/common_validators.dart';
import 'package:podcasty/values/string_constants.dart';

enum InputValidationType {
  name,
  multipleRegex,
  password;

  String? validate(String? value) {
    return switch (this) {
      name when !CommonValidators.nameValidators.hasMatch(value ?? '') =>
        AppStrings.nameError,
      multipleRegex
          when !AuthMultipleValidators.validateWithMultipleRegex(value ?? '') =>
        AppStrings.multipleError,
      password
          when !CommonValidators.passwordValidators.hasMatch(value ?? '') =>
        AppStrings.passwordError,
      _ => null
    };
  }
}
