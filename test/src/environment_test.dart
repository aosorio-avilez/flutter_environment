import 'package:flutter/material.dart';
import 'package:flutter_environment/src/mock_environment_values.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_environment/flutter_environment.dart';

const _envName = 'Testing';
const _envColor = Colors.blue;
final _envValues = MockEnvironmentValues();

class TestEnvironment extends Environment {
  @override
  Color get color => _envColor;

  @override
  String get name => _envName;

  @override
  EnvironmentValues get values => _envValues;
}

void main() {
  test('environment should build correctly', () async {
    final environment = TestEnvironment();

    expect(environment.name, _envName);
    expect(environment.color, _envColor);
    expect(environment.values, _envValues);
  });
}
