import 'package:freeflow/layers/domain/entities/collectibles_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'collectibles_dto.g.dart';

@JsonSerializable()
class CollectiblesDto {
  String? id;
  String? collectibleType;
  String? authorName;
  String? qrCodeImageUrl;
  String? contractAddress;
  int? tokenId;
  String? imageUrl;
  String? eventTitle;
  String? eventDate;
  String? createdAt;
  String? updatedAt;

  CollectiblesDto(
      { this.id,
        this.collectibleType,
        this.authorName,
        this.qrCodeImageUrl,
        this.contractAddress,
        this.tokenId,
        this.imageUrl,
        this.eventTitle,
        this.eventDate,
        this.createdAt,
        this.updatedAt,
      });



  CollectiblesEntity toEntity() => CollectiblesEntity(
    id: id!,
    collectibleType: collectibleType,
    authorName: authorName,
    qrCodeImageUrl: qrCodeImageUrl,
    contractAddress: contractAddress,
    tokenId: tokenId,
    imageUrl: imageUrl,
    eventTitle: eventTitle,
    eventDate: eventDate,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );



  factory CollectiblesDto.fromJson(Map<String, dynamic> json) =>
      _$CollectiblesDtoFromJson(json);

}
