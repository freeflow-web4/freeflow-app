import 'package:freeflow/layers/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_login_dto.g.dart';

@JsonSerializable()
class UserLoginDto extends UserEntity {
  UserLoginDto({
    required name,
  }) : super(name: name);

  factory UserLoginDto.fromJson(Map<String, dynamic> json) =>
      _$UserLoginDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserLoginDtoToJson(this);
}
