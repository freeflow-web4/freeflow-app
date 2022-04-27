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
  bool auth = false;
  final RememberMeController controller = findRememberMeController();

  @override
  void initState() {
    controller.getIfHasBiometric();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only( left: 32, right: 26),
                      child: Text(
                        TranslationService.translate(context, "rememberMe.enableTouchId",),
                        style: subtitleTextStyle(
                          color: StandardColors.black,
                        ),
                      ),
                    ),
                    if(controller.hasBiometric != null)...[
                      OnOffButtonSwipe(
                        ballColor: StandardColors.borderGrey,
                        onChanged: (value){
                          changeStatus(value);
                          // setState(() {
                          //   auth = !auth;
                          //   enable = value;
                          // });
                        },
                        value: controller.hasBiometric!,
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
              ),
          ],
        );
      }
    );
  }

  changeStatus(bool newStatus) async{
    bool status = await controller.canChangeSetBiometrics(context);
    if(status){
      bool statusAux = await controller.setBiometric(newStatus);
      if(statusAux){
        showDialog(
          barrierColor: Colors.transparent,
          context: context,
          builder: (context) => const InformativeDialog(
            icon: IconsAsset.checkIcon,
            title: "rememberMe.changeSuccessfully",
          ),
        );
        print('sucezzos');
      }else{
        showDialogError(context);
      }
    }
  }

  void showDialogError(context) {
    showDialogDefault(
      context,
      type: DialogType.systemInstability,
      onTap: () {
        Routes.instance.pop();
      },
    );
  }

}




