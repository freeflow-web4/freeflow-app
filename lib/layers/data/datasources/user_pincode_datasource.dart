abstract class UserPincodeDatasource {
  Future<String> getPincode();
  Future<bool> setPincode(String pincode);
}
