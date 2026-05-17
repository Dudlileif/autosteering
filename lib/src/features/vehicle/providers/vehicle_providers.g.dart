// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The main provider for the vehicle state.

@ProviderFor(MainVehicle)
final mainVehicleProvider = MainVehicleProvider._();

/// The main provider for the vehicle state.
final class MainVehicleProvider
    extends $NotifierProvider<MainVehicle, Vehicle> {
  /// The main provider for the vehicle state.
  MainVehicleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mainVehicleProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mainVehicleHash();

  @$internal
  @override
  MainVehicle create() => MainVehicle();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Vehicle value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Vehicle>(value),
    );
  }
}

String _$mainVehicleHash() => r'0ebe1fa9a4a91073984d25b186bdb3913bbf2e8c';

/// The main provider for the vehicle state.

abstract class _$MainVehicle extends $Notifier<Vehicle> {
  Vehicle build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Vehicle, Vehicle>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Vehicle, Vehicle>,
              Vehicle,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the active [AutosteeringState] of the vehicle.

@ProviderFor(ActiveAutosteeringState)
final activeAutosteeringStateProvider = ActiveAutosteeringStateProvider._();

/// A provider for the active [AutosteeringState] of the vehicle.
final class ActiveAutosteeringStateProvider
    extends $NotifierProvider<ActiveAutosteeringState, AutosteeringState> {
  /// A provider for the active [AutosteeringState] of the vehicle.
  ActiveAutosteeringStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeAutosteeringStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeAutosteeringStateHash();

  @$internal
  @override
  ActiveAutosteeringState create() => ActiveAutosteeringState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AutosteeringState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AutosteeringState>(value),
    );
  }
}

String _$activeAutosteeringStateHash() =>
    r'b537d59efe69ab2e11126bbb1b9bc70661216fc4';

/// A provider for the active [AutosteeringState] of the vehicle.

abstract class _$ActiveAutosteeringState extends $Notifier<AutosteeringState> {
  AutosteeringState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AutosteeringState, AutosteeringState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AutosteeringState, AutosteeringState>,
              AutosteeringState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for saving [vehicle] to a file in the user file directory.
///
/// Override the file name with [overrideName].

@ProviderFor(saveVehicle)
final saveVehicleProvider = SaveVehicleFamily._();

/// A provider for saving [vehicle] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SaveVehicleProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for saving [vehicle] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  SaveVehicleProvider._({
    required SaveVehicleFamily super.from,
    required (Vehicle, {String? overrideName, bool downloadIfWeb})
    super.argument,
  }) : super(
         retry: null,
         name: r'saveVehicleProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$saveVehicleHash();

  @override
  String toString() {
    return r'saveVehicleProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument =
        this.argument as (Vehicle, {String? overrideName, bool downloadIfWeb});
    return saveVehicle(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveVehicleProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$saveVehicleHash() => r'bed0b0eaa85f2ca4441391fd8b7af974a3e36523';

/// A provider for saving [vehicle] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SaveVehicleFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (Vehicle, {String? overrideName, bool downloadIfWeb})
        > {
  SaveVehicleFamily._()
    : super(
        retry: null,
        name: r'saveVehicleProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// A provider for saving [vehicle] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].

  SaveVehicleProvider call(
    Vehicle vehicle, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) => SaveVehicleProvider._(
    argument: (
      vehicle,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    ),
    from: this,
  );

  @override
  String toString() => r'saveVehicleProvider';
}

/// A provider for saving [vehicle] to a file.
///
/// Override the file name with [overrideName].

@ProviderFor(exportVehicle)
final exportVehicleProvider = ExportVehicleFamily._();

/// A provider for saving [vehicle] to a file.
///
/// Override the file name with [overrideName].

final class ExportVehicleProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for saving [vehicle] to a file.
  ///
  /// Override the file name with [overrideName].
  ExportVehicleProvider._({
    required ExportVehicleFamily super.from,
    required (Vehicle, {String? overrideName, bool downloadIfWeb})
    super.argument,
  }) : super(
         retry: null,
         name: r'exportVehicleProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportVehicleHash();

  @override
  String toString() {
    return r'exportVehicleProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument =
        this.argument as (Vehicle, {String? overrideName, bool downloadIfWeb});
    return exportVehicle(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportVehicleProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportVehicleHash() => r'cd71215436b2f327671f58007d90e4ae056e3776';

/// A provider for saving [vehicle] to a file.
///
/// Override the file name with [overrideName].

final class ExportVehicleFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (Vehicle, {String? overrideName, bool downloadIfWeb})
        > {
  ExportVehicleFamily._()
    : super(
        retry: null,
        name: r'exportVehicleProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for saving [vehicle] to a file.
  ///
  /// Override the file name with [overrideName].

  ExportVehicleProvider call(
    Vehicle vehicle, {
    String? overrideName,
    bool downloadIfWeb = true,
  }) => ExportVehicleProvider._(
    argument: (
      vehicle,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    ),
    from: this,
  );

  @override
  String toString() => r'exportVehicleProvider';
}

/// A provider for reading and holding all the saved [Vehicle]s in the
/// user file directory.

@ProviderFor(savedVehicles)
final savedVehiclesProvider = SavedVehiclesProvider._();

/// A provider for reading and holding all the saved [Vehicle]s in the
/// user file directory.

final class SavedVehiclesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Vehicle>>,
          List<Vehicle>,
          FutureOr<List<Vehicle>>
        >
    with $FutureModifier<List<Vehicle>>, $FutureProvider<List<Vehicle>> {
  /// A provider for reading and holding all the saved [Vehicle]s in the
  /// user file directory.
  SavedVehiclesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedVehiclesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedVehiclesHash();

  @$internal
  @override
  $FutureProviderElement<List<Vehicle>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Vehicle>> create(Ref ref) {
    return savedVehicles(ref);
  }
}

String _$savedVehiclesHash() => r'3aaba3bb1dcc7019f369f7dc7c79b772728e572f';

/// A provider for deleting [vehicle] from the user file system.
///
/// Override the file name with [overrideName].

@ProviderFor(deleteVehicle)
final deleteVehicleProvider = DeleteVehicleFamily._();

/// A provider for deleting [vehicle] from the user file system.
///
/// Override the file name with [overrideName].

final class DeleteVehicleProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for deleting [vehicle] from the user file system.
  ///
  /// Override the file name with [overrideName].
  DeleteVehicleProvider._({
    required DeleteVehicleFamily super.from,
    required (Vehicle, {String? overrideName}) super.argument,
  }) : super(
         retry: null,
         name: r'deleteVehicleProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteVehicleHash();

  @override
  String toString() {
    return r'deleteVehicleProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (Vehicle, {String? overrideName});
    return deleteVehicle(ref, argument.$1, overrideName: argument.overrideName);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteVehicleProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteVehicleHash() => r'52cc524e4e9958192919a6883fd8e4eb61f628ad';

/// A provider for deleting [vehicle] from the user file system.
///
/// Override the file name with [overrideName].

final class DeleteVehicleFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (Vehicle, {String? overrideName})
        > {
  DeleteVehicleFamily._()
    : super(
        retry: null,
        name: r'deleteVehicleProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for deleting [vehicle] from the user file system.
  ///
  /// Override the file name with [overrideName].

  DeleteVehicleProvider call(Vehicle vehicle, {String? overrideName}) =>
      DeleteVehicleProvider._(
        argument: (vehicle, overrideName: overrideName),
        from: this,
      );

  @override
  String toString() => r'deleteVehicleProvider';
}

/// A provider for loading a [Vehicle] from a file at [path], if it's valid.

@ProviderFor(loadVehicleFromFile)
final loadVehicleFromFileProvider = LoadVehicleFromFileFamily._();

/// A provider for loading a [Vehicle] from a file at [path], if it's valid.

final class LoadVehicleFromFileProvider
    extends
        $FunctionalProvider<AsyncValue<Vehicle?>, Vehicle?, FutureOr<Vehicle?>>
    with $FutureModifier<Vehicle?>, $FutureProvider<Vehicle?> {
  /// A provider for loading a [Vehicle] from a file at [path], if it's valid.
  LoadVehicleFromFileProvider._({
    required LoadVehicleFromFileFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadVehicleFromFileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadVehicleFromFileHash();

  @override
  String toString() {
    return r'loadVehicleFromFileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Vehicle?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Vehicle?> create(Ref ref) {
    final argument = this.argument as String;
    return loadVehicleFromFile(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadVehicleFromFileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadVehicleFromFileHash() =>
    r'20bcb6de25d3e30735cfbe17ca11ef60943b2105';

/// A provider for loading a [Vehicle] from a file at [path], if it's valid.

final class LoadVehicleFromFileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Vehicle?>, String> {
  LoadVehicleFromFileFamily._()
    : super(
        retry: null,
        name: r'loadVehicleFromFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for loading a [Vehicle] from a file at [path], if it's valid.

  LoadVehicleFromFileProvider call(String path) =>
      LoadVehicleFromFileProvider._(argument: path, from: this);

  @override
  String toString() => r'loadVehicleFromFileProvider';
}

/// A provider for the most recently used [Vehicle].
///
/// The vehicle is found by sorting the saved vehicles by their last used
/// property.

@ProviderFor(lastUsedVehicle)
final lastUsedVehicleProvider = LastUsedVehicleProvider._();

/// A provider for the most recently used [Vehicle].
///
/// The vehicle is found by sorting the saved vehicles by their last used
/// property.

final class LastUsedVehicleProvider
    extends
        $FunctionalProvider<
          AsyncValue<Vehicle>,
          AsyncValue<Vehicle>,
          AsyncValue<Vehicle>
        >
    with $Provider<AsyncValue<Vehicle>> {
  /// A provider for the most recently used [Vehicle].
  ///
  /// The vehicle is found by sorting the saved vehicles by their last used
  /// property.
  LastUsedVehicleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lastUsedVehicleProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lastUsedVehicleHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<Vehicle>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<Vehicle> create(Ref ref) {
    return lastUsedVehicle(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Vehicle> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Vehicle>>(value),
    );
  }
}

String _$lastUsedVehicleHash() => r'286f2c8f04bb4d0b06c044bd219d21348cd4e3ca';

/// A provider for the target steering angle when using guidance.

@ProviderFor(VehicleSteeringAngleTarget)
final vehicleSteeringAngleTargetProvider =
    VehicleSteeringAngleTargetProvider._();

/// A provider for the target steering angle when using guidance.
final class VehicleSteeringAngleTargetProvider
    extends $NotifierProvider<VehicleSteeringAngleTarget, double?> {
  /// A provider for the target steering angle when using guidance.
  VehicleSteeringAngleTargetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vehicleSteeringAngleTargetProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vehicleSteeringAngleTargetHash();

  @$internal
  @override
  VehicleSteeringAngleTarget create() => VehicleSteeringAngleTarget();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$vehicleSteeringAngleTargetHash() =>
    r'a347c0e38a1f5a0300bb32f6872853c2aa6b99b8';

/// A provider for the target steering angle when using guidance.

abstract class _$VehicleSteeringAngleTarget extends $Notifier<double?> {
  double? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double?, double?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double?, double?>,
              double?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for importing a vehicle configuration from a file and applying it
/// to the [ConfiguredVehicle] provider.

@ProviderFor(importVehicle)
final importVehicleProvider = ImportVehicleProvider._();

/// A provider for importing a vehicle configuration from a file and applying it
/// to the [ConfiguredVehicle] provider.

final class ImportVehicleProvider
    extends
        $FunctionalProvider<AsyncValue<Vehicle?>, Vehicle?, FutureOr<Vehicle?>>
    with $FutureModifier<Vehicle?>, $FutureProvider<Vehicle?> {
  /// A provider for importing a vehicle configuration from a file and applying it
  /// to the [ConfiguredVehicle] provider.
  ImportVehicleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'importVehicleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$importVehicleHash();

  @$internal
  @override
  $FutureProviderElement<Vehicle?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Vehicle?> create(Ref ref) {
    return importVehicle(ref);
  }
}

String _$importVehicleHash() => r'f6d4702b0e38ba1fd6e9a490aa2cad82bd8747cf';

/// A provider for whether widgets for overriding the steering should be shown.

@ProviderFor(ShowOverrideSteering)
final showOverrideSteeringProvider = ShowOverrideSteeringProvider._();

/// A provider for whether widgets for overriding the steering should be shown.
final class ShowOverrideSteeringProvider
    extends $NotifierProvider<ShowOverrideSteering, bool> {
  /// A provider for whether widgets for overriding the steering should be shown.
  ShowOverrideSteeringProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showOverrideSteeringProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showOverrideSteeringHash();

  @$internal
  @override
  ShowOverrideSteering create() => ShowOverrideSteering();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showOverrideSteeringHash() =>
    r'ac8c0487d367a157a3f04c3a9f5fbb7d63ad9d66';

/// A provider for whether widgets for overriding the steering should be shown.

abstract class _$ShowOverrideSteering extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Whether the steering should be overridden. Usually used to test the
/// steering motor and WAS together.

@ProviderFor(OverrideSteering)
final overrideSteeringProvider = OverrideSteeringProvider._();

/// Whether the steering should be overridden. Usually used to test the
/// steering motor and WAS together.
final class OverrideSteeringProvider
    extends $NotifierProvider<OverrideSteering, bool> {
  /// Whether the steering should be overridden. Usually used to test the
  /// steering motor and WAS together.
  OverrideSteeringProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'overrideSteeringProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$overrideSteeringHash();

  @$internal
  @override
  OverrideSteering create() => OverrideSteering();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$overrideSteeringHash() => r'967f33baa1640de4ae8e216de5993c018db80eb2';

/// Whether the steering should be overridden. Usually used to test the
/// steering motor and WAS together.

abstract class _$OverrideSteering extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the steering angle to override with.

@ProviderFor(OverrideSteeringAngle)
final overrideSteeringAngleProvider = OverrideSteeringAngleProvider._();

/// A provider for the steering angle to override with.
final class OverrideSteeringAngleProvider
    extends $NotifierProvider<OverrideSteeringAngle, double> {
  /// A provider for the steering angle to override with.
  OverrideSteeringAngleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'overrideSteeringAngleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$overrideSteeringAngleHash();

  @$internal
  @override
  OverrideSteeringAngle create() => OverrideSteeringAngle();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$overrideSteeringAngleHash() =>
    r'1b900da2b35f4f4a099e4ffd84786acd7ab8ed5b';

/// A provider for the steering angle to override with.

abstract class _$OverrideSteeringAngle extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for exporting all vehicle files.

@ProviderFor(exportVehicles)
final exportVehiclesProvider = ExportVehiclesFamily._();

/// A provider for exporting all vehicle files.

final class ExportVehiclesProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting all vehicle files.
  ExportVehiclesProvider._({
    required ExportVehiclesFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'exportVehiclesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportVehiclesHash();

  @override
  String toString() {
    return r'exportVehiclesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as bool;
    return exportVehicles(ref, zip: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ExportVehiclesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportVehiclesHash() => r'1791fa257813e56b8d158ef9b2323726810d183f';

/// A provider for exporting all vehicle files.

final class ExportVehiclesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, bool> {
  ExportVehiclesFamily._()
    : super(
        retry: null,
        name: r'exportVehiclesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for exporting all vehicle files.

  ExportVehiclesProvider call({bool zip = true}) =>
      ExportVehiclesProvider._(argument: zip, from: this);

  @override
  String toString() => r'exportVehiclesProvider';
}
