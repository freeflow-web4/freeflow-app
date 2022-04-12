import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:share_plus/share_plus.dart';

part 'profile_page_controller.g.dart';

ProfilePageController findProfileController() =>
    GetIt.I.get<ProfilePageController>();

class ProfilePageController = ProfilePageControllerBase
    with _$ProfilePageController;

abstract class ProfilePageControllerBase with Store {
  void setContentToClipBoard() =>
      Clipboard.setData(const ClipboardData(text: 'https://www.google.com'));

  void shareAddress() => Share.share('https://www.google.com');
}
