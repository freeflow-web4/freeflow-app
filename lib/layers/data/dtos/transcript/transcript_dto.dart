import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transcript_dto.g.dart';

@JsonSerializable()
class TranscriptDto {
  final String category;
  final double? amount;
  final String? gratitudeType;
  final String createdAt;
  final String? transferAction;
  final String id;
  bool viewed;
  final String? receiverUsername;
  final String? receiverDisplayName;
  final String? receiverPhotoUrl;
  final String? senderUsername;
  final String? senderDisplayName;
  final String? senderPhotoUrl;

  TranscriptDto({
    this.transferAction,
    required this.id,
    required this.viewed,
    required this.category,
    this.amount,
    this.gratitudeType,
    required this.createdAt,
    required this.receiverUsername,
    required this.receiverPhotoUrl,
    required this.receiverDisplayName,
    required this.senderUsername,
    required this.senderDisplayName,
    required this.senderPhotoUrl,  });

  TranscriptEntity toEntity() => TranscriptEntity(
    transferAction: transferAction,
    id: id,
    viewed: viewed,
    amount: amount,
    category: category,
    gratitudeType: gratitudeType,
    createdAt: createdAt,
    receiverUsername: receiverUsername,
    receiverPhotoUrl: receiverPhotoUrl,
    receiverDisplayName: receiverDisplayName,
    senderUsername: senderUsername,
    senderDisplayName: senderDisplayName,
    senderPhotoUrl: senderPhotoUrl,

  );

  factory TranscriptDto.fromJson(Map<String, dynamic> json) =>
      _$TranscriptDtoFromJson(json);
}
