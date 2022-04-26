// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcript_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranscriptDetailsDto _$TranscriptDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    TranscriptDetailsDto(
      (json['amount'] as num?)?.toDouble(),
      json['date'] as String?,
      (json['fee'] as num?)?.toDouble(),
      json['senderEmail'] as String?,
      json['senderPhotoUrl'] as String?,
      json['receiverEmail'] as String?,
      json['receiverPhotoUrl'] as String?,
      json['senderUsername'] as String?,
      json['receiverUsername'] as String?,
    );

Map<String, dynamic> _$TranscriptDetailsDtoToJson(
        TranscriptDetailsDto instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'date': instance.date,
      'fee': instance.fee,
      'senderEmail': instance.senderEmail,
      'senderPhotoUrl': instance.senderPhotoUrl,
      'receiverEmail': instance.receiverEmail,
      'receiverPhotoUrl': instance.receiverPhotoUrl,
      'senderUsername': instance.senderUsername,
      'receiverUsername': instance.receiverUsername,
    };
