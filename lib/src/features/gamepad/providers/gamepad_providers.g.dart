// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamepad_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The currently active configuration of the gamepad.

@ProviderFor(ActiveGamepadConfig)
final activeGamepadConfigProvider = ActiveGamepadConfigProvider._();

/// The currently active configuration of the gamepad.
final class ActiveGamepadConfigProvider
    extends $NotifierProvider<ActiveGamepadConfig, GamepadConfig> {
  /// The currently active configuration of the gamepad.
  ActiveGamepadConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeGamepadConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeGamepadConfigHash();

  @$internal
  @override
  ActiveGamepadConfig create() => ActiveGamepadConfig();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GamepadConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GamepadConfig>(value),
    );
  }
}

String _$activeGamepadConfigHash() =>
    r'4e232a598d135b75cf202d6d8b9475241f4b89f2';

/// The currently active configuration of the gamepad.

abstract class _$ActiveGamepadConfig extends $Notifier<GamepadConfig> {
  GamepadConfig build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<GamepadConfig, GamepadConfig>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GamepadConfig, GamepadConfig>,
              GamepadConfig,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A stream of the input events from the gamepad mapped to a more friendly
/// input interface.

@ProviderFor(gamepadInputEvents)
final gamepadInputEventsProvider = GamepadInputEventsProvider._();

/// A stream of the input events from the gamepad mapped to a more friendly
/// input interface.

final class GamepadInputEventsProvider
    extends
        $FunctionalProvider<
          AsyncValue<GamepadInput>,
          GamepadInput,
          Stream<GamepadInput>
        >
    with $FutureModifier<GamepadInput>, $StreamProvider<GamepadInput> {
  /// A stream of the input events from the gamepad mapped to a more friendly
  /// input interface.
  GamepadInputEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gamepadInputEventsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gamepadInputEventsHash();

  @$internal
  @override
  $StreamProviderElement<GamepadInput> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<GamepadInput> create(Ref ref) {
    return gamepadInputEvents(ref);
  }
}

String _$gamepadInputEventsHash() =>
    r'd6d8c4d413d36229f7abf9df2180a9f7c61eeb00';

/// A provider for handling the inputs from the gamepad.

@ProviderFor(handleGamepadInput)
final handleGamepadInputProvider = HandleGamepadInputProvider._();

/// A provider for handling the inputs from the gamepad.

final class HandleGamepadInputProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  /// A provider for handling the inputs from the gamepad.
  HandleGamepadInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'handleGamepadInputProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$handleGamepadInputHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return handleGamepadInput(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$handleGamepadInputHash() =>
    r'cf25de09f5847baac06904baf347acd9be578b60';
