import 'package:freeflow/layers/infra/route/route_handler.dart';
import 'package:mocktail/mocktail.dart';

class RouteHandlerMock extends Mock implements RouteHandler {
  When mockCanPopCall(context) => when(() => canPop(context));

  void mockCanPopSuccess(context) {
    mockCanPopCall(context).thenAnswer((_) => true);
  }

  void mockCanPopFailure(context) {
    mockCanPopCall(context).thenAnswer((_) => false);
  }
}
