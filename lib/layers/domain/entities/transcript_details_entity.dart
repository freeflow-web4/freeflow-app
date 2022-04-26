class TranscriptDetailsEntity {
  final double? amount;
  final DateTime? date;
  final double? fee;
  final String? senderEmail;
  final String? senderPhotoUrl;
  final String? receiverEmail;
  final String? receiverPhotoUrl;
  final String? senderUsername;
  final String? receiverUsername;



  TranscriptDetailsEntity( {
      this.amount,
      this.date,
      this.fee,
      this.senderEmail,
      this.senderPhotoUrl,
      this.receiverEmail,
      this.receiverPhotoUrl,
      this.senderUsername,
      this.receiverUsername,
  });

  String dateToString(){
    return '${date!.year}-${toStringWith2Digits(date!.month)}-${toStringWith2Digits(date!.day)} '
        '${toStringWith2Digits(date!.hour)}:${toStringWith2Digits(date!.minute)}:${toStringWith2Digits(date!.second)}';
  }

  String toStringWith2Digits(int value){
    if(value < 10){
      return '0$value';
    }else{
      return '$value';
    }
  }

}
