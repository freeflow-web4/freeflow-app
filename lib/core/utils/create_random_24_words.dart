import 'package:bip39/bip39.dart' as bip39;

String get24RandomWordsForSeedPhrase() {
  final words = bip39.generateMnemonic() +
      bip39.generateMnemonic() +
      bip39.generateMnemonic();
  final wordsList = words.split(" ").getRange(0, 24);
  return wordsList.join(" ");
}
