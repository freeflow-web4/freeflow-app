import 'package:mobx/mobx.dart';

part 'in_app_keyboard_controller.g.dart';

class InAppKeyboardController = InAppKeyboardControllerBase
    with _$InAppKeyboardController;

abstract class InAppKeyboardControllerBase with Store {
  @observable
  String text = '';

  @action
  void setText(String key) {
    if (key == 'del') {
      delKey();
    } else if (key == 'X') {
      clearText();
    } else {
      final newText = text + key;
      text = newText;
    }
  }

  @action
  void delKey() {
    if (text.isNotEmpty) {
      final newText = text.substring(0, text.length - 1);
      text = newText;
    }
  }

  @action
  void clearText() {
    text = '';
  }
}
