import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_default.dart';
import 'package:freeflow/layers/presentation/pages/wallet/controller/transcripts/transcripts_widget_controller.dart';
import 'package:freeflow/layers/presentation/pages/wallet/controller/wallet/wallet_controller.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_painter_tabbar.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/wallet_background_image.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/wallet_info_widget.dart';
import 'package:freeflow/layers/presentation/widgets/custom_tabbar.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/tab_pages/transcript_view.dart';

import 'widgets/tab_pages/collectibles.dart';
import 'widgets/tab_pages/flwr.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> with TextThemes {
  WalletController walletController = WalletController();
  TranscriptsWidgetController transcriptController =
      TranscriptsWidgetController();
  late StreamSubscription<ConnectivityResult> subscription;
  bool stated = false;

  @override
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none && stated) {
        showDialogNoInternetConnection();
      } else {
        stated = true;
      }
    });
  }

  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const WalletBackgroundImage(),
          Column(
            children: [
              WalletInfoWidget(
                walletController: walletController,
                transcriptController: transcriptController,
                onTapLeftAction: () => showDialogFeatureNotAvailable(),
                onTapRighAction: () => showDialogFeatureNotAvailable(),
              ),
              Observer(
                builder: (context) {
                  return Expanded(
                    child: CustomTabBar(
                      width: double.infinity,
                      tabList: tabList(),
                      tabBarViewList: [
                        TranscriptView(
                          controller: transcriptController,
                          isLoading: walletController.walletIsLoading,
                        ),
                        const FlwrView(),
                        const CollectiblesView(),
                      ],
                      indicatorDecoration: const CustomTabIndicator(
                        color: StandardColors.darkGrey,
                        indicatorHeight: 3,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Tab> tabList() {
    List<String> tabNameList = [
      TranslationService.translate(
        context,
        'wallet.transcript',
      ),
      '\$ ${TranslationService.translate(
        context,
        'wallet.flwr',
      ).toUpperCase()}',
      TranslationService.translate(
        context,
        'wallet.collectibles',
      ),
    ];
    return tabNameList
        .map(
          (tabName) => Tab(
            child: textButton5(
              context,
              text: tabName,
            ),
          ),
        )
        .toList();
  }

  Future<void> showDialogFeatureNotAvailable() async {
    showDialogDefault(
      context,
      automaticallyCloses: true,
      type: DialogType.featureNotAvailable,
      onTap: () {},
    );
  }

  Future<void> showDialogNoInternetConnection() async {
    showDialogDefault(
      context,
      type: DialogType.noInternetConnection,
      onTap: () {},
    );
  }
}
