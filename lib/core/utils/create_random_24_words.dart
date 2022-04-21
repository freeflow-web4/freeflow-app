import 'package:bip39/bip39.dart' as bip39;

String getRandomWordsForSeedPhrase() {
  final words = bip39.generateMnemonic() +
      bip39.generateMnemonic() +
      bip39.generateMnemonic();
  final wordsList = words.split(" ").getRange(0, 12);
  return wordsList.join(" ");
}
