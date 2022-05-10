import 'package:bip39/bip39.dart' as bip39;

String getRandomWordsForSeedPhrase() {
  return bip39.generateMnemonic(strength: 256);
}
