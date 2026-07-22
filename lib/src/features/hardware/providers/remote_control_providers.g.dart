// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_control_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for which [RemoteControlButtonAction]s the remote control buttons
/// shuld map to.

@ProviderFor(RemoteControlButtonActions)
final remoteControlButtonActionsProvider =
    RemoteControlButtonActionsProvider._();

/// A provider for which [RemoteControlButtonAction]s the remote control buttons
/// shuld map to.
final class RemoteControlButtonActionsProvider
    extends
        $NotifierProvider<
          RemoteControlButtonActions,
          Map<int, RemoteControlButtonAction?>
        > {
  /// A provider for which [RemoteControlButtonAction]s the remote control buttons
  /// shuld map to.
  RemoteControlButtonActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'remoteControlButtonActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$remoteControlButtonActionsHash();

  @$internal
  @override
  RemoteControlButtonActions create() => RemoteControlButtonActions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, RemoteControlButtonAction?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Map<int, RemoteControlButtonAction?>>(value),
    );
  }
}

String _$remoteControlButtonActionsHash() =>
    r'86e4683e38deb3f3a02b457f80e789086224c945';

/// A provider for which [RemoteControlButtonAction]s the remote control buttons
/// shuld map to.

abstract class _$RemoteControlButtonActions
    extends $Notifier<Map<int, RemoteControlButtonAction?>> {
  Map<int, RemoteControlButtonAction?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              Map<int, RemoteControlButtonAction?>,
              Map<int, RemoteControlButtonAction?>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Map<int, RemoteControlButtonAction?>,
                Map<int, RemoteControlButtonAction?>
              >,
              Map<int, RemoteControlButtonAction?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for sending the current state of the features corresponding of
/// the mapped [RemoteControlButtonActions] to the remote controller.

@ProviderFor(sendRemoteControlLedState)
final sendRemoteControlLedStateProvider = SendRemoteControlLedStateProvider._();

/// A provider for sending the current state of the features corresponding of
/// the mapped [RemoteControlButtonActions] to the remote controller.

final class SendRemoteControlLedStateProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  /// A provider for sending the current state of the features corresponding of
  /// the mapped [RemoteControlButtonActions] to the remote controller.
  SendRemoteControlLedStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendRemoteControlLedStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendRemoteControlLedStateHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return sendRemoteControlLedState(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$sendRemoteControlLedStateHash() =>
    r'74657709b26b4e849112c74f8256ac751c0babbb';
