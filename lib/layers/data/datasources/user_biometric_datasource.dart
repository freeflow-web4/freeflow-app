abstract class UserBiometricsDataSource {
  Future<String> getHasBiometrics();
  Future<String> setHasBiometrics(String hasBiometrics);
}
