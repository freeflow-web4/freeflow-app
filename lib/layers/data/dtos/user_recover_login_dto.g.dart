// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_recover_login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRecoverLoginDto _$UserRecoverLoginDtoFromJson(Map<String, dynamic> json) =>
    UserRecoverLoginDto(
      name: json['name'],
    )..photoUrl = json['photoUrl'] as String?;

Map<String, dynamic> _$UserRecoverLoginDtoToJson(
        UserRecoverLoginDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'photoUrl': instance.photoUrl,
    };
