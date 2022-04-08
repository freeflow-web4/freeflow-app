import 'package:freeflow/routes/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'cut_image_controller.g.dart';

CutImageController findCutImageController() => GetIt.I.get<CutImageController>();

class CutImageController = _LoginControllerBase with _$CutImageController;

abstract class _LoginControllerBase with Store {
  Future<void> onSwipe() {
    return Routes.instance.goToAuthPageRoute();
  }



}
