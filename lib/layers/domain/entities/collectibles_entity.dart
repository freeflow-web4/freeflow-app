class CollectiblesEntity {
  String id;
  String? collectibleType;
  String? authorName;
  String? qrCodeImageUrl;
  String? contractAddress;
  String? tokenId;
  String? imageUrl;
  String? eventTitle;
  String? eventDate;
  String? createdAt;
  String? updatedAt;

  CollectiblesEntity(
      {required this.id,
        this.collectibleType,
        this.authorName,
        this.qrCodeImageUrl,
        this.contractAddress,
        this.tokenId,
        this.imageUrl,
        this.eventTitle,
        this.eventDate,
        this.createdAt,
        this.updatedAt,
      });

}