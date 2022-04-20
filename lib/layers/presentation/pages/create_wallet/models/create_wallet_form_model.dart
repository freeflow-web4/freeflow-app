import 'package:freeflow/layers/domain/entities/user_create_wallet_entity.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/email_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/flower_name_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/name_form_model.dart';
import 'package:freeflow/layers/presentation/pages/create_wallet/models/private_key_form_model.dart';

class CreateWalletFormModel {
  NameFormEntity? nameFormModel;
  EmailFormEntity? emailFormModel;
  FlowerNameFormEntity? flowerName;
  PrivateKeyFormModel? privateKeyFormModel;

  UserCreateWalletEntity toEntity() => UserCreateWalletEntity(
        name: nameFormModel?.name ?? '',
        email: emailFormModel?.email ?? '',
        flowerName: flowerName?.flowerName ?? '',
        privateKey: privateKeyFormModel?.privateKey ?? '',
      );
}
