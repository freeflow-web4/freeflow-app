// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collectibles_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectiblesDto _$CollectiblesDtoFromJson(Map<String, dynamic> json) =>
    CollectiblesDto(
      id: json['id'] as String?,
      collectibleType: json['collectibleType'] as String?,
      authorName: json['authorName'] as String?,
      qrCodeImageUrl: json['qrCodeImageUrl'] as String?,
      contractAddress: json['contractAddress'] as String?,
      tokenId: json['tokenId'] as String?,
      imageUrl: json['imageUrl'] as String?,
      eventTitle: json['eventTitle'] as String?,
      eventDate: json['eventDate'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CollectiblesDtoToJson(CollectiblesDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collectibleType': instance.collectibleType,
      'authorName': instance.authorName,
      'qrCodeImageUrl': instance.qrCodeImageUrl,
      'contractAddress': instance.contractAddress,
      'tokenId': instance.tokenId,
      'imageUrl': instance.imageUrl,
      'eventTitle': instance.eventTitle,
      'eventDate': instance.eventDate,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
