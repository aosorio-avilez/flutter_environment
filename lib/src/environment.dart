import 'package:flutter/material.dart';

import 'environment_values.dart';

/// Environment
///
/// Class that represents an environment
abstract class Environment {
  String get name;

  Color get color;

  EnvironmentValues get values;
}
