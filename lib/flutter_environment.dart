library flutter_environment;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_environment/src/environment.dart';

export 'package:flutter_environment/src/environment.dart';
export 'package:flutter_environment/src/environment_values.dart';
export 'package:flutter_environment/src/environment_banner.dart';

/// Environment provider
///
/// Provider that share and hold the actual injected environment
final environmentProvider = Provider<Environment>((ref) {
  throw UnimplementedError();
});
