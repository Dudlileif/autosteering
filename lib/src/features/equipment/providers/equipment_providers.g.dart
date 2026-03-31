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
  void runBuild() {
    final ref = this.ref as $Ref<Equipment?, Equipment?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Equipment?, Equipment?>,
              Equipment?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider that holds all of the equipments.

@ProviderFor(AllEquipments)
final allEquipmentsProvider = AllEquipmentsProvider._();

/// A provider that holds all of the equipments.
final class AllEquipmentsProvider
    extends $NotifierProvider<AllEquipments, Map<String, Equipment>> {
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
  Override overrideWithValue(Map<String, Equipment> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, Equipment>>(value),
    );
  }
}

String _$allEquipmentsHash() => r'ed6e2354d60f1b17f19d0cea1df6909f78cbcecc';

/// A provider that holds all of the equipments.

abstract class _$AllEquipments extends $Notifier<Map<String, Equipment>> {
  Map<String, Equipment> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<Map<String, Equipment>, Map<String, Equipment>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, Equipment>, Map<String, Equipment>>,
              Map<String, Equipment>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for keeping the worked area for each equipment.

@ProviderFor(EquipmentWorkedArea)
final equipmentWorkedAreaProvider = EquipmentWorkedAreaProvider._();

/// A provider for keeping the worked area for each equipment.
final class EquipmentWorkedAreaProvider
    extends $NotifierProvider<EquipmentWorkedArea, Map<String, double>> {
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
  Override overrideWithValue(Map<String, double> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, double>>(value),
    );
  }
}

String _$equipmentWorkedAreaHash() =>
    r'64fa5bf5976884164bb0c37ed91afc0be24c9ebe';

/// A provider for keeping the worked area for each equipment.

abstract class _$EquipmentWorkedArea extends $Notifier<Map<String, double>> {
  Map<String, double> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Map<String, double>, Map<String, double>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, double>, Map<String, double>>,
              Map<String, double>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for tracking the worked paths for the given equipment [uuid].

@ProviderFor(EquipmentPaths)
final equipmentPathsProvider = EquipmentPathsFamily._();

/// A provider for tracking the worked paths for the given equipment [uuid].
final class EquipmentPathsProvider
    extends
        $NotifierProvider<
          EquipmentPaths,
          List<Map<int, List<SectionEdgePositions>?>>
        > {
  /// A provider for tracking the worked paths for the given equipment [uuid].
  EquipmentPathsProvider._({
    required EquipmentPathsFamily super.from,
    required String super.argument,
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

String _$equipmentPathsHash() => r'90ead51c13db46747569a5a1a09860a41943a8ff';

/// A provider for tracking the worked paths for the given equipment [uuid].

final class EquipmentPathsFamily extends $Family
    with
        $ClassFamilyOverride<
          EquipmentPaths,
          List<Map<int, List<SectionEdgePositions>?>>,
          List<Map<int, List<SectionEdgePositions>?>>,
          List<Map<int, List<SectionEdgePositions>?>>,
          String
        > {
  EquipmentPathsFamily._()
    : super(
        retry: null,
        name: r'equipmentPathsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// A provider for tracking the worked paths for the given equipment [uuid].

  EquipmentPathsProvider call(String uuid) =>
      EquipmentPathsProvider._(argument: uuid, from: this);

  @override
  String toString() => r'equipmentPathsProvider';
}

/// A provider for tracking the worked paths for the given equipment [uuid].

abstract class _$EquipmentPaths
    extends $Notifier<List<Map<int, List<SectionEdgePositions>?>>> {
  late final _$args = ref.$arg as String;
  String get uuid => _$args;

  List<Map<int, List<SectionEdgePositions>?>> build(String uuid);
  @$mustCallSuper
  @override
  void runBuild() {
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
    element.handleCreate(ref, () => build(_$args));
  }
}

/// A provider for the map screen points for the worked paths for the given
/// equipment [uuid].

@ProviderFor(EquipmentMapPaths)
final equipmentMapPathsProvider = EquipmentMapPathsFamily._();

/// A provider for the map screen points for the worked paths for the given
/// equipment [uuid].
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
  /// equipment [uuid].
  EquipmentMapPathsProvider._({
    required EquipmentMapPathsFamily super.from,
    required (String, {bool forMiniMap}) super.argument,
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

String _$equipmentMapPathsHash() => r'8d6dd82eb37e04678cb45dd68ef61a6904e7911b';

/// A provider for the map screen points for the worked paths for the given
/// equipment [uuid].

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
          (String, {bool forMiniMap})
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
  /// equipment [uuid].

  EquipmentMapPathsProvider call(String uuid, {bool forMiniMap = false}) =>
      EquipmentMapPathsProvider._(
        argument: (uuid, forMiniMap: forMiniMap),
        from: this,
      );

  @override
  String toString() => r'equipmentMapPathsProvider';
}

/// A provider for the map screen points for the worked paths for the given
/// equipment [uuid].

abstract class _$EquipmentMapPaths
    extends
        $Notifier<
          ({
            Offset origin,
            Map<int, SectionEdgePositions?>? prevActivePosition,
            Map<int, Float32List> sections,
          })
        > {
  late final _$args = ref.$arg as (String, {bool forMiniMap});
  String get uuid => _$args.$1;
  bool get forMiniMap => _$args.forMiniMap;

  ({
    Offset origin,
    Map<int, SectionEdgePositions?>? prevActivePosition,
    Map<int, Float32List> sections,
  })
  build(String uuid, {bool forMiniMap = false});
  @$mustCallSuper
  @override
  void runBuild() {
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
    element.handleCreate(
      ref,
      () => build(_$args.$1, forMiniMap: _$args.forMiniMap),
    );
  }
}

/// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
/// given UUID.

@ProviderFor(EquipmentLogRecords)
final equipmentLogRecordsProvider = EquipmentLogRecordsFamily._();

/// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
/// given UUID.
final class EquipmentLogRecordsProvider
    extends $NotifierProvider<EquipmentLogRecords, List<EquipmentLogRecord>?> {
  /// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
  /// given UUID.
  EquipmentLogRecordsProvider._({
    required EquipmentLogRecordsFamily super.from,
    required String super.argument,
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
    r'954a54514a9d2823524998e293fcdcd2d8b91ac6';

/// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
/// given UUID.

final class EquipmentLogRecordsFamily extends $Family
    with
        $ClassFamilyOverride<
          EquipmentLogRecords,
          List<EquipmentLogRecord>?,
          List<EquipmentLogRecord>?,
          List<EquipmentLogRecord>?,
          String
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
  /// given UUID.

  EquipmentLogRecordsProvider call(String uuid) =>
      EquipmentLogRecordsProvider._(argument: uuid, from: this);

  @override
  String toString() => r'equipmentLogRecordsProvider';
}

/// A provider for holding [EquipmentLogRecord] for the [Equipment] with the
/// given UUID.

abstract class _$EquipmentLogRecords
    extends $Notifier<List<EquipmentLogRecord>?> {
  late final _$args = ref.$arg as String;
  String get uuid => _$args;

  List<EquipmentLogRecord>? build(String uuid);
  @$mustCallSuper
  @override
  void runBuild() {
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
    element.handleCreate(ref, () => build(_$args));
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

String _$saveEquipmentHash() => r'd9224364098dbad4ab20bc9a5b3696e3a070c848';

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
    required (Equipment, {String? overrideName, bool downloadIfWeb})
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
            as (Equipment, {String? overrideName, bool downloadIfWeb});
    return exportEquipment(
      ref,
      argument.$1,
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

String _$exportEquipmentHash() => r'339c3a416629bd47b089892f76adf8c4fe1e4a3e';

/// A provider for exporting [equipment] to a file.
///
/// Override the file name with [overrideName].

final class ExportEquipmentFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (Equipment, {String? overrideName, bool downloadIfWeb})
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
    String? overrideName,
    bool downloadIfWeb = true,
  }) => ExportEquipmentProvider._(
    argument: (
      equipment,
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

String _$savedEquipmentsHash() => r'039b1985239b14fc15ba46f72abf90002a8f5d2b';

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

String _$deleteEquipmentHash() => r'cf2a25bbb6711e813fa5420a1b77140771dc9489';

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
final importEquipmentProvider = ImportEquipmentProvider._();

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
  ImportEquipmentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'importEquipmentProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$importEquipmentHash();

  @$internal
  @override
  $FutureProviderElement<Equipment?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Equipment?> create(Ref ref) {
    return importEquipment(ref);
  }
}

String _$importEquipmentHash() => r'23788a72e175496df6e300087a244ad146ac2e28';

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
    required bool super.argument,
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
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as bool;
    return exportEquipments(ref, zip: argument);
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

String _$exportEquipmentsHash() => r'b901191f3ac54bfe593d9dadec5e5c17d4c37977';

/// A provider for exporting all equipment files.

final class ExportEquipmentsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, bool> {
  ExportEquipmentsFamily._()
    : super(
        retry: null,
        name: r'exportEquipmentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for exporting all equipment files.

  ExportEquipmentsProvider call({bool zip = true}) =>
      ExportEquipmentsProvider._(argument: zip, from: this);

  @override
  String toString() => r'exportEquipmentsProvider';
}
