final RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

class Validators {
  static bool isValidEmail(String email) {
    return emailRegex.hasMatch(email);
  }
}
