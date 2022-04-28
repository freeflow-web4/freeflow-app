// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_create_wallet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCreateWalletDTO _$UserCreateWalletDTOFromJson(Map<String, dynamic> json) =>
    UserCreateWalletDTO(
      displayName: json['displayName'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      seedPhrase: json['seedPhrase'] as String,
    );

Map<String, dynamic> _$UserCreateWalletDTOToJson(
        UserCreateWalletDTO instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'username': instance.username,
      'email': instance.email,
      'seedPhrase': instance.seedPhrase,
    };
