import 'package:freeflow/layers/domain/validators/pin_validator/pin_validator.dart';
import 'package:freeflow/layers/domain/validators/pin_validator/pin_validator_impl.dart';
import 'package:freeflow/layers/domain/validators/private_key_validator/private_key_validator.dart';
import 'package:freeflow/layers/domain/validators/private_key_validator/private_key_validator_impl.dart';
import 'package:freeflow/layers/domain/validators/username_validator/username_validator.dart';
import 'package:freeflow/layers/domain/validators/username_validator/username_validator_impl.dart';
import 'package:get_it/get_it.dart';

registerValidatorDependencies(GetIt getIt) {
  getIt.registerFactory<PinValidator>(
    () => PinValidatorImpl(),
  );
  getIt.registerFactory<UsernameValidator>(
    () => UsernameValidatorImpl(),
  );
  getIt.registerFactory<PrivateKeyValidator>(
    () => PrivateKeyValidatorImpl(),
  );
}
