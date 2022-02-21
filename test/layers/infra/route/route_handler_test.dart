import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freeflow/layers/infra/route/route_service.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/route_handler_mock.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() async {
  late MockBuildContext fakeContext;

  setUpAll(() {
    fakeContext = MockBuildContext();
  });
  late RouteHandlerMock routeHandler;
  late RouteService routeService;

  setUp(() {
    routeHandler = RouteHandlerMock();
    routeService = RouteService(routeHandler);
  });

  test('should return true for canPop', () {
    routeHandler.mockCanPopSuccess(fakeContext);
    final canPop = routeService.canPop(fakeContext);
    expect(canPop, equals(true));
    verify(() => routeService.canPop(fakeContext));
  });

  test('should return false for canPop', () {
    routeHandler.mockCanPopFailure(fakeContext);
    final canPop = routeService.canPop(fakeContext);
    expect(canPop, equals(false));
    verify(() => routeService.canPop(fakeContext));
  });
}
