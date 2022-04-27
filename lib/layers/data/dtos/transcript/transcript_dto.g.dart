// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcript_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranscriptDto _$TranscriptDtoFromJson(Map<String, dynamic> json) =>
    TranscriptDto(
      transferAction: json['transferAction'] as String?,
      id: json['id'] as String,
      viewed: json['viewed'] as bool,
      category: json['category'] as String,
      amount: (json['amount'] as num?)?.toDouble(),
      gratitudeType: json['gratitudeType'] as String?,
      createdAt: json['createdAt'] as String,
      receiverUsername: json['receiverUsername'] as String?,
      receiverPhotoUrl: json['receiverPhotoUrl'] as String?,
      receiverDisplayName: json['receiverDisplayName'] as String?,
      senderUsername: json['senderUsername'] as String?,
      senderDisplayName: json['senderDisplayName'] as String?,
      senderPhotoUrl: json['senderPhotoUrl'] as String?,
    );

Map<String, dynamic> _$TranscriptDtoToJson(TranscriptDto instance) =>
    <String, dynamic>{
      'category': instance.category,
      'amount': instance.amount,
      'gratitudeType': instance.gratitudeType,
      'createdAt': instance.createdAt,
      'transferAction': instance.transferAction,
      'id': instance.id,
      'viewed': instance.viewed,
      'receiverUsername': instance.receiverUsername,
      'receiverDisplayName': instance.receiverDisplayName,
      'receiverPhotoUrl': instance.receiverPhotoUrl,
      'senderUsername': instance.senderUsername,
      'senderDisplayName': instance.senderDisplayName,
      'senderPhotoUrl': instance.senderPhotoUrl,
    };
