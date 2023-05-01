import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_debug_providers.g.dart';

@Riverpod(keepAlive: true)
class DebugAckermann extends _$DebugAckermann {
  @override
  bool build() => false;

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state = !state);
}

@Riverpod(keepAlive: true)
class DebugTrajectory extends _$DebugTrajectory {
  @override
  bool build() => false;

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state = !state);
}
