import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

enum UserCreateWalletErrorType {
  userAlreadyExists,
  emailNotValid,
  domainError,
  somethingElse
}

class UserCreateWalletError {
  final UserCreateWalletErrorType errorType;
  final String message;

  UserCreateWalletError({
    required this.errorType,
    required this.message,
  });

  @override
  String toString() {
    return 'UserCreateWalletError{errorType: $errorType, message: $message}';
  }

  static UserCreateWalletError convertFromResponse(String response) {
    switch (response) {
      case 'USER_ALREADY_EXISTS':
        return UserCreateWalletError(
          errorType: UserCreateWalletErrorType.userAlreadyExists,
          message: response,
        );
      case 'EMAIL_IS_NOT_VALID':
        return UserCreateWalletError(
          errorType: UserCreateWalletErrorType.emailNotValid,
          message: response,
        );
      default:
        return UserCreateWalletError(
          errorType: UserCreateWalletErrorType.domainError,
          message: response,
        );
    }
  }

  DomainError toDomainError() {
    return convertToDomainError(message);
  }
}
