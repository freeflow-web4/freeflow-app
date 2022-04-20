// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcript_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranscripDto _$TranscripDtoFromJson(Map<String, dynamic> json) => TranscripDto(
      transferAction: json['transferAction'] as String?,
      id: json['id'] as String,
      viewed: json['viewed'] as bool,
      exchangeUsername: json['exchangeUsername'] as String?,
      photoUrl: json['photoUrl'] as String?,
      category: json['category'] as String,
      amount: json['amount'] as String?,
      gratitudeType: json['gratitudeType'] as String?,
      createdAt: json['createdAt'] as String,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$TranscripDtoToJson(TranscripDto instance) =>
    <String, dynamic>{
      'category': instance.category,
      'amount': instance.amount,
      'gratitudeType': instance.gratitudeType,
      'createdAt': instance.createdAt,
      'transferAction': instance.transferAction,
      'id': instance.id,
      'viewed': instance.viewed,
      'userName': instance.userName,
      'exchangeUsername': instance.exchangeUsername,
      'photoUrl': instance.photoUrl,
    };
