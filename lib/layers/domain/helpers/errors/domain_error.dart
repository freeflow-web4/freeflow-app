enum DomainError {
  requiredField,
  somethingWrong,
  tooManyAttempts,
  invalidPrivateKey,
  userDisabled,
  serverError,
  noInternet,
  invalidUsername,
  cacheError,
  slowConnection,
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
      case DomainError.cacheError:
        return 'Cache error!';
      case DomainError.slowConnection:
        return 'Your connection is too slow!';
      default:
        return 'Something wrong!';
    }
  }
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
    case 'Exception: Cache error!':
      return DomainError.cacheError;
    case 'Exception: Connecting timed out [30000ms]':
      return DomainError.noInternet;
    case "Exception: SocketException: Failed host lookup: 'develop-api.freeflow.devmagic.com.br' (OS Error: No address associated with hostname, errno = 7)":
      return DomainError.noInternet;
    default:
      return DomainError.somethingWrong;
  }
}
