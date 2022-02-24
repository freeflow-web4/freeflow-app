import 'package:freeflow/layers/domain/helpers/errors/domain_error.dart';

abstract class FieldValidator {
  DomainError? validateRequiredField(String input);
}
