// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginDto _$UserLoginDtoFromJson(Map<String, dynamic> json) => UserLoginDto(
      name: json['name'],
    )..photoUrl = json['photoUrl'] as String?;

Map<String, dynamic> _$UserLoginDtoToJson(UserLoginDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'photoUrl': instance.photoUrl,
    };
