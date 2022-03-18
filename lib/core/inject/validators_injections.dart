import 'package:freeflow/layers/domain/validators/pin_validator.dart';
import 'package:freeflow/layers/domain/validators/pin_validator_impl.dart';
import 'package:get_it/get_it.dart';

registerValidatorDependencies(GetIt getIt) {
  getIt.registerFactory<PinValidator>(
    () => PinValidatorImpl(),
  );
}
