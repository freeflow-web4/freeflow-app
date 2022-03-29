import 'package:freeflow/layers/domain/validators/username_validator/username_validator.dart';

class UsernameValidatorImpl implements UsernameValidator {
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
