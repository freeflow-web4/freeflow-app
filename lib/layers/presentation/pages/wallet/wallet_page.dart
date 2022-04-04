import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/layers/presentation/pages/wallet/controller/wallet_controller.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_action_card.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_bottom_sheet.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_filter_bar_item.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_radio_tile_button.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_rounded_card.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_tabbar.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/total_amount_text.dart';
import 'package:freeflow/layers/presentation/widgets/circular_gradient_icon_button.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  WalletController walletController = WalletController();

  @override
  void initState() {
    walletController.getTranscriptList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          backgroundImage(context),
          Observer(
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //menu
                  Center(
                    child: Container(
                      height: 72,
                      width: 64,
                      color: Colors.cyanAccent,
                    ),
                  ),
                  header(),
                  tabBar(),
                  viewContent()
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget viewContent() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: CustomRoundedCard(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: getContentViewList(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getContentViewList() {
    if (walletController.viewContentType == ViewContentType.transcript) {
      return getTranscriptViewContentList();
    } else if (walletController.viewContentType == ViewContentType.flwr) {
      return [];
    } else {
      return [];
    }
  }

  List<Widget> getTranscriptViewContentList() {
    return walletController.transcriptFilteredList
        .map(
          (transcript) => Container(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 173, 255, 236),
            child: Center(child: Text(transcript.category)),
          ),
        )
        .toList();
  }

  Widget tabBar() {
    return CustomTabBar(
      width: double.infinity,
      height: 92,
      tabList: tabList(),
      tabBarViewList: [
        transcriptContent(),
        flwrContent(),
        collectiblesContent()
      ],
    );
  }

  Widget transcriptContent() {
    return filterBarWidget(
      context: context,
      walletController: walletController,
      hasCircularButton: true,
    );
  }

  Widget flwrContent() {
    return Container();
  }

  Widget collectiblesContent() {
    return Container();
  }

  List<Tab> tabList() {
    List<String> tabNameList = ['Transcript', '\$FLWR', 'Collectibles'];
    return tabNameList
        .map(
          (tabName) => Tab(
            child: Text(
              tabName,
              style: const TextStyle(
                fontFamily: 'Akrobat',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        )
        .toList();
  }

  Widget filterBarWidget({
    required BuildContext context,
    required WalletController walletController,
    bool hasCircularButton = false,
  }) {
    return SizedBox(
      height: 56,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: getFilterBar(
                context,
                filterNameList: walletController.categoryList,
                controller: walletController,
                hasExtraFilters: hasCircularButton,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  Widget backgroundImage(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Opacity(
        opacity: 0.2,
        child: Image.asset(
          'assets/images/background.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget header() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: 8, left: 32),
            child: Text(
              'WALLET',
              style: TextStyle(
                fontFamily: 'Akrobat',
                fontWeight: FontWeight.w500,
                fontSize: 26,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: CustomActionCard(
            cardHeight: 160,
            cardWidth: double.infinity,
            child: const TotalAmountText(totalAmount: '1000'),
            onTapLeftAction: () {},
            onTapRighAction: () {},
            leftTextAction: 'Deposit',
            rightTextAction: 'Exchange',
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }

  getMainFilters({
    required int count,
    required List<String> filterNameList,
    required WalletController controller,
    required List<Widget> filterBarWidgetList,
    required List<String> extraFilterList,
  }) {
    for (int i = 0; i < filterNameList.length; i++) {
      if (i < count) {
        filterBarWidgetList.add(
          Builder(
            builder: (context) {
              return CustomFilterBarItem(
                tabName: filterNameList[i],
                isSelected: i == controller.index,
                onTap: () {
                  controller.index = i;
                  controller.filterTrasncript(controller.categoryList[i]);
                },
              );
            },
          ),
        );
      } else {
        extraFilterList.add(filterNameList[i]);
      }
    }

    filterBarWidgetList.add(
      extraFilterWidget(options: extraFilterList, controller: controller),
    );
  }

  Widget extraFilterWidget({
    required List<String> options,
    required WalletController controller,
  }) {
    return CircularGradientIconButton(
      child: const Icon(Icons.add),
      margin: const EdgeInsets.only(left: 8),
      isSelected: controller.index > 1,
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          builder: (context) {
            return StatefulBuilder(
              builder: (context, StateSetter setState) {
                return CustomBottomSheet(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: options
                        .map(
                          (e) => CustomRadioTile(
                            value: e,
                            label: e,
                            groupValue: controller.selectedFilterOption,
                            onChanged: (String? value) {
                              controller.selectedFilterOption = '';
                              controller.selectedFilterOption = value;
                              controller.filterTrasncript(e);
                              setState(() {});

                              Navigator.of(context).pop();
                            },
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            );
          },
        );
        controller.index += 2;
      },
    );
  }

  List<Widget> getFilterBar(
    BuildContext context, {
    required List<String> filterNameList,
    required WalletController controller,
    bool hasExtraFilters = false,
  }) {
    List<Widget> filterBarWidgetList = [];
    List<String> extraFilterList = [];
    if (hasExtraFilters) {
      getMainFilters(
        count: 2,
        filterNameList: filterNameList,
        controller: controller,
        extraFilterList: extraFilterList,
        filterBarWidgetList: filterBarWidgetList,
      );
    } else {
      for (int i = 0; i < filterNameList.length; i++) {
        filterBarWidgetList.add(
          Builder(
            builder: (context) {
              return CustomFilterBarItem(
                tabName: filterNameList[i],
                isSelected: i == controller.index,
                onTap: () {
                  controller.index = i;
                  controller.filterTrasncript(controller.categoryList[i]);
                },
              );
            },
          ),
        );
      }
    }
    return filterBarWidgetList;
  }
}
