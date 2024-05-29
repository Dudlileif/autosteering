// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$audioAutosteeringEnabledHash() =>
    r'9263e59d683b32fdec8d705d90cd9b3a5bfd6bb1';

/// A provider for playing an audio notification/sound when enabling
/// autosteering.
///
/// Copied from [audioAutosteeringEnabled].
@ProviderFor(audioAutosteeringEnabled)
final audioAutosteeringEnabledProvider =
    AutoDisposeFutureProvider<void>.internal(
  audioAutosteeringEnabled,
  name: r'audioAutosteeringEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$audioAutosteeringEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AudioAutosteeringEnabledRef = AutoDisposeFutureProviderRef<void>;
String _$audioAutosteeringDisabledHash() =>
    r'1583d3adc8d0e84ffa2bdc499453f3001dcf9462';

/// A provider for playing an audio notification/sound when disabling
/// autosteering.
///
/// Copied from [audioAutosteeringDisabled].
@ProviderFor(audioAutosteeringDisabled)
final audioAutosteeringDisabledProvider =
    AutoDisposeFutureProvider<void>.internal(
  audioAutosteeringDisabled,
  name: r'audioAutosteeringDisabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$audioAutosteeringDisabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AudioAutosteeringDisabledRef = AutoDisposeFutureProviderRef<void>;
String _$audioAutosteeringStandbyHash() =>
    r'541894d9268491a8cb4395ff55d7052b3621e769';

/// A provider for playing an audio notification/sound when autosteering is
/// in standby.
///
/// Copied from [audioAutosteeringStandby].
@ProviderFor(audioAutosteeringStandby)
final audioAutosteeringStandbyProvider =
    AutoDisposeFutureProvider<void>.internal(
  audioAutosteeringStandby,
  name: r'audioAutosteeringStandbyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$audioAutosteeringStandbyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AudioAutosteeringStandbyRef = AutoDisposeFutureProviderRef<void>;
String _$audioRTKLostAlarmHash() => r'3c1954590ac05c965bc45d3c932e5b3e7b01f7d9';

/// A provider for playing an audio notification/sound when GNSS RTK fix
/// accuracy is lost.
///
/// Copied from [audioRTKLostAlarm].
@ProviderFor(audioRTKLostAlarm)
final audioRTKLostAlarmProvider = AutoDisposeFutureProvider<void>.internal(
  audioRTKLostAlarm,
  name: r'audioRTKLostAlarmProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$audioRTKLostAlarmHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AudioRTKLostAlarmRef = AutoDisposeFutureProviderRef<void>;
String _$audioVolumeAutosteeringEnabledHash() =>
    r'34613bd6ea9cec3bd0056de89cdd873a107cd5d9';

/// A provider for the audio volume level for [audioAutosteeringEnabled].
///
/// Copied from [AudioVolumeAutosteeringEnabled].
@ProviderFor(AudioVolumeAutosteeringEnabled)
final audioVolumeAutosteeringEnabledProvider = AutoDisposeNotifierProvider<
    AudioVolumeAutosteeringEnabled, double>.internal(
  AudioVolumeAutosteeringEnabled.new,
  name: r'audioVolumeAutosteeringEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$audioVolumeAutosteeringEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AudioVolumeAutosteeringEnabled = AutoDisposeNotifier<double>;
String _$audioVolumeAutosteeringDisabledHash() =>
    r'6deab12a1bc64d1aae7d650e24ba467d4d54b439';

/// A provider for the audio volume level for [audioAutosteeringDisabled].
///
/// Copied from [AudioVolumeAutosteeringDisabled].
@ProviderFor(AudioVolumeAutosteeringDisabled)
final audioVolumeAutosteeringDisabledProvider = AutoDisposeNotifierProvider<
    AudioVolumeAutosteeringDisabled, double>.internal(
  AudioVolumeAutosteeringDisabled.new,
  name: r'audioVolumeAutosteeringDisabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$audioVolumeAutosteeringDisabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AudioVolumeAutosteeringDisabled = AutoDisposeNotifier<double>;
String _$audioVolumeAutosteeringStandbyHash() =>
    r'482ae8beb00514aacf700effa88d1a7d68a3a4a7';

/// A provider for the audio volume level for [audioAutosteeringStandby].
///
/// Copied from [AudioVolumeAutosteeringStandby].
@ProviderFor(AudioVolumeAutosteeringStandby)
final audioVolumeAutosteeringStandbyProvider = AutoDisposeNotifierProvider<
    AudioVolumeAutosteeringStandby, double>.internal(
  AudioVolumeAutosteeringStandby.new,
  name: r'audioVolumeAutosteeringStandbyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$audioVolumeAutosteeringStandbyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AudioVolumeAutosteeringStandby = AutoDisposeNotifier<double>;
String _$audioVolumeRTKLostAlarmHash() =>
    r'10e33e251ec8fc49d50161db355d7d24f2dd4d53';

/// A provider for the audio volume level for [audioRTKLostAlarm].
///
/// Copied from [AudioVolumeRTKLostAlarm].
@ProviderFor(AudioVolumeRTKLostAlarm)
final audioVolumeRTKLostAlarmProvider =
    AutoDisposeNotifierProvider<AudioVolumeRTKLostAlarm, double>.internal(
  AudioVolumeRTKLostAlarm.new,
  name: r'audioVolumeRTKLostAlarmProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$audioVolumeRTKLostAlarmHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AudioVolumeRTKLostAlarm = AutoDisposeNotifier<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
