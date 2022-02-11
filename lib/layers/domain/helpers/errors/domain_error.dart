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

  DomainError fromError(String error) {
    switch (error) {
      case 'Something wrong!':
        return DomainError.somethingWrong;
      case 'Too many attempts, try again later!':
        return DomainError.tooManyAttempts;
      case 'Invalid private key.':
        return DomainError.invalidPrivateKey;
      case 'User disabled.':
        return DomainError.userDisabled;
      case 'Internal server error.':
        return DomainError.serverError;
      case 'No internet found.':
        return DomainError.noInternet;
      case 'Invalid username!':
        return DomainError.invalidUsername;
      default:
        return DomainError.somethingWrong;
    }
  }
}
