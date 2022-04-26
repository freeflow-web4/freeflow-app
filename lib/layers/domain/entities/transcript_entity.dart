class TranscriptEntity {
  final String category;
  final String? amount;
  final String? gratitudeType;
  final String createdAt;
  final String? transferAction;
  final String id;
  bool viewed;
  final String? userName;
  final String? exchangeUsername;
  final String? photoUrl;




  TranscriptEntity({
    this.transferAction,
    required this.id,
    required this.viewed,
    this.exchangeUsername,
    this.photoUrl,
    required this.category,
    this.amount,
    this.gratitudeType,
    required this.createdAt,
    required this.userName,
  });
}
