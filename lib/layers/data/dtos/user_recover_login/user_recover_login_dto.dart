import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_recover_login_dto.g.dart';

@JsonSerializable()
class UserRecoverLoginDto {
  String id;
  String username;
  String email;
  String token;

  UserRecoverLoginDto({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
  });

  UserEntity toEntity() =>
      UserEntity(id: id, username: username, email: email, token: token);

  factory UserRecoverLoginDto.fromEntity(UserEntity entity) =>
      UserRecoverLoginDto(
        id: entity.id,
        username: entity.username,
        email: entity.email,
        token: entity.token,
      );

  factory UserRecoverLoginDto.fromJson(Map<String, dynamic> json) =>
      _$UserRecoverLoginDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserRecoverLoginDtoToJson(this);
}
