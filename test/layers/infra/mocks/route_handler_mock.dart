import 'package:freeflow/layers/infra/route/route_handler.dart';
import 'package:mocktail/mocktail.dart';

class RouteHandlerMock extends Mock implements RouteHandler {
  When mockCanPopCall() => when(() => canPop());

  void mockCanPopSuccess() {
    mockCanPopCall().thenAnswer((_) => true);
  }

  void mockCanPopFailure() {
    mockCanPopCall().thenAnswer((_) => false);
  }
}
