// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_control_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$remoteControlButtonActionsHash() =>
    r'b6b93263e29e05ccd98d940111c631990abb7998';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
