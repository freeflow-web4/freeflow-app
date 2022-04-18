class ProfileEntity {
  String displayName;
  String? profileImageUrl;
  String username;
  String? contractAddress;

  ProfileEntity({
    required this.displayName,
    required this.username,
     this.contractAddress,
    this.profileImageUrl,
  });
}
