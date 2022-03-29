import 'package:freeflow/layers/domain/validators/private_key_validator/private_key_validator.dart';

class PrivateKeyValidatorImpl implements PrivateKeyValidator {
  @override
  bool call(
    String? text,
  ) {
    if ((text ?? '').isEmpty) {
      return false;
    }
    return true;
  }
}
