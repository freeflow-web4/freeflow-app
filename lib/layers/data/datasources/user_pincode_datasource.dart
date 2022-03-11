abstract class UserPincodeDatasource {
  Future<bool> getPincode();
  Future<bool> setPincode(String pincode);
}
