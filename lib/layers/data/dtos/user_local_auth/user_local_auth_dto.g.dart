// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_local_auth_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLocalAuthDto _$UserLocalAuthDtoFromJson(Map<String, dynamic> json) =>
    UserLocalAuthDto(
      hasBiometrics: json['hasBiometrics'] as bool,
      pinCode: json['pinCode'] as String,
    );

Map<String, dynamic> _$UserLocalAuthDtoToJson(UserLocalAuthDto instance) =>
    <String, dynamic>{
      'hasBiometrics': instance.hasBiometrics,
      'pinCode': instance.pinCode,
    };
