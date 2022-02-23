import 'package:freeflow/layers/presentation/helpers/errors/ui_error.dart';

abstract class FieldValidator {
  UiError? validateRequiredField(String input);
}
