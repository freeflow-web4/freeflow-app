import 'package:freeflow/layers/domain/validators/email_validator/email_validator.dart';

class EmailValidatorImpl implements EmailValidator {
  @override
  bool call(String email) {
    //TODO: verify this email validation
    return email.contains('@') && email.contains('.');
  }
}
