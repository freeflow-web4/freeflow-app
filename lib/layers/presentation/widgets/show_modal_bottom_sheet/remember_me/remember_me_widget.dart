import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_default.dart';
import 'package:freeflow/layers/presentation/widgets/informative_dialog.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';
import 'package:freeflow/layers/presentation/widgets/on_off_button_swipe.dart';
import 'package:freeflow/routes/routes.dart';

import 'controller/remember_me_controller.dart';

class RememberMeWidget extends StatefulWidget {
  const RememberMeWidget({Key? key}) : super(key: key);

  @override
  _RememberMeWidgetState createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> with TextThemes  {
  final RememberMeController controller = findRememberMeController();

  @override
  void initState() {
    super.initState();
    controller.getIfBiometricIsEnable();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Row(
              mainAxisAlignment: controller.biometricIsEnable == null ?
              MainAxisAlignment.center :
              MainAxisAlignment.start,
              children: [
                if(controller.biometricIsEnable != null)...[
                  Container(
                    margin: const EdgeInsets.only( left: 32, right: 26),
                    child: Text(
                      TranslationService.translate(context,
                        controller.biometricIsEnable! ?
                        "rememberMe.disableTouchId" :
                        "rememberMe.enableTouchId",),
                      style: subtitleTextStyle(
                        color: StandardColors.black,
                      ),
                    ),
                  ),
                  OnOffButtonSwipe(
                    ballColor: StandardColors.borderGrey,
                    onChanged: (value) async{
                     bool? status = await controller.changeBiometricStatus(context, value);
                     if(status == true){
                       showDialogSuccess(context);
                     }else if(status == false){
                       showDialogError(context);
                     }
                    },
                    value: controller.biometricIsEnable!,
                  )
                ]else...[
                  const LoadingWidget(
                    isLoading: true,
                    color: StandardColors.greyCA,
                    size: 33,
                  ),
                ]
              ],
            ),
          );
        },
    );
  }




  void showDialogError(BuildContext context) {
    showDialogDefault(
      context,
      type: DialogType.systemInstability,
      onTap: () {
        Routes.instance.pop();
      },
    );
  }

  void showDialogSuccess(BuildContext context) {
    showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => const InformativeDialog(
        icon: IconsAsset.checkIcon,
        title: "rememberMe.changeSuccessfully",
      ),
    );
  }



}




