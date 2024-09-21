// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamepad_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gamepadInputEventsHash() =>
    r'd6d8c4d413d36229f7abf9df2180a9f7c61eeb00';

/// A stream of the input events from the gamepad mapped to a more friendly
/// input interface.
///
/// Copied from [gamepadInputEvents].
@ProviderFor(gamepadInputEvents)
final gamepadInputEventsProvider = StreamProvider<GamepadInput>.internal(
  gamepadInputEvents,
  name: r'gamepadInputEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gamepadInputEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GamepadInputEventsRef = StreamProviderRef<GamepadInput>;
String _$handleGamepadInputHash() =>
    r'69b832ca8a051ec31d231c01d46bdbc36430a23d';

/// A provider for handling the inputs from the gamepad.
///
/// Copied from [handleGamepadInput].
@ProviderFor(handleGamepadInput)
final handleGamepadInputProvider = Provider<void>.internal(
  handleGamepadInput,
  name: r'handleGamepadInputProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$handleGamepadInputHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HandleGamepadInputRef = ProviderRef<void>;
String _$activeGamepadConfigHash() =>
    r'4e232a598d135b75cf202d6d8b9475241f4b89f2';

/// The currently active configuration of the gamepad.
///
/// Copied from [ActiveGamepadConfig].
@ProviderFor(ActiveGamepadConfig)
final activeGamepadConfigProvider =
    NotifierProvider<ActiveGamepadConfig, GamepadConfig>.internal(
  ActiveGamepadConfig.new,
  name: r'activeGamepadConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeGamepadConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveGamepadConfig = Notifier<GamepadConfig>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
