class PasswordErrorMessages {
  static const requiredError = 'A senha é obrigatória';
  static const stringError = 'A senha deve ser uma string válida';
  static const minLengthError =
      'A senha está muito curta. O mínimo são 8 caracteres';
  static const weakPasswordPrefix = 'A senha está fraca.';
  static const weakPasswordUpperCase =
      '${PasswordErrorMessages.weakPasswordPrefix} Falta uma letra maiúscula';
  static const weakPasswordLowerCase =
      '${PasswordErrorMessages.weakPasswordPrefix} Falta uma letra minúscula';
  static const weakPasswordNumber =
      '${PasswordErrorMessages.weakPasswordPrefix} Falta um número';
  static const weakPasswordSpecialCharacter =
      '${PasswordErrorMessages.weakPasswordPrefix} Falta um símbolo';
}

class PasswordConstants {
  static const minLength = 8;
  static const upperCasePattern = r'[A-Z]';
  static const lowerCasePattern = r'[a-z]';
  static const numberPattern = r'[0-9]';
  static const specialCharacterPattern =
      r'[!@#\$%^&*(),.?":{}|<>\-_+=\[\]\\/;`~]';
}
