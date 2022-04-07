import 'package:freeflow/data/models/transcript.dart';
import 'package:freeflow/layers/presentation/pages/wallet/mock.dart';
import 'package:mobx/mobx.dart';

part 'wallet_controller.g.dart';

enum ViewContentType { transcript, flwr, collectibles }

class WalletController = WalletControllerBase with _$WalletController;

abstract class WalletControllerBase with Store {
  @observable
  int index = 0;

  @observable
  var transcriptList = ObservableList<Transcript>();
  @observable
  var transcriptFilteredList = ObservableList<Transcript>();

  @observable
  List<String> categoryList = ObservableList<String>();

  @observable
  String? selectedFilterOption;

  @observable
  ViewContentType viewContentType = ViewContentType.transcript;

  @action
  getTranscriptList() {
    if (categoryList.isEmpty) {
      categoryList.add('All');
    }
    final response = Mock.transcripts;
    for (int i = 0; i < response.length; i++) {
      transcriptList.add(response[i]);
      if (!categoryList.contains(response[i].category)) {
        categoryList.add(response[i].category);
      }

      transcriptFilteredList.add(response[i]);
    }
  }

  
}
