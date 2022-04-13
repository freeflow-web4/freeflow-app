class ProfileEntity {
  String displayName;
  String? profileImageUrl;
  String username;

  ProfileEntity({
    required this.displayName,
    required this.username,
    this.profileImageUrl,
  });
}
