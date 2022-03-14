import 'package:freeflow/layers/domain/entities/user_local_auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_local_auth_dto.g.dart';

@JsonSerializable()
class UserLocalAuthDto {
  final bool hasBiometrics;
  final String pinCode;

  UserLocalAuthDto({
    required this.hasBiometrics,
    required this.pinCode,
  });

  UserLocalAuthEntity toEntity() =>
      UserLocalAuthEntity(hasBiometrics: hasBiometrics, pinCode: pinCode);

  factory UserLocalAuthDto.fromEntity(UserLocalAuthEntity entity) =>
      UserLocalAuthDto(
        hasBiometrics: entity.hasBiometrics,
        pinCode: entity.pinCode,
      );

  factory UserLocalAuthDto.fromJson(Map<String, dynamic> json) =>
      _$UserLocalAuthDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserLocalAuthDtoToJson(this);
}
