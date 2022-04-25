class TranscriptDetailsEntity {
  final String? amount;
  final DateTime? date;
  final String? fee;
  final String? senderEmail;
  final String? senderPhotoUrl;
  final String? reciverEmail;
  final String? reciverPhotoUrl;


  TranscriptDetailsEntity({
      this.amount,
      this.date,
      this.fee,
      this.senderEmail,
      this.senderPhotoUrl,
      this.reciverEmail,
      this.reciverPhotoUrl,
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
