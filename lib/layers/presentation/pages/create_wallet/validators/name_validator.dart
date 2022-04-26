class CreateWalletNameValidator {
  static bool isValid(String value) {
    return value.length >= 3;
  }
}