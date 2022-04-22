import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_default.dart';
import 'package:freeflow/layers/presentation/widgets/informative_dialog.dart';
import 'package:freeflow/layers/presentation/widgets/transcript/flower_exchange/controller/flower_exchange_controller.dart';
import 'package:freeflow/routes/routes.dart';
import 'package:shimmer/shimmer.dart';

class FlowerExchangeWidget extends StatelessWidget with TextThemes {
  final TranscriptEntity transcriptEntity;
  final List<String> transferActions = ['send', 'received'];
  FlowerExchangeWidget({Key? key, required this.transcriptEntity}) : super(key: key);
  FlowerExchangeController controller = findFlowerExchangeController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          onTap: (){
            onTapToOpenTranscript(context);
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
                        color: StandardColors.flowerExchange,
                        borderRadius: BorderRadius.only(
                          topLeft:  Radius.circular(10),
                          bottomLeft:  Radius.circular(10),
                        ),
                      ),
                    ),

                    Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.only(top: 12, left: 12),
                      child: Visibility(
                        visible: transcriptEntity.photoUrl == null,
                        child: Container(
                          decoration:  BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(40)),
                            border: Border.all(
                              color: StandardColors.backgroundDark,
                              width: 2,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(40)),
                            child: SvgPicture.asset(
                              IconsAsset.withoutProfilePhoto,
                              height: 38,
                              width: 38,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        replacement: SizedBox(
                          height: 40,
                          width: 40,
                          child: Stack(
                            children: [
                              Shimmer.fromColors(
                                direction: ShimmerDirection.ltr,
                                baseColor: StandardColors.baseShimmer,
                                highlightColor: StandardColors.highlightShimmer,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration:  const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.all(Radius.circular(40)),

                                  ),

                                ),
                              ),
                              Container(
                                decoration:  BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                                  border: Border.all(
                                    color: StandardColors.backgroundDark,
                                    width: 2,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                                  child: Image.network(
                                    transcriptEntity.photoUrl ?? '',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, url, error) =>  Container(
                                      color: StandardColors.grey79,
                                      child: const Center(
                                        child: Icon(Icons.error,),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],

                          ),
                        ),

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
                                    splashColor: StandardColors.flowerExchange,
                                    onTap: (){
                                      onTapToOpenTranscript(context);
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
                              shape: BoxShape.circle
                          ),
                        )
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
    //SEND
    if(transcriptEntity.transferAction == transferActions[0]){
      return RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text:  TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: TranslationService.translate(context, "transcript.flowerExchange.you",),
              style: transcriptBold,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.flowerExchange.received",),
              style: transcriptMedium,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.coinAmount",).replaceFirst('XX', transcriptEntity.amount ?? ''),
              style: transcriptBold,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.flowerExchange.from",),
              style: transcriptMedium,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.flowerExchange.theName",).replaceFirst('NAME', transcriptEntity.userName ?? ''),
              style: transcriptBold,
            ),
          ],
        ),
      );
    }else{
      //RECEIVED
      return RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text:  TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: TranslationService.translate(context, "transcript.flowerExchange.you",),
              style: transcriptBold,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.flowerExchange.haveSend",),
              style: transcriptMedium,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.coinAmount",).replaceFirst('XX', transcriptEntity.amount ?? ''),
              style: transcriptBold,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.flowerExchange.to",),
              style: transcriptMedium,
            ),
            TextSpan(
              text: TranslationService.translate(context, "transcript.flowerExchange.theName",).replaceFirst('NAME', transcriptEntity.exchangeUsername ?? ''),
              style: transcriptBold,
            ),
          ],
        ),
      );
    }
  }

  void onTapToOpenTranscript(context) async {

    bool status = await controller.onTapFlowerExchange(transcriptEntity);

    if (status){
      showSecondaryFiltersMenu(context);
      if(transcriptEntity.transferAction == transferActions[0]){
        //TODO
        ///SHOW DIALOG SENDED FLWS
      }else{
        //TODO
        ///SHOW DIALOG RECEIVED FLWS
      }
    }else{
      // showDialogError(context);
    }

  }

  void showSecondaryFiltersMenu(context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(normalSpacing),
          topRight: Radius.circular(normalSpacing),
        ),
      ),
      isScrollControlled: true,
      barrierColor: StandardColors.darkGrey.withOpacity(0.7),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height*0.85,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setBottomSheetState) {
              return Column(
                children: [

                  Container(
                    height: 4,
                    width: 52,
                    margin: const EdgeInsets.symmetric(vertical: 17),
                    decoration: const BoxDecoration(
                      color: StandardColors.backgroundDark,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                    ),
                  ),

                  Text(
                    TranslationService.translate(context, "transcript.flowerExchange.transactionDetails",),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Akrobat',
                      color: StandardColors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  SvgPicture.asset(
                    IconsAsset.flowerLogo,
                    color: StandardColors.black,
                    height: 107,
                    width: 107,
                  ),
                  const SizedBox(
                    height: 80,
                  ),

                  transactionItem(
                    title: TranslationService.translate(
                      context, "transcript.flowerExchange.hashId",),
                    text: transcriptEntity.id,
                    canCopied: true,
                    context: context,
                  ),

                  transactionItem(
                    title: TranslationService.translate(
                      context, "transcript.flowerExchange.timestamp",),
                    text: controller.transcriptDetailsEntity!.dateToString(),
                    canCopied: true,
                    context: context,
                  ),

                  const Divider(
                    color: StandardColors.greyCA,
                  ),

                  transactionItem(
                    title: TranslationService.translate(
                      context, "transcript.flowerExchange.timestamp",),
                    text: transcriptEntity.id,
                    canCopied: false,
                    context: context,
                  ),

                  transactionItem(
                    title: TranslationService.translate(
                      context, "transcript.flowerExchange.timestamp",),
                    text: controller.transcriptDetailsEntity!.dateToString(),
                    canCopied: true,
                    context: context,
                  ),




                  const SizedBox(
                    height: 80,
                  ),

                ],
              );
            },
          ),
        );
      },
    );
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

  Widget transactionItem({required String title,required String text,required bool canCopied, context}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          SizedBox(
            width: 99,
            child: Text(title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  color: StandardColors.grey79
              ),
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width - (32*2 + 99 + (canCopied ? 48 : 0)),
              child: Text(text,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 14,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: StandardColors.black
                ),
              )
          ),
          Visibility(
            visible: canCopied,
            child: Material(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: SizedBox(
                height: 20,
                width: 20,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  splashColor: Colors.red,
                  onTap: (){
                    controller.copyText(text);
                    showDialog(
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (context) => const InformativeDialog(
                        icon: IconsAsset.checkIcon,
                        title: "profile.copiedAddress",
                      ),
                    );
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset(
                      IconsAsset.copyText,
                      width: 12,
                      height: 12,
                      fit: BoxFit.cover,
                    ),
                  ),



                ),
              ),
            ),)
        ],
      ),
    );
  }


}
