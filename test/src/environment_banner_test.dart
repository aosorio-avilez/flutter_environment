import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_environment/flutter_environment.dart';
import 'package:flutter_environment/src/mock_environment.dart';

const _envName = 'Testing';

void main() {
  testWidgets('environment banner should correspond to environment',
      (tester) async {
    final container = ProviderContainer(overrides: [
      environmentProvider.overrideWithValue(
        MockEnvironment(),
      )
    ]);
    when(() => container.read(environmentProvider).name)
        .thenAnswer((_) => _envName);
    when(() => container.read(environmentProvider).color)
        .thenAnswer((_) => Colors.green);

    await tester.pumpWidget(UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        home: const Scaffold(),
        builder: (context, child) => EnvironmentBanner(child: child!),
      ),
    ));

    await tester.pump();

    expect(find.byKey(const Key(_envName)), findsOneWidget);
  });
}
