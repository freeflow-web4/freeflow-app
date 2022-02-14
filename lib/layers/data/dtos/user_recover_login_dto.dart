import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_recover_login_dto.g.dart';

@JsonSerializable()
class UserRecoverLoginDto extends UserEntity {
  UserRecoverLoginDto({
    required name,
  }) : super(name: name);

  factory UserRecoverLoginDto.fromJson(Map<String, dynamic> json) =>
      _$UserRecoverLoginDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserRecoverLoginDtoToJson(this);
}
