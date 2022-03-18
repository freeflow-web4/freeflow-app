abstract class UserBiometricsDataSource {
  Future<bool> getHasBiometrics();
  Future<bool> setHasBiometrics(bool hasBiometrics);
}
