import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_environment/flutter_environment.dart';

/// Environment banner widget
///
/// Overlay banner on the top left corner of the screen.
/// Apply color and name from Environment
class EnvironmentBanner extends ConsumerWidget {
  const EnvironmentBanner({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final environment = ref.watch(environmentProvider);

    return Stack(
      key: Key(environment.name),
      children: <Widget>[
        child,
        SizedBox(
          width: 35,
          height: 55,
          child: CustomPaint(
            painter: BannerPainter(
              message: environment.name,
              textDirection: Directionality.of(context),
              layoutDirection: Directionality.of(context),
              location: BannerLocation.topStart,
              color: environment.color,
            ),
          ),
        )
      ],
    );
  }
}
