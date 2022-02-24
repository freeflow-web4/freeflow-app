enum DomainError {
  somethingWrong,
  tooManyAttempts,
  invalidPrivateKey,
  userDisabled,
  serverError,
  noInternet,
  invalidUsername,
}

DomainError convertToDomainError(String error) {
  switch (error) {
    case 'Exception: Something wrong!':
      return DomainError.somethingWrong;
    case 'Exception: Too many attempts, try again later!':
      return DomainError.tooManyAttempts;
    case 'Exception: Invalid private key.':
      return DomainError.invalidPrivateKey;
    case 'Exception: User disabled.':
      return DomainError.userDisabled;
    case 'Exception: Internal server error.':
      return DomainError.serverError;
    case 'Exception: No internet found.':
      return DomainError.noInternet;
    case 'Exception: Invalid username!':
      return DomainError.invalidUsername;
    default:
      return DomainError.somethingWrong;
  }
}
