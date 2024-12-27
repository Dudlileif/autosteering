// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_control_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendRemoteControlLedStateHash() =>
    r'0e8a24d9c08d79621e2220e413037f157c304b53';

/// A provider for sending the current state of the features corresponding of
/// the mapped [RemoteControlButtonActions] to the remote controller.
///
/// Copied from [sendRemoteControlLedState].
@ProviderFor(sendRemoteControlLedState)
final sendRemoteControlLedStateProvider = AutoDisposeProvider<void>.internal(
  sendRemoteControlLedState,
  name: r'sendRemoteControlLedStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sendRemoteControlLedStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SendRemoteControlLedStateRef = AutoDisposeProviderRef<void>;
String _$remoteControlButtonActionsHash() =>
    r'86e4683e38deb3f3a02b457f80e789086224c945';

/// A provider for which [RemoteControlButtonAction]s the remote control buttons
/// shuld map to.
///
/// Copied from [RemoteControlButtonActions].
@ProviderFor(RemoteControlButtonActions)
final remoteControlButtonActionsProvider = NotifierProvider<
    RemoteControlButtonActions, Map<int, RemoteControlButtonAction?>>.internal(
  RemoteControlButtonActions.new,
  name: r'remoteControlButtonActionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$remoteControlButtonActionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RemoteControlButtonActions
    = Notifier<Map<int, RemoteControlButtonAction?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
