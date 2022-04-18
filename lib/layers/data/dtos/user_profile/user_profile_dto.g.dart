// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileDto _$UserProfileDtoFromJson(Map<String, dynamic> json) =>
    UserProfileDto(
      displayName: json['displayName'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
      username: json['username'] as String,
      contractAddress: json['contractAddress'] as String?,
    );

Map<String, dynamic> _$UserProfileDtoToJson(UserProfileDto instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'username': instance.username,
      'profileImageUrl': instance.profileImageUrl,
      'contractAddress': instance.contractAddress,
    };
