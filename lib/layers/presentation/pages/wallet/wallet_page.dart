import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';
import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/infra/handlers/check_connection.dart';
import 'package:freeflow/layers/presentation/helpers/dialog/show_dialog_default.dart';
import 'package:freeflow/layers/presentation/pages/wallet/controller/wallet/wallet_controller.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_painter_tabbar.dart';
import 'package:freeflow/layers/presentation/widgets/custom_action_card.dart';
import 'package:freeflow/layers/presentation/widgets/custom_tabbar.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/tab_pages/transcript_view.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/total_amount_text.dart';
import 'package:freeflow/layers/presentation/widgets/loading_widget.dart';
import 'widgets/tab_pages/collectibles.dart';
import 'widgets/tab_pages/flwr.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> with TextThemes {
  WalletController walletController = WalletController();
//  Map _source = {ConnectivityResult.none: false};
  final MyConnectivity _connectivity = MyConnectivity.instance;
  bool stated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await _connectivity.initialise();
      _connectivity.myStream.listen((source) {
        if(source.keys.toList()[0] == ConnectivityResult.none && stated){
          showDialogNoInternetConnection();
        }
      });
      stated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          backgroundImage(context),
          Column(
            children: [
              walletInformation(),
              Expanded(
                child: CustomTabBar(
                  width: double.infinity,
                  tabList: tabList(),
                  tabBarViewList: const [
                    TranscriptView(),
                    FlwrView(),
                    CollectiblesView(),
                  ],
                  indicatorDecoration: const CustomTabIndicator(
                    color: StandardColors.darkGrey,
                    indicatorHeight: 3,
                  ),
                ),
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

  Widget backgroundImage(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Opacity(
        opacity: 0.15,
        child: Image.asset(
          ImagesAsset.background,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget walletInformation() {
    return Padding(
      padding: const EdgeInsets.only(
        left: mdSpacingx2,
        right: mdSpacingx2,
        top: largeSpacingx2,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              walletController.refreshData();
            },
            child: Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(
                bottom: normalSpacing,
              ),
              child:
                  textH6(context, textKey: 'wallet.wallet', isUpperCase: true),
            ),
          ),
          //TODO: awaiting data from backend (ThreeFold)
          Observer(
            builder: (context) {
              return CustomActionCard(
                cardHeight: 176,
                cardWidth: double.infinity,
                child: walletController.walletIsLoading
                    ? customLoading()
                    : const TotalAmountText(totalAmount: '1111'),
                onTapLeftAction: () {
                  showDialogFeatureNotAvailable();
                },
                onTapRighAction: () {
                  showDialogFeatureNotAvailable();
                },
                leftTextAction: 'wallet.deposit',
                rightTextAction: 'wallet.exchange',
              );
            },
          ),
          const SizedBox(
            height: normalSpacing,
          )
        ],
      ),
    );
  }

  Widget customLoading() {
    return const Expanded(
      child: Align(
        alignment: Alignment.centerLeft,
        child: LoadingWidget(
          isLoading: true,
          size: 30,
          padding: EdgeInsets.only(left: normalSpacing),
        ),
      ),
    );
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
