import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/infra/route/route_service.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/route_handler_mock.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() async {

  late RouteHandlerMock routeHandler;
  late RouteService routeService;

  setUp(() {
    routeHandler = RouteHandlerMock();
    routeService = RouteService(routeHandler);
  });

  test('should return true for canPop', () {
    routeHandler.mockCanPopSuccess();
    final canPop = routeService.canPop();
    expect(canPop, equals(true));
    verify(() => routeService.canPop());
  });

  test('should return false for canPop', () {
    routeHandler.mockCanPopFailure();
    final canPop = routeService.canPop();
    expect(canPop, equals(false));
    verify(() => routeService.canPop());
  });
}
