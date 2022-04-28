import 'package:freeflow/layers/domain/entities/transcript_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transcript_details_dto.g.dart';

@JsonSerializable()
class TranscriptDetailsDto {
  final double? amount;
  final String? date;
  final double? fee;
  final String? senderEmail;
  final String? senderPhotoUrl;
  final String? receiverEmail;
  final String? receiverPhotoUrl;
  final String? senderUsername;
  final String? receiverUsername;

  TranscriptDetailsDto(
      this.amount,
      this.date,
      this.fee,
      this.senderEmail,
      this.senderPhotoUrl,
      this.receiverEmail,
      this.receiverPhotoUrl,
      this.senderUsername,
      this.receiverUsername,
      );



  TranscriptDetailsEntity toEntity() => TranscriptDetailsEntity(
    amount: amount,
    date: DateTime.parse(date!),
    fee: fee,
    senderEmail: senderEmail,
    senderPhotoUrl: senderPhotoUrl,
    receiverEmail: receiverEmail,
    receiverPhotoUrl: receiverPhotoUrl,
      );

  factory TranscriptDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$TranscriptDetailsDtoFromJson(json);

}
