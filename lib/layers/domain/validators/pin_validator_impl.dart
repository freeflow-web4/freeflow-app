import 'package:flutter/material.dart';
import 'package:freeflow/layers/domain/validators/pin_validator.dart';

class PinValidatorImpl extends PinValidator {
  @override
  bool call(
    String? text,
  ) {
    if ((text ?? '').isEmpty || (text ?? '').length < 4) {
      return false;
    }
    return true;
  }
}
