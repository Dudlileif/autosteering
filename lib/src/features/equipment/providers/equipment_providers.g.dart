// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for how the [SectionEdgePositions] should be recorded, as the
/// fraction parameter that goes in [Equipment.sectionEdgePositions].

@ProviderFor(EquipmentRecordPositionFraction)
final equipmentRecordPositionFractionProvider =
    EquipmentRecordPositionFractionProvider._();

/// A provider for how the [SectionEdgePositions] should be recorded, as the
/// fraction parameter that goes in [Equipment.sectionEdgePositions].
final class EquipmentRecordPositionFractionProvider
    extends $NotifierProvider<EquipmentRecordPositionFraction, double?> {
  /// A provider for how the [SectionEdgePositions] should be recorded, as the
  /// fraction parameter that goes in [Equipment.sectionEdgePositions].
  EquipmentRecordPositionFractionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'equipmentRecordPositionFractionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$equipmentRecordPositionFractionHash();

  @$internal
  @override
  EquipmentRecordPositionFraction create() => EquipmentRecordPositionFraction();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$equipmentRecordPositionFractionHash() =>
    r'2ab56c11b65629fd5821b943bd890e8027858706';

/// A provider for how the [SectionEdgePositions] should be recorded, as the
/// fraction parameter that goes in [Equipment.sectionEdgePositions].

abstract class _$EquipmentRecordPositionFraction extends $Notifier<double?> {
  double? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<double?, double?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double?, double?>,
              double?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the currently loaded equipment.

@ProviderFor(LoadedEquipment)
final loadedEquipmentProvider = LoadedEquipmentProvider._();

/// A provider for the currently loaded equipment.
final class LoadedEquipmentProvider
    extends $NotifierProvider<LoadedEquipment, Equipment?> {
  /// A provider for the currently loaded equipment.
  LoadedEquipmentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loadedEquipmentProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loadedEquipmentHash();

  @$internal
  @override
  LoadedEquipment create() => LoadedEquipment();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Equipment? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Equipment?>(value),
    );
  }
}

String _$loadedEquipmentHash() => r'ab5df27cb509589b4b9c2a0836d6b50a8cde3c6f';

/// A provider for the currently loaded equipment.

abstract class _$LoadedEquipment extends $Notifier<Equipment?> {
  Equipment? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Equipment?, Equipment?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Equipment?, Equipment?>,
              Equipment?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider that holds all of the equipments.

@ProviderFor(AllEquipments)
final allEquipmentsProvider = AllEquipmentsProvider._();

/// A provider that holds all of the equipments.
final class AllEquipmentsProvider
    extends $NotifierProvider<AllEquipments, Map<int, Equipment>> {
  /// A provider that holds all of the equipments.
  AllEquipmentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allEquipmentsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allEquipmentsHash();

  @$internal
  @override
  AllEquipments create() => AllEquipments();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, Equipment> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, Equipment>>(value),
    );
  }
}

String _$allEquipmentsHash() => r'9495e8427fadc2a57c9dabd3e39d2861fc19ae17';

/// A provider that holds all of the equipments.

abstract class _$AllEquipments extends $Notifier<Map<int, Equipment>> {
  Map<int, Equipment> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Map<int, Equipment>, Map<int, Equipment>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<int, Equipment>, Map<int, Equipment>>,
              Map<int, Equipment>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for keeping the worked area for each equipment.

@ProviderFor(EquipmentWorkedArea)
final equipmentWorkedAreaProvider = EquipmentWorkedAreaProvider._();

/// A provider for keeping the worked area for each equipment.
final class EquipmentWorkedAreaProvider
    extends $NotifierProvider<EquipmentWorkedArea, Map<int, double>> {
  /// A provider for keeping the worked area for each equipment.
  EquipmentWorkedAreaProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'equipmentWorkedAreaProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$equipmentWorkedAreaHash();

  @$internal
  @override
  EquipmentWorkedArea create() => EquipmentWorkedArea();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, double> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, double>>(value),
    );
  }
}

String _$equipmentWorkedAreaHash() =>
    r'8a622d58876d6f1910ddcaffb72e6d608f700587';

/// A provider for keeping the worked area for each equipment.

abstract class _$EquipmentWorkedArea extends $Notifier<Map<int, double>> {
  Map<int, double> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Map<int, double>, Map<int, double>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<int, double>, Map<int, double>>,
              Map<int, double>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for tracking the worked paths for the given equipment [id].

@ProviderFor(EquipmentPaths)
final equipmentPathsProvider = EquipmentPathsFamily._();

/// A provider for tracking the worked paths for the given equipment [id].
final class EquipmentPathsProvider
    extends
        $NotifierProvider<
          EquipmentPaths,
          List<Map<int, List<SectionEdgePositions>?>>
        > {
  /// A provider for tracking the worked paths for the given equipment [id].
  EquipmentPathsProvider._({
    required EquipmentPathsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'equipmentPathsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$equipmentPathsHash();

  @override
  String toString() {
    return r'equipmentPathsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EquipmentPaths create() => EquipmentPaths();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    List<Map<int, List<SectionEdgePositions>?>> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<List<Map<int, List<SectionEdgePositions>?>>>(
            value,
          ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EquipmentPathsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$equipmentPathsHash() => r'd5713d15ee4125a761b4765d20114b1fe032da66';

/// A provider for tracking the worked paths for the given equipment [id].

final class EquipmentPathsFamily extends $Family
    with
        $ClassFamilyOverride<
          EquipmentPaths,
          List<Map<int, List<SectionEdgePositions>?>>,
          List<Map<int, List<SectionEdgePositions>?>>,
          List<Map<int, List<SectionEdgePositions>?>>,
          int
        > {
  EquipmentPathsFamily._()
    : super(
        retry: null,
        name: r'equipmentPathsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// A provider for tracking the worked paths for the given equipment [id].

  EquipmentPathsProvider call(int id) =>
      EquipmentPathsProvider._(argument: id, from: this);

  @override
  String toString() => r'equipmentPathsProvider';
}

/// A provider for tracking the worked paths for the given equipment [id].

abstract class _$EquipmentPaths
    extends $Notifier<List<Map<int, List<SectionEdgePositions>?>>> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  List<Map<int, List<SectionEdgePositions>?>> build(int id);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              List<Map<int, List<SectionEdgePositions>?>>,
              List<Map<int, List<SectionEdgePositions>?>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                List<Map<int, List<SectionEdgePositions>?>>,
                List<Map<int, List<SectionEdgePositions>?>>
              >,
              List<Map<int, List<SectionEdgePositions>?>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

/// A provider for the map screen points for the worked paths for the given
/// [Equipment.uuid].

@ProviderFor(EquipmentMapPaths)
final equipmentMapPathsProvider = EquipmentMapPathsFamily._();

/// A provider for the map screen points for the worked paths for the given
/// [Equipment.uuid].
final class EquipmentMapPathsProvider
    extends
        $NotifierProvider<
          EquipmentMapPaths,
          ({
            Offset origin,
            Map<int, SectionEdgePositions?>? prevActivePosition,
            Map<int, Float32List> sections,
          })
        > {
  /// A provider for the map screen points for the worked paths for the given
  /// [Equipment.uuid].
  EquipmentMapPathsProvider._({
    required EquipmentMapPathsFamily super.from,
    required (int, {bool forMiniMap}) super.argument,
  }) : super(
         retry: null,
         name: r'equipmentMapPathsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$equipmentMapPathsHash();

  @override
  String toString() {
    return r'equipmentMapPathsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  EquipmentMapPaths create() => EquipmentMapPaths();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    ({
      Offset origin,
      Map<int, SectionEdgePositions?>? prevActivePosition,
      Map<int, Float32List> sections,
    })
    value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            ({
              Offset origin,
              Map<int, SectionEdgePositions?>? prevActivePosition,
              Map<int, Float32List> sections,
            })
          >(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EquipmentMapPathsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$equipmentMapPathsHash() => r'22b3039e8c658577f9b66df358c4627ba70676b6';

/// A provider for the map screen points for the worked paths for the given
/// [Equipment.uuid].

final class EquipmentMapPathsFamily extends $Family
    with
        $ClassFamilyOverride<
          EquipmentMapPaths,
          ({
            Offset origin,
            Map<int, SectionEdgePositions?>? prevActivePosition,
            Map<int, Float32List> sections,
          }),
          ({
            Offset origin,
            Map<int, SectionEdgePositions?>? prevActivePosition,
            Map<int, Float32List> sections,
          }),
          ({
            Offset origin,
            Map<int, SectionEdgePositions?>? prevActivePosition,
            Map<int, Float32List> sections,
          }),
          (int, {bool forMiniMap})
        > {
  EquipmentMapPathsFamily._()
    : super(
        retry: null,
        name: r'equipmentMapPathsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for the map screen points for the worked paths for the given
  /// [Equipment.uuid].

  EquipmentMapPathsProvider call(int id, {bool forMiniMap = false}) =>
      EquipmentMapPathsProvider._(
        argument: (id, forMiniMap: forMiniMap),
        from: this,
      );

  @override
  String toString() => r'equipmentMapPathsProvider';
}

/// A provider for the map screen points for the worked paths for the given
/// [Equipment.uuid].

abstract class _$EquipmentMapPaths
    extends
        $Notifier<
          ({
            Offset origin,
            Map<int, SectionEdgePositions?>? prevActivePosition,
            Map<int, Float32List> sections,
          })
        > {
  late final _$args = ref.$arg as (int, {bool forMiniMap});
  int get id => _$args.$1;
  bool get forMiniMap => _$args.forMiniMap;

  ({
    Offset origin,
    Map<int, SectionEdgePositions?>? prevActivePosition,
    Map<int, Float32List> sections,
  })
  build(int id, {bool forMiniMap = false});
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              ({
                Offset origin,
                Map<int, SectionEdgePositions?>? prevActivePosition,
                Map<int, Float32List> sections,
              }),
              ({
                Offset origin,
                Map<int, SectionEdgePositions?>? prevActivePosition,
                Map<int, Float32List> sections,
              })
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ({
                  Offset origin,
                  Map<int, SectionEdgePositions?>? prevActivePosition,
                  Map<int, Float32List> sections,
                }),
                ({
                  Offset origin,
                  Map<int, SectionEdgePositions?>? prevActivePosition,
                  Map<int, Float32List> sections,
                })
              >,
              ({
                Offset origin,
                Map<int, SectionEdgePositions?>? prevActivePosition,
                Map<int, Float32List> sections,
              }),
              Object?,
              Object?
            >;
    return element.handleCreate(
      ref,
      () => build(_$args.$1, forMiniMap: _$args.forMiniMap),
    );
  }
}

/// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
/// given id.

@ProviderFor(EquipmentLogRecords)
final equipmentLogRecordsProvider = EquipmentLogRecordsFamily._();

/// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
/// given id.
final class EquipmentLogRecordsProvider
    extends $NotifierProvider<EquipmentLogRecords, List<EquipmentLogRecord>?> {
  /// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
  /// given id.
  EquipmentLogRecordsProvider._({
    required EquipmentLogRecordsFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'equipmentLogRecordsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$equipmentLogRecordsHash();

  @override
  String toString() {
    return r'equipmentLogRecordsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EquipmentLogRecords create() => EquipmentLogRecords();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<EquipmentLogRecord>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<EquipmentLogRecord>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EquipmentLogRecordsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$equipmentLogRecordsHash() =>
    r'd3a0d5efd9375bb772347dbf0582343970b09b6b';

/// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
/// given id.

final class EquipmentLogRecordsFamily extends $Family
    with
        $ClassFamilyOverride<
          EquipmentLogRecords,
          List<EquipmentLogRecord>?,
          List<EquipmentLogRecord>?,
          List<EquipmentLogRecord>?,
          int
        > {
  EquipmentLogRecordsFamily._()
    : super(
        retry: null,
        name: r'equipmentLogRecordsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
  /// given id.

  EquipmentLogRecordsProvider call(int id) =>
      EquipmentLogRecordsProvider._(argument: id, from: this);

  @override
  String toString() => r'equipmentLogRecordsProvider';
}

/// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
/// given id.

abstract class _$EquipmentLogRecords
    extends $Notifier<List<EquipmentLogRecord>?> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  List<EquipmentLogRecord>? build(int id);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<List<EquipmentLogRecord>?, List<EquipmentLogRecord>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<EquipmentLogRecord>?, List<EquipmentLogRecord>?>,
              List<EquipmentLogRecord>?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

/// A provider for loading an [Equipment] from a file at [path], if it's valid.

@ProviderFor(loadEquipmentFromFile)
final loadEquipmentFromFileProvider = LoadEquipmentFromFileFamily._();

/// A provider for loading an [Equipment] from a file at [path], if it's valid.

final class LoadEquipmentFromFileProvider
    extends
        $FunctionalProvider<
          AsyncValue<Equipment?>,
          Equipment?,
          FutureOr<Equipment?>
        >
    with $FutureModifier<Equipment?>, $FutureProvider<Equipment?> {
  /// A provider for loading an [Equipment] from a file at [path], if it's valid.
  LoadEquipmentFromFileProvider._({
    required LoadEquipmentFromFileFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadEquipmentFromFileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadEquipmentFromFileHash();

  @override
  String toString() {
    return r'loadEquipmentFromFileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Equipment?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Equipment?> create(Ref ref) {
    final argument = this.argument as String;
    return loadEquipmentFromFile(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadEquipmentFromFileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadEquipmentFromFileHash() =>
    r'422adf1b1af74bab6f42d15b35e1f2f3b629ae24';

/// A provider for loading an [Equipment] from a file at [path], if it's valid.

final class LoadEquipmentFromFileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Equipment?>, String> {
  LoadEquipmentFromFileFamily._()
    : super(
        retry: null,
        name: r'loadEquipmentFromFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for loading an [Equipment] from a file at [path], if it's valid.

  LoadEquipmentFromFileProvider call(String path) =>
      LoadEquipmentFromFileProvider._(argument: path, from: this);

  @override
  String toString() => r'loadEquipmentFromFileProvider';
}

/// A provider for saving [equipment] to a file in the user file directory.
///
/// Override the file name with [overrideName].

@ProviderFor(saveEquipment)
final saveEquipmentProvider = SaveEquipmentFamily._();

/// A provider for saving [equipment] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SaveEquipmentProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for saving [equipment] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  SaveEquipmentProvider._({
    required SaveEquipmentFamily super.from,
    required (Equipment, {String? overrideName, bool downloadIfWeb})
    super.argument,
  }) : super(
         retry: null,
         name: r'saveEquipmentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$saveEquipmentHash();

  @override
  String toString() {
    return r'saveEquipmentProvider'
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
        this.argument
            as (Equipment, {String? overrideName, bool downloadIfWeb});
    return saveEquipment(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveEquipmentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$saveEquipmentHash() => r'fb3ace3b464775329ba09cac30bf895097a2c639';

/// A provider for saving [equipment] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SaveEquipmentFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (Equipment, {String? overrideName, bool downloadIfWeb})
        > {
  SaveEquipmentFamily._()
    : super(
        retry: null,
        name: r'saveEquipmentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for saving [equipment] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].

  SaveEquipmentProvider call(
    Equipment equipment, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) => SaveEquipmentProvider._(
    argument: (
      equipment,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    ),
    from: this,
  );

  @override
  String toString() => r'saveEquipmentProvider';
}

/// A provider for exporting [equipment] to a file.
///
/// Override the file name with [overrideName].

@ProviderFor(exportEquipment)
final exportEquipmentProvider = ExportEquipmentFamily._();

/// A provider for exporting [equipment] to a file.
///
/// Override the file name with [overrideName].

final class ExportEquipmentProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting [equipment] to a file.
  ///
  /// Override the file name with [overrideName].
  ExportEquipmentProvider._({
    required ExportEquipmentFamily super.from,
    required (
      Equipment, {
      String dialogTitle,
      String? overrideName,
      bool downloadIfWeb,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'exportEquipmentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportEquipmentHash();

  @override
  String toString() {
    return r'exportEquipmentProvider'
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
        this.argument
            as (
              Equipment, {
              String dialogTitle,
              String? overrideName,
              bool downloadIfWeb,
            });
    return exportEquipment(
      ref,
      argument.$1,
      dialogTitle: argument.dialogTitle,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportEquipmentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportEquipmentHash() => r'08e15b52b8ce3e50b37a3cd5e70d118ac4e2158b';

/// A provider for exporting [equipment] to a file.
///
/// Override the file name with [overrideName].

final class ExportEquipmentFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (
            Equipment, {
            String dialogTitle,
            String? overrideName,
            bool downloadIfWeb,
          })
        > {
  ExportEquipmentFamily._()
    : super(
        retry: null,
        name: r'exportEquipmentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for exporting [equipment] to a file.
  ///
  /// Override the file name with [overrideName].

  ExportEquipmentProvider call(
    Equipment equipment, {
    required String dialogTitle,
    String? overrideName,
    bool downloadIfWeb = true,
  }) => ExportEquipmentProvider._(
    argument: (
      equipment,
      dialogTitle: dialogTitle,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    ),
    from: this,
  );

  @override
  String toString() => r'exportEquipmentProvider';
}

/// A provider for reading and holding all the saved [Equipment] in the
/// user file directory.

@ProviderFor(savedEquipments)
final savedEquipmentsProvider = SavedEquipmentsProvider._();

/// A provider for reading and holding all the saved [Equipment] in the
/// user file directory.

final class SavedEquipmentsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Equipment>>,
          List<Equipment>,
          FutureOr<List<Equipment>>
        >
    with $FutureModifier<List<Equipment>>, $FutureProvider<List<Equipment>> {
  /// A provider for reading and holding all the saved [Equipment] in the
  /// user file directory.
  SavedEquipmentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedEquipmentsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedEquipmentsHash();

  @$internal
  @override
  $FutureProviderElement<List<Equipment>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Equipment>> create(Ref ref) {
    return savedEquipments(ref);
  }
}

String _$savedEquipmentsHash() => r'4e17b9ddd42c14e3065250ab9db079194f62302f';

/// A provider for deleting [equipment] from the user file system.
///
/// Override the file name with [overrideName].

@ProviderFor(deleteEquipment)
final deleteEquipmentProvider = DeleteEquipmentFamily._();

/// A provider for deleting [equipment] from the user file system.
///
/// Override the file name with [overrideName].

final class DeleteEquipmentProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for deleting [equipment] from the user file system.
  ///
  /// Override the file name with [overrideName].
  DeleteEquipmentProvider._({
    required DeleteEquipmentFamily super.from,
    required (Equipment, {String? overrideName}) super.argument,
  }) : super(
         retry: null,
         name: r'deleteEquipmentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteEquipmentHash();

  @override
  String toString() {
    return r'deleteEquipmentProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (Equipment, {String? overrideName});
    return deleteEquipment(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteEquipmentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteEquipmentHash() => r'69e4d4ea028c34229a32cd131388cd9432e3e99e';

/// A provider for deleting [equipment] from the user file system.
///
/// Override the file name with [overrideName].

final class DeleteEquipmentFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (Equipment, {String? overrideName})
        > {
  DeleteEquipmentFamily._()
    : super(
        retry: null,
        name: r'deleteEquipmentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for deleting [equipment] from the user file system.
  ///
  /// Override the file name with [overrideName].

  DeleteEquipmentProvider call(Equipment equipment, {String? overrideName}) =>
      DeleteEquipmentProvider._(
        argument: (equipment, overrideName: overrideName),
        from: this,
      );

  @override
  String toString() => r'deleteEquipmentProvider';
}

/// A provider for importing a equipment configuration from a file and applying
/// it to the [ConfiguredEquipment] provider.

@ProviderFor(importEquipment)
final importEquipmentProvider = ImportEquipmentFamily._();

/// A provider for importing a equipment configuration from a file and applying
/// it to the [ConfiguredEquipment] provider.

final class ImportEquipmentProvider
    extends
        $FunctionalProvider<
          AsyncValue<Equipment?>,
          Equipment?,
          FutureOr<Equipment?>
        >
    with $FutureModifier<Equipment?>, $FutureProvider<Equipment?> {
  /// A provider for importing a equipment configuration from a file and applying
  /// it to the [ConfiguredEquipment] provider.
  ImportEquipmentProvider._({
    required ImportEquipmentFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'importEquipmentProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$importEquipmentHash();

  @override
  String toString() {
    return r'importEquipmentProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Equipment?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Equipment?> create(Ref ref) {
    final argument = this.argument as String;
    return importEquipment(ref, dialogTitle: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ImportEquipmentProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$importEquipmentHash() => r'ec1b325e5b97f87135b06846527c4c3a904eacd8';

/// A provider for importing a equipment configuration from a file and applying
/// it to the [ConfiguredEquipment] provider.

final class ImportEquipmentFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Equipment?>, String> {
  ImportEquipmentFamily._()
    : super(
        retry: null,
        name: r'importEquipmentProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for importing a equipment configuration from a file and applying
  /// it to the [ConfiguredEquipment] provider.

  ImportEquipmentProvider call({required String dialogTitle}) =>
      ImportEquipmentProvider._(argument: dialogTitle, from: this);

  @override
  String toString() => r'importEquipmentProvider';
}

/// A provider for exporting all equipment files.

@ProviderFor(exportEquipments)
final exportEquipmentsProvider = ExportEquipmentsFamily._();

/// A provider for exporting all equipment files.

final class ExportEquipmentsProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting all equipment files.
  ExportEquipmentsProvider._({
    required ExportEquipmentsFamily super.from,
    required ({String dialogTitle, bool zip}) super.argument,
  }) : super(
         retry: null,
         name: r'exportEquipmentsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportEquipmentsHash();

  @override
  String toString() {
    return r'exportEquipmentsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as ({String dialogTitle, bool zip});
    return exportEquipments(
      ref,
      dialogTitle: argument.dialogTitle,
      zip: argument.zip,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportEquipmentsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportEquipmentsHash() => r'2a19ab5ffa518054a3e7d2ad1e967342ad18a9f2';

/// A provider for exporting all equipment files.

final class ExportEquipmentsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({String dialogTitle, bool zip})
        > {
  ExportEquipmentsFamily._()
    : super(
        retry: null,
        name: r'exportEquipmentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for exporting all equipment files.

  ExportEquipmentsProvider call({
    required String dialogTitle,
    bool zip = true,
  }) => ExportEquipmentsProvider._(
    argument: (dialogTitle: dialogTitle, zip: zip),
    from: this,
  );

  @override
  String toString() => r'exportEquipmentsProvider';
}
