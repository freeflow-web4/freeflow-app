import 'package:freeflow/layers/domain/entities/profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_profile_dto.g.dart';

@JsonSerializable()
class UserProfileDto {
  String? displayName;
  String? profileImageUrl;

  UserProfileDto({
    required this.displayName,
    this.profileImageUrl
  });

  ProfileEntity toEntity() => ProfileEntity(
      profileImageUrl: profileImageUrl,
      displayName: displayName);



  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);

}