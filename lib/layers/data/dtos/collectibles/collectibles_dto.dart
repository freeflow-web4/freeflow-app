import 'package:freeflow/layers/domain/entities/nfts_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'collectibles_dto.g.dart';

@JsonSerializable()
class CollectiblesDto {
  String? displayName;
  String? profileImageUrl;

  CollectiblesDto({
    required this.displayName,
    this.profileImageUrl
  });

  CollectiblesEntity toEntity() => CollectiblesEntity(
      profileImageUrl: profileImageUrl,
      displayName: displayName,
  );



  factory CollectiblesDto.fromJson(Map<String, dynamic> json) =>
      _$CollectiblesDtoFromJson(json);

}
