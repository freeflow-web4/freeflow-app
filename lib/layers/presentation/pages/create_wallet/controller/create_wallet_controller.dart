import 'package:mobx/mobx.dart';
part 'create_wallet_controller.g.dart';

class CreateWalletController = _CreateWalletControllerBase
    with _$CreateWalletController;

abstract class _CreateWalletControllerBase with Store {
  @observable
  double pageIndicatorHeight = 0;

  @action
  void updatePageIndicatorHeight(double height) {
    pageIndicatorHeight = height;
  }
}
