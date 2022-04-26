class TranscriptEntity {
  final String category;
  final double? amount;
  final String? gratitudeType;
  final String createdAt;
  final String? transferAction;
  final String id;
  bool viewed;
  final String? receiverUsername;
  final String? receiverDisplayName;
  final String? receiverPhotoUrl;
  final String? senderUsername;
  final String? senderDisplayName;
  final String? senderPhotoUrl;


  TranscriptEntity({
    this.transferAction,
    required this.id,
    required this.viewed,
    required this.category,
    this.amount,
    this.gratitudeType,
    required this.createdAt,
    required this.receiverUsername,
    required this.receiverPhotoUrl,
    required this.receiverDisplayName,
    required this.senderUsername,
    required this.senderDisplayName,
    required this.senderPhotoUrl,
  });
}
