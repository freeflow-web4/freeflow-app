enum UiError {
  requiredField,
  somethingWrong,
  tooManyAttempts,
  invalidPrivateKey,
  userDisabled,
  serverError,
  noInternet,
  invalidUsername,
}

extension UiErrorExtension on UiError {
  String get message {
    switch (this) {
      case UiError.somethingWrong:
        return 'Something wrong!';
      case UiError.tooManyAttempts:
        return 'Too many attempts, try again later!';
      case UiError.invalidPrivateKey:
        return 'Invalid private key.';
      case UiError.userDisabled:
        return 'User disabled.';
      case UiError.serverError:
        return 'Internal server error.';
      case UiError.noInternet:
        return 'No internet found.';
      case UiError.invalidUsername:
        return 'Invalid username!';
      default:
        return 'Something wrong!';
    }
  }
}
