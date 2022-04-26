import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_default.dart';
import 'package:freeflow/layers/presentation/widgets/transcript/interactions/controller/interaction_controller.dart';
import 'package:freeflow/routes/routes.dart';

class InteractionsWidget extends StatefulWidget{
  final TranscriptEntity transcriptEntity;
  const InteractionsWidget({Key? key, required this.transcriptEntity}) : super(key: key);

  @override
  State<InteractionsWidget> createState() => _InteractionsWidgetState();
}

class _InteractionsWidgetState extends State<InteractionsWidget> with TextThemes {
  final InteractionController controller = findInteractionController();


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
              onTapToOpenInteraction(context);
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
                        color: StandardColors.interactions,
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
                                    splashColor: StandardColors.interactions,
                                    onTap: (){
                                      Future.delayed(const Duration(milliseconds: 80), (){
                                        onTapToOpenInteraction(context);
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
    if(!widget.transcriptEntity.viewed){
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
              text: TranslationService.translate(context, "transcript.interaction.hasA",),
              style: transcriptMedium,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.interaction.newQuestion",),
              style: transcriptBold,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.interaction.forYou",),
              style: transcriptMedium,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.interaction.haveAGoodOne",),
              style: transcriptBold,
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
              text: TranslationService.translate(context, "transcript.interaction.you",),
              style: transcriptBold,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.interaction.haventParticipated",),
              style: transcriptMedium,
            ),
          ],
        ),
      );
    }
  }

  void onTapToOpenInteraction(context) async {

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

    bool status = await controller.onTapInteraction(widget.transcriptEntity);

    if (status){
      setState(() {
        widget.transcriptEntity.viewed = true;
      });
    }else{
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
}
