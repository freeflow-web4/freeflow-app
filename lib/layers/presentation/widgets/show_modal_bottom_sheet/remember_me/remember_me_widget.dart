import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/show_flex_bottom_sheet.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';
import 'package:freeflow/layers/presentation/widgets/on_off_button_swipe.dart';
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
                    style: subtitleTextStyle.copyWith(
                      color: StandardColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if(controller.hasBiometric != null)...[
                  OnOffButtonSwipe(
                    ballColor: StandardColors.borderGrey,
                    onChanged: (value){
                      showCommitmentBottomSheet();
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

  showCommitmentBottomSheet() {
    return showFlexBottomSheet(
      context,
      title: textH6(
        context,
        textKey: 'profile.commitment',
        textAlign: TextAlign.center,
      ),
      content: Center(
        child: textSubtitle(
          context,
          textKey: 'profile.commitmentContent',
        ),
      ),
    );
  }
}




