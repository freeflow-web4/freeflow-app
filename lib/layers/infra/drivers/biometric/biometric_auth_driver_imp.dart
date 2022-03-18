import 'package:dartz/dartz.dart';
import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/infra/drivers/biometric/biometric_auth_driver.dart';
import 'package:local_auth/local_auth.dart';

class BiometricAuthDriverImp implements BiometricAuthDriver {
  final LocalAuthentication _localAuthentication;
  BiometricAuthDriverImp(this._localAuthentication);

  @override
  Future<Either<DomainError, List<dynamic>>> getAvailableBiometrics() async {
    try {
      List<BiometricType> biometrics =
          await _localAuthentication.getAvailableBiometrics();
      return Right(biometrics);
    } catch (e) {
      return const Left(DomainError.somethingWrong);
    }
  }

  @override
  Future<Either<DomainError, bool>> isBiometricAvailable() async {
    try {
      bool isAvailable = await _localAuthentication.canCheckBiometrics;
      return Right(isAvailable);
    } catch (e) {
      return const Left(DomainError.somethingWrong);
    }
  }

  @override
  Future<Either<DomainError, bool>> authenticateUser() async {
    bool _isBiometricAvailable = false;
    final isBiometricAvailableResponse = await isBiometricAvailable();
    isBiometricAvailableResponse.fold(
      (l) => _isBiometricAvailable = false,
      (r) => _isBiometricAvailable = r,
    );
    if (_isBiometricAvailable) {
      try {
        bool isAuthenticated = await _localAuthentication.authenticate(
          localizedReason: 'Please authenticate to continue',
          useErrorDialogs: true,
          stickyAuth: true,
        );
        return Right(isAuthenticated);
      } catch (e) {
        return const Left(DomainError.somethingWrong);
      }
    } else {
      return const Left(DomainError.somethingWrong);
    }
  }
}
