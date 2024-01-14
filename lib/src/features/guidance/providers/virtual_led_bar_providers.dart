import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'virtual_led_bar_providers.g.dart';

/// A provider for whether the virtual led bar should be enabled/shown.
@Riverpod(keepAlive: true)
class VirtualLedBarEnabled extends _$VirtualLedBarEnabled {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.virtualLedBarEnabled, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.virtualLedBarEnabled) ??
        true;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for storing the configuration for the virtual led bar.
@Riverpod(keepAlive: true)
class VirtualLedBarConfiguration extends _$VirtualLedBarConfiguration {
  @override
  LedBarConfig build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.virtualLedBarConfig, next);
      }
    });

    if (ref
        .read(settingsProvider.notifier)
        .containsKey(SettingsKey.virtualLedBarConfig)) {
      return LedBarConfig.fromJson(
        ref
                .read(settingsProvider.notifier)
                .getMap(SettingsKey.virtualLedBarConfig) ??
            {},
      );
    }
    return const LedBarConfig();
  }

  /// Updates the [state] to [value].
  void update(LedBarConfig value) => Future(() => state = value);
}

/// A provider for whether we're testing the virtual LED bar with
/// [VirtualLedBarTestingDistance].
@Riverpod(keepAlive: true)
class VirtualLedBarTesting extends _$VirtualLedBarTesting {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (next) {
        ref.read(virtualLedBarTestingDistanceProvider.notifier).update(0);
      } else {
        ref.invalidate(virtualLedBarTestingDistanceProvider);
      }
    });
    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for a testing cross track distance for the virtual LED bar.
@riverpod
class VirtualLedBarTestingDistance extends _$VirtualLedBarTestingDistance {
  @override
  double? build() => null;

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}

/// A provider for the perpendicular distance to the currently active
/// guidance, otherwise 0.
@riverpod
double? virtualLedBarPerpendicularDistance(
  VirtualLedBarPerpendicularDistanceRef ref,
) =>
    ref.watch(virtualLedBarTestingDistanceProvider) ??
    ref.watch(abTrackingPerpendicularDistanceProvider) ??
    ref.watch(pathTrackingPerpendicularDistanceProvider);
