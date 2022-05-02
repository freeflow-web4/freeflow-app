import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_default.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:intl/intl.dart';

import 'controller/gratitude_controller.dart';

class GratitudeWidget extends StatefulWidget{
  final TranscriptEntity transcriptEntity;

  const GratitudeWidget({Key? key, required this.transcriptEntity}) : super(key: key);

  @override
  State<GratitudeWidget> createState() => _GratitudeWidgetState();
}

class _GratitudeWidgetState extends State<GratitudeWidget>  with TextThemes {
  final List<String> gratitudeTypeS = ['NFT', 'welcome', 'quest'];
  final GratitudeController controller = findGratitudeController();
  final NumberFormat numberFormat = NumberFormat("#,##0.00", "pt_BR");

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          onTap: (){
            Future.delayed(const Duration(milliseconds: 80), (){
              onTapToOpenGratitude(context);
            });
          },
          splashColor: StandardColors.greyCA,
          child: Container(
            height: 98,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all( color:StandardColors.borderGrey,),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 98,
                      width: 16,
                      decoration: const BoxDecoration(
                        color: StandardColors.gratitude,
                        borderRadius: BorderRadius.only(
                          topLeft:  Radius.circular(10),
                          bottomLeft:  Radius.circular(10),
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 12, left: 12),
                      child: SvgPicture.asset(
                        IconsAsset.flowerLogo,
                        color: StandardColors.black,
                        height: 40,
                        width: 40,
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 51,
                          width: constraints.maxWidth - 110,
                          margin: const EdgeInsets.only(
                            top: 14,
                            left: 16,
                          ),
                          child: getRichText(context),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 4, ),
                          width: constraints.maxWidth - 84,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Material(
                                borderRadius: const BorderRadius.all(Radius.circular(4)),
                                child: Ink(
                                  child: InkWell(
                                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                                    splashColor: StandardColors.gratitude,
                                    onTap: (){
                                      Future.delayed(const Duration(milliseconds: 80), (){
                                        onTapToOpenGratitude(context);
                                      });
                                    },
                                    child:  Container(
                                      height: 15,
                                      width: 50,
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 4,
                                        horizontal: 8,
                                      ),
                                      child:  Text(
                                        TranslationService.translate(context, "transcript.view",),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: StandardColors.grey79,
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Container(
                                margin: const EdgeInsets.only(right: 2),
                                child: Text(
                                  widget.transcriptEntity.createdAt,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: StandardColors.grey79,
                                  ),

                                ),
                              )
                            ],
                          ),
                        )

                      ],

                    ),

                    Visibility(
                      visible: widget.transcriptEntity.viewed == false,
                      child: Container(
                        height: 8,
                        width: 8,
                        margin: const EdgeInsets.only(top: 8, right: 8),
                        decoration: const BoxDecoration(
                          color: StandardColors.feedbackError,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget getRichText(context) {
    if(isNFT()){
      return RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text:  TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: TranslationService.translate(context, "transcript.freeflow",),
              style: transcriptBold,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.gratitude.rewardedYouWith",),
              style: transcriptMedium,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.gratitude.aNewCollectible",),
              style: transcriptBold,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.gratitude.completedQuest",),
              style: transcriptMedium,
            ),
          ],
        ),
      );
    }
    else if(isWelcome()){
      return RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text:  TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: TranslationService.translate(context, "transcript.freeflow",),
              style: transcriptBold,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.gratitude.rewardedYou",),
              style: transcriptMedium,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.coinAmount",).replaceFirst('XX', numberFormat.format(widget.transcriptEntity.amount)),
              style: transcriptBold,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.gratitude.welcome",),
              style: transcriptMedium,
            ),
          ],
        ),
      );
    }
    else{
      return RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text:  TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: TranslationService.translate(context, "transcript.freeflow",),
              style: transcriptBold,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.gratitude.rewardedYou",),
              style: transcriptMedium,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.coinAmount",).replaceFirst('XX', numberFormat.format(widget.transcriptEntity.amount)),
              style: transcriptBold,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.gratitude.completedQuest",),
              style: transcriptMedium,
            ),
          ],
        ),
      );
    }
  }

  void onTapToOpenGratitude(context) async {
    openDialog();
    bool status = await controller.onTapGratitude(widget.transcriptEntity);
    if (status){
      setState(() {
        widget.transcriptEntity.viewed = true;
      });
    }
    else{
      Navigator.of(context).pop();
      showDialogError(context);
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

  void openDialog() {
    if(isNFT()) {
      //TODO TASK FREEF-66
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(

            title: const Text("TODO TASK FREEF-66"),
            actions: <Widget>[
              TextButton(
                child: const Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    else if(isWelcome()){
      showDialogDefault(
        context,
        automaticallyCloses: true,
        type: DialogType.welcome,
        flowers: widget.transcriptEntity.amount,
        onTap: () {
          Routes.instance.pop();
        },
      );
    }
    else{
      //TODO TASK FREEF-66
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(

            title: const Text("TODO TASK FREEF-66"),
            actions: <Widget>[
              TextButton(
                child: const Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  bool isNFT(){
    return widget.transcriptEntity.gratitudeType == gratitudeTypeS[0];
  }

  bool isWelcome(){
    return widget.transcriptEntity.gratitudeType == gratitudeTypeS[1];
  }
}
