import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';

import 'controller/cut_image_controller.dart';

class CutImagePage extends StatefulWidget {
  final String urlImage;
  const CutImagePage({Key? key,required this.urlImage}) : super(key: key);

  @override
  State<CutImagePage> createState() => _CutImagePageState();
}

class _CutImagePageState extends State<CutImagePage>  with TextThemes{

  final editController = findCutImageController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StandardColors.white,

      body: Column(
        children: [
          Container(),
          Container(
            height: 72,
            padding:  const EdgeInsets.symmetric(horizontal: mdSpacing),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: (){
                    onTapCancel();
                  },
                  child: Text(
                    TranslationService.translate(context, "editProfile.cancel",),
                    style: subtitleTextStyle.copyWith(
                      color: StandardColors.grey79,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    onTapChoose();
                  },
                  child: Text(
                    TranslationService.translate(context, "editProfile.choose",),
                    style: subtitleTextStyle.copyWith(
                      color: StandardColors.blueLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],

      ),
    );
  }

  void onTapCancel() {

  }

  void onTapChoose() {

  }








}

