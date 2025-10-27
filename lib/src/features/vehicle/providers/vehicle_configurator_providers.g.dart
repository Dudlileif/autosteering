// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_configurator_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the index of the naviagtion rail of the vehicle configurator
/// dialog.

@ProviderFor(VehicleConfiguratorIndex)
const vehicleConfiguratorIndexProvider = VehicleConfiguratorIndexProvider._();

/// A provider for the index of the naviagtion rail of the vehicle configurator
/// dialog.
final class VehicleConfiguratorIndexProvider
    extends $NotifierProvider<VehicleConfiguratorIndex, int> {
  /// A provider for the index of the naviagtion rail of the vehicle configurator
  /// dialog.
  const VehicleConfiguratorIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vehicleConfiguratorIndexProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vehicleConfiguratorIndexHash();

  @$internal
  @override
  VehicleConfiguratorIndex create() => VehicleConfiguratorIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$vehicleConfiguratorIndexHash() =>
    r'59eb4552cefea9c3b9faf76807f06d4c9b3fd013';

/// A provider for the index of the naviagtion rail of the vehicle configurator
/// dialog.

abstract class _$VehicleConfiguratorIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the vehicle from the configurator.

@ProviderFor(ConfiguredVehicle)
const configuredVehicleProvider = ConfiguredVehicleProvider._();

/// A provider for the vehicle from the configurator.
final class ConfiguredVehicleProvider
    extends $NotifierProvider<ConfiguredVehicle, Vehicle> {
  /// A provider for the vehicle from the configurator.
  const ConfiguredVehicleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configuredVehicleProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configuredVehicleHash();

  @$internal
  @override
  ConfiguredVehicle create() => ConfiguredVehicle();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Vehicle value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Vehicle>(value),
    );
  }
}

String _$configuredVehicleHash() => r'eb1f64783782544db4e453b41900d68d6c47a02f';

/// A provider for the vehicle from the configurator.

abstract class _$ConfiguredVehicle extends $Notifier<Vehicle> {
  Vehicle build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Vehicle, Vehicle>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Vehicle, Vehicle>,
              Vehicle,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the [TextEditingController] for the name in the
/// vehicle configurator.

@ProviderFor(ConfiguredVehicleNameTextController)
const configuredVehicleNameTextControllerProvider =
    ConfiguredVehicleNameTextControllerProvider._();

/// A provider for the [TextEditingController] for the name in the
/// vehicle configurator.
final class ConfiguredVehicleNameTextControllerProvider
    extends
        $NotifierProvider<
          ConfiguredVehicleNameTextController,
          Raw<TextEditingController>
        > {
  /// A provider for the [TextEditingController] for the name in the
  /// vehicle configurator.
  const ConfiguredVehicleNameTextControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configuredVehicleNameTextControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$configuredVehicleNameTextControllerHash();

  @$internal
  @override
  ConfiguredVehicleNameTextController create() =>
      ConfiguredVehicleNameTextController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<TextEditingController> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<TextEditingController>>(value),
    );
  }
}

String _$configuredVehicleNameTextControllerHash() =>
    r'd8b7f016f0a9b03ed341a95fe5cc05009c10a0ed';

/// A provider for the [TextEditingController] for the name in the
/// vehicle configurator.

abstract class _$ConfiguredVehicleNameTextController
    extends $Notifier<Raw<TextEditingController>> {
  Raw<TextEditingController> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<Raw<TextEditingController>, Raw<TextEditingController>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<TextEditingController>,
                Raw<TextEditingController>
              >,
              Raw<TextEditingController>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
