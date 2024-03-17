import 'dart:ui';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ui_providers.g.dart';

/// A provider for the UI [Offset] for the autosteering configurator.
@Riverpod(keepAlive: true)
class AutosteeringConfiguratorUiOffset
    extends _$AutosteeringConfiguratorUiOffset {
  @override
  Offset build() {
    ref.listenSelf((previous, next) {
      if (previous != null && next != previous) {
        ref.read(settingsProvider.notifier).update(
              SettingsKey.uiAutosteeringConfiguratorOffset,
              next.toJson(),
            );
      }
    });

    final setting = ref
        .read(settingsProvider.notifier)
        .getMap(SettingsKey.uiAutosteeringConfiguratorOffset);
    return setting != null
        ? OffsetJsonExtension.fromJson(Map<String, dynamic>.from(setting))
        : Offset.zero;
  }

  /// Updates [state] to [value].
  void update(Offset value) => Future(() => state = value);
}

/// A provider for the UI [Offset] for the IMU configurator.
@Riverpod(keepAlive: true)
class ImuConfiguratorUiOffset extends _$ImuConfiguratorUiOffset {
  @override
  Offset build() {
    ref.listenSelf((previous, next) {
      if (previous != null && next != previous) {
        ref.read(settingsProvider.notifier).update(
              SettingsKey.uiImuConfiguratorOffset,
              next.toJson(),
            );
      }
    });

    final setting = ref
        .read(settingsProvider.notifier)
        .getMap(SettingsKey.uiImuConfiguratorOffset);
    return setting != null
        ? OffsetJsonExtension.fromJson(Map<String, dynamic>.from(setting))
        : Offset.zero;
  }

  /// Updates [state] to [value].
  void update(Offset value) => Future(() => state = value);
}

/// A provider for the UI [Offset] for the steering hardware configurator.
@Riverpod(keepAlive: true)
class SteeringHardwareConfiguratorUiOffset
    extends _$SteeringHardwareConfiguratorUiOffset {
  @override
  Offset build() {
    ref.listenSelf((previous, next) {
      if (previous != null && next != previous) {
        ref.read(settingsProvider.notifier).update(
              SettingsKey.uiSteeringHardwareConfiguratorOffset,
              next.toJson(),
            );
      }
    });

    final setting = ref
        .read(settingsProvider.notifier)
        .getMap(SettingsKey.uiSteeringHardwareConfiguratorOffset);
    return setting != null
        ? OffsetJsonExtension.fromJson(Map<String, dynamic>.from(setting))
        : Offset.zero;
  }

  /// Updates [state] to [value].
  void update(Offset value) => Future(() => state = value);
}
