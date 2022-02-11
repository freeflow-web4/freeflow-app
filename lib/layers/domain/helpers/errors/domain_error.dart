enum DomainError {
  somethingWrong,
  tooManyAttempts,
  invalidPrivateKey,
  userDisabled,
  serverError,
  noInternet,
  invalidUsername,
}

extension DomainErrorExtension on DomainError {
  String get message {
    switch (this) {
      case DomainError.somethingWrong:
        return 'Something wrong!';
      case DomainError.tooManyAttempts:
        return 'Too many attempts, try again later!';
      case DomainError.invalidPrivateKey:
        return 'Invalid private key.';
      case DomainError.userDisabled:
        return 'User disabled.';
      case DomainError.serverError:
        return 'Internal server error.';
      case DomainError.noInternet:
        return 'No internet found.';
      case DomainError.invalidUsername:
        return 'Invalid username!';
    }
  }
}
