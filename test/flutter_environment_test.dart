import 'package:flutter_environment/flutter_environment.dart';
import 'package:flutter_environment/src/mock_environment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  test('environment provider should return provided environment', () async {
    const environmentName = 'Testing';
    final container = ProviderContainer(
        overrides: [environmentProvider.overrideWithValue(MockEnvironment())]);
    addTearDown(container.dispose);

    when(() => container.read(environmentProvider).name)
        .thenAnswer((_) => environmentName);

    expect(container.read(environmentProvider).name, environmentName);
  });

  test('environment provider without implement throw UnimplementedError', () {
    final container = ProviderContainer();

    try {
      container.read(environmentProvider);
    } catch (e) {
      expect(e, isA<ProviderException>());
    }
  });
}
