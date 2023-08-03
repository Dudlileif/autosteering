import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gauge_providers.g.dart';

/// A provider for the distance travelled by the vehicle.
@riverpod
class GaugeTravelledDistance extends _$GaugeTravelledDistance {
  @override
  double build() => 0;

  /// Update the [state] by adding [value].
  void updateWith(double value) => Future(() => state += value);
}

/// A provider for the vehicle's velocity gauge.
@riverpod
class GaugeVelocity extends _$GaugeVelocity {
  @override
  double build() => 0;

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the vehicle's bearing gauge.
@riverpod
class GaugeBearing extends _$GaugeBearing {
  @override
  double build() => 0;

  /// Update the [state] by adding [value].
  void update(double value) => Future(
        () => state = value,
      );
}
