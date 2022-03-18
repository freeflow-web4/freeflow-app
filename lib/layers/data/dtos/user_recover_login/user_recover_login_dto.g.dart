// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_recover_login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRecoverLoginDto _$UserRecoverLoginDtoFromJson(Map<String, dynamic> json) =>
    UserRecoverLoginDto(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$UserRecoverLoginDtoToJson(
        UserRecoverLoginDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'token': instance.token,
    };
