class UserEntity {
  String id;
  String username;
  String? email;
  String token;

  UserEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
  });
}
