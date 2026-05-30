import 'package:form_validator/form_validator.dart';
import 'package:scalable_e_commerce_app/core/constants/email.dart';
import 'package:scalable_e_commerce_app/core/constants/password.dart';
import 'package:scalable_e_commerce_app/modules/auth/presentation/helpers/password_helper.dart';

final emailValidator =
    ValidationBuilder(requiredMessage: EmailErrorMessages.requiredError)
        .required(EmailErrorMessages.requiredError)
        .email(EmailErrorMessages.invalidError)
        .build();

String? Function(String?) assemblePasswordValidator(String? type) {
  return ValidationBuilder(requiredMessage: PasswordErrorMessages.requiredError)
      .required(
        PasswordHelper.addPrefix(PasswordErrorMessages.requiredError, type),
      )
      .minLength(
        PasswordConstants.minLength,
        PasswordHelper.addPrefix(PasswordErrorMessages.minLengthError, type),
      )
      .regExp(
        RegExp(PasswordConstants.upperCasePattern),
        PasswordHelper.addPrefix(
          PasswordErrorMessages.weakPasswordUpperCase,
          type,
        ),
      )
      .regExp(
        RegExp(PasswordConstants.lowerCasePattern),
        PasswordHelper.addPrefix(
          PasswordErrorMessages.weakPasswordLowerCase,
          type,
        ),
      )
      .regExp(
        RegExp(PasswordConstants.numberPattern),
        PasswordHelper.addPrefix(
          PasswordErrorMessages.weakPasswordNumber,
          type,
        ),
      )
      .regExp(
        RegExp(PasswordConstants.specialCharacterPattern),
        PasswordHelper.addPrefix(
          PasswordErrorMessages.weakPasswordSpecialCharacter,
          type,
        ),
      )
      .build();
}
