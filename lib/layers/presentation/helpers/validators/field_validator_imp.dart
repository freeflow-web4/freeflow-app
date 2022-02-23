import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';
import 'package:freeflow/layers/presentation/helpers/errors/ui_error.dart';
import 'package:freeflow/layers/presentation/helpers/validators/field_validator.dart';

class FieldValidatorImp implements FieldValidator {
  @override
  UiError? validateRequiredField(String input) =>
      input.isNotEmpty == true ? null : UiError.requiredField;
}
