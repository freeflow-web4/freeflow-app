import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freeflow/core/utils/colors_constants.dart';
import 'package:freeflow/layers/data/datasources/remote/wallet_datasource_imp.dart';
import 'package:freeflow/layers/domain/entities/transcript_entity.dart';
import 'package:freeflow/layers/infra/http/http_client.dart';
import 'package:freeflow/layers/presentation/pages/wallet/controller/wallet_controller.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_bottom_sheet.dart';
import 'package:freeflow/layers/presentation/widgets/custom_filter_bar_item.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_radio_tile_button.dart';
import 'package:freeflow/layers/presentation/widgets/custom_rounded_card.dart';
import 'package:freeflow/layers/presentation/widgets/circular_gradient_icon_button.dart';
import 'package:get_it/get_it.dart';

class TranscriptView extends StatefulWidget {
  final WalletController walletController;
  const TranscriptView({
    Key? key,
    required this.walletController,
  }) : super(key: key);

  @override
  State<TranscriptView> createState() => _TranscriptViewState();
}

class _TranscriptViewState extends State<TranscriptView> {
  late List<TranscriptEntity> transcriptList;
  late List<String> categoryList;
  WalletDatasourceImp transcriptDatasourceImp =
      WalletDatasourceImp(GetIt.I.get<HttpClient>());

  @override
  void initState() {
    getTranscriptList();
    super.initState();
  }

  getTranscriptList() async {
    transcriptList = await widget.walletController.getTranscriptList();
    categoryList = widget.walletController.getCategoryList(transcriptList);
  }

  int index = 0;
  List transcriptFiltereList = [];
  String? secondarySelectedFilter;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: widget.walletController.viewState == ViewState.loading
            ? const Center(
                child: SizedBox(
                  height: 40,
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(
                children: [
                  getWidgetBar(),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: CustomRoundedCard(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      margin: EdgeInsets.zero,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: getTodosFiltrados(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
      );
    });
  }

  getTodosFiltrados() {
    transcriptFiltereList.clear();

    for (int i = 0; i < transcriptList.length; i++) {
      if (categoryList[index] == 'All') {
        transcriptFiltereList.add(transcriptList[i].category);
      }
      if (categoryList[index] == transcriptList[i].category) {
        transcriptFiltereList.add(transcriptList[i].category);
      }
    }

    return transcriptFiltereList
        .map(
          (e) => Container(
            height: 100,
            width: double.infinity,
            margin: const EdgeInsets.all(8),
            color: const Color.fromARGB(255, 236, 236, 236),
            child: Text(e),
          ),
        )
        .toList();
  }

  Widget getWidgetBar() {
    List mainFilters = [];
    List<String> secondaryFilters = [];
    for (int i = 0; i < categoryList.length; i++) {
      if (i < 2) {
        mainFilters.add(categoryList[i]);
      } else {
        secondaryFilters.add(categoryList[i]);
      }
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: BoxConstraints(minWidth: constraints.maxWidth),
          margin: const EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...mainFilterWidgetList(mainFilters),
              extraFilterWidgetMenu(secondaryFilters: secondaryFilters)
            ],
          ),
        );
      },
    );
  }

  List<Widget> mainFilterWidgetList(List mainFilters) {
    return mainFilters.map((e) {
      return CustomFilterBarItem(
        tabName: e,
        isSelected: index == categoryList.indexOf(e),
        onTap: () {
          setState(() {
            secondarySelectedFilter = '';
            index = categoryList.indexOf(e);
          });
        },
      );
    }).toList();
  }

  Widget extraFilterWidgetMenu({required List<String> secondaryFilters}) {
    return CircularGradientIconButton(
      child: Icon(
        Icons.add_rounded,
        color: StandardColors.textMediumGrey.withOpacity(0.6),
      ),
      isSelected: index > 1,
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          barrierColor: StandardColors.darkGrey.withOpacity(0.7),
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setBottomSheetState) {
                return CustomBottomSheet(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: secondaryFilters
                        .map(
                          (e) => CustomRadioTile<String?>(
                            value: e,
                            groupValue: secondarySelectedFilter,
                            onChanged: (value) {
                              setBottomSheetState(() {
                                secondarySelectedFilter = value;
                              });

                              setState(() {
                                index = categoryList.indexOf(value!);
                              });

                              Navigator.pop(context);
                            },
                            label: e,
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
