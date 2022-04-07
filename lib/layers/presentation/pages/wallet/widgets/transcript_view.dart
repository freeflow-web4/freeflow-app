import 'package:flutter/material.dart';
import 'package:freeflow/data/models/transcript.dart';
import 'package:freeflow/layers/presentation/pages/wallet/controller/wallet_controller.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_bottom_sheet.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_filter_bar_item.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_radio_tile_button.dart';
import 'package:freeflow/layers/presentation/pages/wallet/widgets/custom_rounded_card.dart';
import 'package:freeflow/layers/presentation/widgets/circular_gradient_icon_button.dart';

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
  late List<Transcript> transcriptList;
  late List<String> categoryList;
  @override
  void initState() {
    getTranscriptList();
    super.initState();
  }

  getTranscriptList() {
    setState(() {
      transcriptList = widget.walletController.transcriptList;
      categoryList = widget.walletController.categoryList;
    });
  }

  int index = 0;

  List transcriptFiltereList = [];
  String? filtroSecundarioSelecionado;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
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
    List filtrosPrincipais = [];
    List<String> filtrosSecundarios = [];
    for (int i = 0; i < categoryList.length; i++) {
      if (i < 2) {
        filtrosPrincipais.add(categoryList[i]);
      } else {
        filtrosSecundarios.add(categoryList[i]);
      }
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: BoxConstraints(minWidth: constraints.maxWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...mainFilterWidgetList(filtrosPrincipais),
              extraFilterWidgetMenu(filtrosSecundarios: filtrosSecundarios)
            ],
          ),
        );
      },
    );
  }

  List<Widget> mainFilterWidgetList(List filtrosPrincipais) {
    return filtrosPrincipais.map((e) {
      return CustomFilterBarItem(
        tabName: e,
        isSelected: index == categoryList.indexOf(e),
        onTap: () {
          setState(() {
            filtroSecundarioSelecionado = '';
            index = categoryList.indexOf(e);
          });
        },
      );
    }).toList();
  }

  Widget extraFilterWidgetMenu({required List<String> filtrosSecundarios}) {
    return CircularGradientIconButton(
      child: const Icon(
        Icons.add_rounded,
        color: Colors.grey,
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
          barrierColor: Colors.black.withOpacity(0.5),
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setBottomSheetState) {
                return CustomBottomSheet(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: filtrosSecundarios
                        .map(
                          (e) => CustomRadioTile<String?>(
                            value: e,
                            groupValue: filtroSecundarioSelecionado,
                            onChanged: (value) {
                              setBottomSheetState(() {
                                filtroSecundarioSelecionado = value;
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
