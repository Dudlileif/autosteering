// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamepad_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gamepadInputEventsHash() =>
    r'd6d8c4d413d36229f7abf9df2180a9f7c61eeb00';

/// See also [gamepadInputEvents].
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

/// See also [handleGamepadInput].
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

/// See also [ActiveGamepadConfig].
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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
