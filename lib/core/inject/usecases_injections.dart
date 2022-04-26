import 'package:freeflow/layers/domain/repositories/wallet_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_biometrics_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_create_wallet_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_local_auth_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_pincode_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_profile_repository.dart';
import 'package:freeflow/layers/domain/repositories/user_recover_login_repository.dart';
import 'package:freeflow/layers/domain/repositories/username_exists_repository.dart';
import 'package:freeflow/layers/domain/usecases/edit_profile/edit_profile_usecase.dart';
import 'package:freeflow/layers/domain/usecases/edit_profile/edit_profile_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/get_collectibles/get_collectibles_usecase.dart';
import 'package:freeflow/layers/domain/usecases/get_profile/get_profile_usecase.dart';
import 'package:freeflow/layers/domain/usecases/get_profile/get_profile_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/get_transcript_details/get_transcript_details_usecase.dart';
import 'package:freeflow/layers/domain/usecases/get_transcript_details/get_transcript_details_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/get_transcripts/get_transcripts_usecase.dart';
import 'package:freeflow/layers/domain/usecases/get_transcripts/get_transcripts_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_check_pincode/user_check_pincode_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_check_pincode/user_check_pincode_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_create_wallet/user_create_wallet_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_create_wallet/user_create_wallet_usecase_impl.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_has_biometric/user_has_biometric_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/get_user_local_auth_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/get_user_local_auth_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/get_user_is_logged_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/get_user_is_logged_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/save_user_is_logged_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/save_user_is_logged_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/save_user_local_auth_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_local_auth/save_user_local_auth_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_recover_login/user_recover_login_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_recover_login/user_recover_login_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_biometric/user_set_biometric_usecase_imp.dart';
import 'package:freeflow/layers/domain/usecases/user_set_pincode/user_set_pincode_usecase.dart';
import 'package:freeflow/layers/domain/usecases/user_set_pincode/user_set_pincode_usecase_Imp.dart';
import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase.dart';
import 'package:freeflow/layers/domain/usecases/username_exist/get_username_exists_usecase_imp.dart';
import 'package:freeflow/layers/domain/validators/field_validator/field_validator_imp.dart';
import 'package:get_it/get_it.dart';
import '../../layers/domain/repositories/collectibles_repository.dart';
import '../../layers/domain/usecases/get_collectibles/get_collectibles_usecase_imp.dart';

registerUsecasesDependencies(GetIt getIt) {
  getIt.registerFactory<UserRecoverLoginUseCase>(
    () => UserRecoverLoginUseCaseImp(
      repository: GetIt.I.get<UserRecoverLoginRepository>(),
      fieldValidator: FieldValidatorImp(),
    ),
  );

  getIt.registerFactory<UserHasBiometricsUsecase>(
    () => UserHasBiometricsUsecaseImp(GetIt.I.get<UserBiometricsRepository>()),
  );

  getIt.registerFactory<UserSetBiometricsUsecase>(
    () => UserSetBiometricsUsecaseImp(GetIt.I.get<UserBiometricsRepository>()),
  );

  getIt.registerFactory<UserSetPincodeUsecase>(
    () => UserSetPincodeUsecaseImp(GetIt.I.get<UserPincodeRepository>()),
  );

  getIt.registerFactory<UserCheckPinCodeUsecase>(
    () => UserCheckPinCodeUsecaseImp(GetIt.I.get<UserPincodeRepository>()),
  );

  getIt.registerFactory<GetUsernameExistsUsecase>(
    () => GetUsernameExistsUsecaseImp(GetIt.I.get<UsernameExistsRepository>()),
  );
  getIt.registerFactory<SaveUserLocalAuthUsecase>(
    () => SaveUserLocalAuthUsecaseImp(GetIt.I.get<UserLocalAuthRepository>()),
  );

  getIt.registerFactory<UserCreateWalletUseCase>(
    () => UserCreateWalletUseCaseImpl(
      GetIt.I.get<UserCreateWalletRepository>(),
    ),
  );

  getIt.registerFactory<GetTranscripListUsecase>(
      () => GetTranscripListImp(GetIt.I.get<WalletRepository>()));

  getIt.registerFactory<GetTranscriptsUsecase>(
    () => GetTranscriptsImp(GetIt.I.get<WalletRepository>()),
  );
  getIt.registerFactory<GetTranscriptDetailsUsecase>(
    () => GetTranscriptDetailsImp(GetIt.I.get<WalletRepository>()),
  );
  getIt.registerFactory<SaveUserIsLoggedUsecase>(
    () => SaveUserIsLoggedUsecaseImp(GetIt.I.get<UserLocalAuthRepository>()),
  );
  getIt.registerFactory<GetUserIsLoggedUsecase>(
    () => GetUserIsLoggedUsecaseImp(GetIt.I.get<UserLocalAuthRepository>()),
  );
  getIt.registerFactory<GetUserLocalAuthUsecase>(
    () => GetUserLocalAuthUsecaseImp(GetIt.I.get<UserLocalAuthRepository>()),
  );

  getIt.registerFactory<EditProfileUsecase>(
    () => EditProfileUsecaseImp(GetIt.I.get<UserProfileRepository>()),
  );

  getIt.registerFactory<GetProfileUsecase>(
    () => GetProfileUsecaseImp(GetIt.I.get<UserProfileRepository>()),
  );
  getIt.registerFactory<GetCollectiblesUsecase>(
    () => CollectiblesUsecaseImp(GetIt.I.get<CollectiblesRepository>()),
  );
}
