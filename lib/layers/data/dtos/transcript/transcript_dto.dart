import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transcript_dto.g.dart';

@JsonSerializable()
class TranscriptDto {
  final String category;
  final String? amount;
  final String? gratitudeType;
  final String createdAt;
  final String? transferAction;
  final String id;
  bool viewed;
  final String? userName;
  final String? exchangeUsername;
  final String? photoUrl;

  TranscriptDto({
    this.transferAction,
    required this.id,
    required this.viewed,
    this.exchangeUsername,
    this.photoUrl,
    required this.category,
    this.amount,
    this.gratitudeType,
    required this.createdAt,
    required this.userName,
  });

  TranscriptEntity toEntity() => TranscriptEntity(
    transferAction: transferAction,
    id: id,
    viewed: viewed,
    amount: amount,
    exchangeUsername: exchangeUsername,
    photoUrl: photoUrl,
    category: category,
    gratitudeType: gratitudeType,
    userName: userName,
    createdAt: createdAt,
      );

  factory TranscriptDto.fromJson(Map<String, dynamic> json) =>
      _$TranscriptDtoFromJson(json);
}
