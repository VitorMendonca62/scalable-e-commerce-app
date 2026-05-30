class PasswordHelper {
  static String addPrefix(String text, String? type) {
    if (type == 'new') {
      return text.replaceAll('senha', 'nova senha');
    }
    if (type == 'old') {
      return text.replaceAll('senha', 'senha antiga');
    }

    return text;
  }
}
