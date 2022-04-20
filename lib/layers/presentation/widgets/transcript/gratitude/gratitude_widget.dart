import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';

class GratitudeWidget extends StatelessWidget with TextThemes{
  final void Function() onTapToOpen;
  final TranscriptEntity transcriptEntity;
  final List<String> gratitudeTypeS = ['NFT', 'welcome', 'quest'];
  GratitudeWidget({Key? key, required this.onTapToOpen, required this.transcriptEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          onTap: onTapToOpen,
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
                                    onTap: onTapToOpen,
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
                                  transcriptEntity.createdAt,
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
                        visible: transcriptEntity.viewed == false,
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
    //NFT
    if(transcriptEntity.gratitudeType == gratitudeTypeS[0]){
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
    //welcome
    else if(transcriptEntity.gratitudeType == gratitudeTypeS[1]){
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
              text: TranslationService.translate(context, "transcript.coinAmount",).replaceFirst('XX', transcriptEntity.amount ?? ''),
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
    //quest
    else{
      //quest
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
              text: TranslationService.translate(context, "transcript.coinAmount",).replaceFirst('XX', transcriptEntity.amount ?? ''),
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
}
