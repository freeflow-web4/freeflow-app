import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transcript_dto.g.dart';

@JsonSerializable()
class TranscripDto {
  final String category;
  final String amount;
  final String gratitudeType;
  final String createdAt;
  final String userName;

  TranscripDto({
    required this.category,
    required this.amount,
    required this.gratitudeType,
    required this.createdAt,
    required this.userName,
  });

  TranscriptEntity toEntity() => TranscriptEntity(
        amount: amount,
        category: category,
        createdAt: createdAt,
        gratitudeType: gratitudeType,
        userName: userName,
      );

  factory TranscripDto.fromEntity(TranscriptEntity entity) => TranscripDto(
        amount: entity.amount,
        category: entity.category,
        createdAt: entity.createdAt,
        gratitudeType: entity.gratitudeType,
        userName: entity.userName,
      );

  factory TranscripDto.fromJson(Map<String, dynamic> json) =>
      _$TranscripDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TranscripDtoToJson(this);
}
