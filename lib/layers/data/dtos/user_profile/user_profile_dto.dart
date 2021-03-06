import 'package:freeflow/layers/domain/entities/profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_profile_dto.g.dart';

@JsonSerializable()
class UserProfileDto {
  String displayName;
  String username;
  String? profileImageUrl;
  String? contractAddress;

  UserProfileDto({
    required this.displayName,
    this.profileImageUrl,
    required this.username,
    this.contractAddress,
  });

  ProfileEntity toEntity() => ProfileEntity(
        profileImageUrl: profileImageUrl,
        displayName: displayName,
        username: username,
        contractAddress: contractAddress,
      );

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);
}
