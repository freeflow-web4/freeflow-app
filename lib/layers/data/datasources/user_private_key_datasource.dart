abstract class UserPrivateKeyDatasource {
  Future<String> getPrivateKey();
  Future<bool> setPrivateKey(String value);
}
