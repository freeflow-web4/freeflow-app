import 'package:freeflow/layers/domain/entities/transcript_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transcript_details_dto.g.dart';

@JsonSerializable()
class TranscriptDetailsDto {
  final String? amount;
  final String? date;
  final String? fee;
  final String? senderEmail;
  final String? senderPhotoUrl;
  final String? reciverEmail;
  final String? reciverPhotoUrl;

  TranscriptDetailsDto(
      this.amount,
      this.date,
      this.fee,
      this.senderEmail,
      this.senderPhotoUrl,
      this.reciverEmail,
      this.reciverPhotoUrl);



  TranscriptDetailsEntity toEntity() => TranscriptDetailsEntity(
    amount: amount,
    date: DateTime.parse(date!),
    fee: fee,
    senderEmail: senderEmail,
    senderPhotoUrl: senderPhotoUrl,
    reciverEmail: reciverEmail,
    reciverPhotoUrl: reciverPhotoUrl,
      );

  factory TranscriptDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$TranscriptDetailsDtoFromJson(json);

}
