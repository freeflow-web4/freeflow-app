import 'package:flutter/material.dart';
import 'package:freeflow/core/translation/translation_service.dart';
import 'package:freeflow/core/utils/assets_constants.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/core/utils/spacing_constants.dart';

import 'package:freeflow/core/utils/text_themes_mixin.dart';
import 'package:freeflow/layers/presentation/pages/wallet/controller/wallet_controller.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_painter_tabbar.dart';
import 'package:freeflow/layers/presentation/widgets/custom_action_card.dart';

import 'package:freeflow/layers/presentation/widgets/custom_tabbar.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/transcript_view.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/total_amount_text.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> with TextThemes {
  WalletController walletController = WalletController();

  @override
  void initState() {
    super.initState();
    walletController.getTranscriptList();
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
              walletInformations(),
              Expanded(
                child: CustomTabBar(
                  width: double.infinity,
                  tabList: tabList(),
                  tabBarViewList: [
                    TranscriptView(walletController: walletController),
                    const SizedBox.shrink(),
                    const SizedBox.shrink(),
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

  Widget walletInformations() {
    return Padding(
      padding: const EdgeInsets.only(
        left: mdSpacingx2,
        right: mdSpacingx2,
        top: largeSpacingx2,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.only(
              bottom: normalSpacing,
            ),
            child: textH6(context, textKey: 'wallet.wallet', isUpperCase: true),
          ),
          //TODO: awaiting data from backend (ThreeFold)
          CustomActionCard(
            cardHeight: 172,
            cardWidth: double.infinity,
            child: const TotalAmountText(totalAmount: '1111'),
            onTapLeftAction: () {},
            onTapRighAction: () {},
            leftTextAction: 'wallet.deposit',
            rightTextAction: 'wallet.exchange',
          ),
          const SizedBox(
            height: normalSpacing,
          )
        ],
      ),
    );
  }
}