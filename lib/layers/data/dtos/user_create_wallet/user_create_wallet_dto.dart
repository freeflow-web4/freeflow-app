import 'package:freeflow/layers/domain/entities/user_create_wallet_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_create_wallet_dto.g.dart';

@JsonSerializable()
class UserCreateWalletDTO {
  final String displayName;
  final String username;
  final String email;
  final String seedPhrase;

  UserCreateWalletDTO({
    required this.displayName,
    required this.username,
    required this.email,
    required this.seedPhrase,
  });

  factory UserCreateWalletDTO.fromEntity(UserCreateWalletEntity entity) =>
      UserCreateWalletDTO(
        displayName: entity.name,
        username: entity.flowerName,
        email: entity.email,
        seedPhrase: entity.privateKey,
      );

  factory UserCreateWalletDTO.fromJson(Map<String, dynamic> json) =>
      _$UserCreateWalletDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserCreateWalletDTOToJson(this);
}
