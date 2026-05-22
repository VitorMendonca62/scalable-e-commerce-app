import 'package:form_validator/form_validator.dart';
import 'package:scalable_e_commerce_app/core/constants/email.dart';
import 'package:scalable_e_commerce_app/core/constants/password.dart';
import 'package:scalable_e_commerce_app/modules/auth/presentation/helpers/password_helper.dart';

final emailValidator = ValidationBuilder()
    .required(EmailErrorMessages.requiredError)
    .email(EmailErrorMessages.invalidError)
    .build();

String? Function(String?) assemblePasswordValidator(String type) {
  return ValidationBuilder()
      .required(
        PasswordHelper.addPrefix(PasswordErrorMessages.requiredError, type),
      )
      .minLength(
        PasswordConstants.minLength,
        PasswordHelper.addPrefix(PasswordErrorMessages.minLengthError, type),
      )
      .regExp(
        RegExp(r'[A-Z]'),
        PasswordHelper.addPrefix(
          PasswordErrorMessages.weakPassowordError,
          type,
        ),
      )
      .regExp(
        RegExp(r'[a-z]'),
        PasswordHelper.addPrefix(
          PasswordErrorMessages.weakPassowordError,
          type,
        ),
      )
      .regExp(
        RegExp(r'[0-9]'),
        PasswordHelper.addPrefix(
          PasswordErrorMessages.weakPassowordError,
          type,
        ),
      )
      .regExp(
        RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
        PasswordHelper.addPrefix(
          PasswordErrorMessages.weakPassowordError,
          type,
        ),
      )
      .build();
}
