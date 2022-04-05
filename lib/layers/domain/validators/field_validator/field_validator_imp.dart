import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/domain/validators/field_validator/field_validator.dart';

class FieldValidatorImp implements FieldValidator {
  @override
  DomainError? validateRequiredField(String input) =>
      input.isNotEmpty == true ? null : DomainError.requiredField;
}
