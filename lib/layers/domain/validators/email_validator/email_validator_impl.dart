import 'package:freeflow/layers/domain/validators/email_validator/email_validator.dart';

class EmailValidatorImpl implements EmailValidator {
  @override
  bool call(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }
}
