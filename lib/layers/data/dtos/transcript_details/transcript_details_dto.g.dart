// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcript_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranscriptDetailsDto _$TranscriptDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    TranscriptDetailsDto(
      json['amount'] as String?,
      json['date'] as String?,
      json['fee'] as String?,
      json['senderEmail'] as String?,
      json['senderPhotoUrl'] as String?,
      json['reciverEmail'] as String?,
      json['reciverPhotoUrl'] as String?,
    );

Map<String, dynamic> _$TranscriptDetailsDtoToJson(
        TranscriptDetailsDto instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'date': instance.date,
      'fee': instance.fee,
      'senderEmail': instance.senderEmail,
      'senderPhotoUrl': instance.senderPhotoUrl,
      'reciverEmail': instance.reciverEmail,
      'reciverPhotoUrl': instance.reciverPhotoUrl,
    };
