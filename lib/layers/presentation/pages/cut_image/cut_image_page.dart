import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/widgets/crop_image/crop_image.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';

import 'controller/cut_image_controller.dart';

class CutImagePage extends StatefulWidget {
  final String imageUrl;
  const CutImagePage({Key? key,required this.imageUrl}) : super(key: key);

  @override
  State<CutImagePage> createState() => _CutImagePageState();
}

class _CutImagePageState extends State<CutImagePage>  with TextThemes{

  CutImageController cutController = findCutImageController();
  final GlobalKey _cropperKeyA = GlobalKey(debugLabel: 'cropperKey');

  @override
  void initState() {
    super.initState();
    cutController.loadingImage(widget.imageUrl);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: cutController.navigatorKey,
      backgroundColor: StandardColors.white,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          Observer(
              builder: (_) {
                return Container(
                  height: MediaQuery.of(context).size.height - 72,
                  width: MediaQuery.of(context).size.width,

                  color: Colors.white,
                  child: Visibility(
                    visible: cutController.bytes != null,
                    child: Cropper(
                      height: MediaQuery.of(context).size.height - 72,
                      width: MediaQuery.of(context).size.width,
                      cropperKey: _cropperKeyA,
                      overlayType: OverlayType.circle,
                      gridLineThickness: 0,
                      zoomScale : 10,
                      image: Image.memory(
                          cutController.bytes ?? Uint8List(1),

                      ),
                    ),
                    replacement: const Center(
                      child: LoadingWidget(
                        isLoading: true,
                        color: StandardColors.greyCA,
                        size: 33,
                      ),
                    ),
                  ),
                );
              },
          ),
          Container(
            height: 72,
            padding:  const EdgeInsets.symmetric(horizontal: mdSpacing),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: (){
                    cutController.onTapCancel();
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
                  onPressed: () async {
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

  Future<void> onTapChoose() async {
    Uint8List? bytes = await cutController.cutImage(_cropperKeyA);

    if(bytes != null){
      cutController.backToEditProfile(bytes);
    }else{
      //TODO
      ///AVISO DE ERRO AO CORTAR IMAGEM
    }
  }


}

