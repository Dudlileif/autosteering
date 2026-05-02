// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_setup_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider or holding the configured/loaded [EquipmentSetup] in memory.

@ProviderFor(ConfiguredEquipmentSetup)
final configuredEquipmentSetupProvider = ConfiguredEquipmentSetupProvider._();

/// A provider or holding the configured/loaded [EquipmentSetup] in memory.
final class ConfiguredEquipmentSetupProvider
    extends $NotifierProvider<ConfiguredEquipmentSetup, EquipmentSetup?> {
  /// A provider or holding the configured/loaded [EquipmentSetup] in memory.
  ConfiguredEquipmentSetupProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configuredEquipmentSetupProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configuredEquipmentSetupHash();

  @$internal
  @override
  ConfiguredEquipmentSetup create() => ConfiguredEquipmentSetup();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EquipmentSetup? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EquipmentSetup?>(value),
    );
  }
}

String _$configuredEquipmentSetupHash() =>
    r'b39fe174ad64a3c80c6fbf2fdecc6db9da6bbfea';

/// A provider or holding the configured/loaded [EquipmentSetup] in memory.

abstract class _$ConfiguredEquipmentSetup extends $Notifier<EquipmentSetup?> {
  EquipmentSetup? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<EquipmentSetup?, EquipmentSetup?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EquipmentSetup?, EquipmentSetup?>,
              EquipmentSetup?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for saving [setup] to a file in the user file directory.
///
/// Override the file name with [overrideName].

@ProviderFor(saveEquipmentSetup)
final saveEquipmentSetupProvider = SaveEquipmentSetupFamily._();

/// A provider for saving [setup] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SaveEquipmentSetupProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for saving [setup] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  SaveEquipmentSetupProvider._({
    required SaveEquipmentSetupFamily super.from,
    required (EquipmentSetup, {String? overrideName, bool downloadIfWeb})
    super.argument,
  }) : super(
         retry: null,
         name: r'saveEquipmentSetupProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$saveEquipmentSetupHash();

  @override
  String toString() {
    return r'saveEquipmentSetupProvider'
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
            as (EquipmentSetup, {String? overrideName, bool downloadIfWeb});
    return saveEquipmentSetup(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveEquipmentSetupProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$saveEquipmentSetupHash() =>
    r'd84a6da001ac7c469cf7fbae0dea619e6f55aeaf';

/// A provider for saving [setup] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SaveEquipmentSetupFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (EquipmentSetup, {String? overrideName, bool downloadIfWeb})
        > {
  SaveEquipmentSetupFamily._()
    : super(
        retry: null,
        name: r'saveEquipmentSetupProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// A provider for saving [setup] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].

  SaveEquipmentSetupProvider call(
    EquipmentSetup setup, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) => SaveEquipmentSetupProvider._(
    argument: (setup, overrideName: overrideName, downloadIfWeb: downloadIfWeb),
    from: this,
  );

  @override
  String toString() => r'saveEquipmentSetupProvider';
}

/// A provider for exporting [setup] to a file.
///
/// Override the file name with [overrideName].

@ProviderFor(exportEquipmentSetup)
final exportEquipmentSetupProvider = ExportEquipmentSetupFamily._();

/// A provider for exporting [setup] to a file.
///
/// Override the file name with [overrideName].

final class ExportEquipmentSetupProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting [setup] to a file.
  ///
  /// Override the file name with [overrideName].
  ExportEquipmentSetupProvider._({
    required ExportEquipmentSetupFamily super.from,
    required (EquipmentSetup, {String? overrideName, bool downloadIfWeb})
    super.argument,
  }) : super(
         retry: null,
         name: r'exportEquipmentSetupProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportEquipmentSetupHash();

  @override
  String toString() {
    return r'exportEquipmentSetupProvider'
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
            as (EquipmentSetup, {String? overrideName, bool downloadIfWeb});
    return exportEquipmentSetup(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportEquipmentSetupProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportEquipmentSetupHash() =>
    r'401caa4accd623a0db3cad6119649a4fb14ede92';

/// A provider for exporting [setup] to a file.
///
/// Override the file name with [overrideName].

final class ExportEquipmentSetupFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (EquipmentSetup, {String? overrideName, bool downloadIfWeb})
        > {
  ExportEquipmentSetupFamily._()
    : super(
        retry: null,
        name: r'exportEquipmentSetupProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for exporting [setup] to a file.
  ///
  /// Override the file name with [overrideName].

  ExportEquipmentSetupProvider call(
    EquipmentSetup setup, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) => ExportEquipmentSetupProvider._(
    argument: (setup, overrideName: overrideName, downloadIfWeb: downloadIfWeb),
    from: this,
  );

  @override
  String toString() => r'exportEquipmentSetupProvider';
}

/// A provider for reading and holding all the saved [EquipmentSetup]s in the
/// user file directory.

@ProviderFor(savedEquipmentSetups)
final savedEquipmentSetupsProvider = SavedEquipmentSetupsProvider._();

/// A provider for reading and holding all the saved [EquipmentSetup]s in the
/// user file directory.

final class SavedEquipmentSetupsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<EquipmentSetup>>,
          List<EquipmentSetup>,
          FutureOr<List<EquipmentSetup>>
        >
    with
        $FutureModifier<List<EquipmentSetup>>,
        $FutureProvider<List<EquipmentSetup>> {
  /// A provider for reading and holding all the saved [EquipmentSetup]s in the
  /// user file directory.
  SavedEquipmentSetupsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedEquipmentSetupsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedEquipmentSetupsHash();

  @$internal
  @override
  $FutureProviderElement<List<EquipmentSetup>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<EquipmentSetup>> create(Ref ref) {
    return savedEquipmentSetups(ref);
  }
}

String _$savedEquipmentSetupsHash() =>
    r'0d6e509cbec5d1f6b1e1bcfdc68053bb39a0fd5e';

/// A provider for deleting [setup] form the user file system.
///
/// Override the file name with [overrideName].

@ProviderFor(deleteEquipmentSetup)
final deleteEquipmentSetupProvider = DeleteEquipmentSetupFamily._();

/// A provider for deleting [setup] form the user file system.
///
/// Override the file name with [overrideName].

final class DeleteEquipmentSetupProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for deleting [setup] form the user file system.
  ///
  /// Override the file name with [overrideName].
  DeleteEquipmentSetupProvider._({
    required DeleteEquipmentSetupFamily super.from,
    required (EquipmentSetup, {String? overrideName, bool downloadIfWeb})
    super.argument,
  }) : super(
         retry: null,
         name: r'deleteEquipmentSetupProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteEquipmentSetupHash();

  @override
  String toString() {
    return r'deleteEquipmentSetupProvider'
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
            as (EquipmentSetup, {String? overrideName, bool downloadIfWeb});
    return deleteEquipmentSetup(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteEquipmentSetupProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteEquipmentSetupHash() =>
    r'02bf2c93100e497d02165324200e0d189ba1f67e';

/// A provider for deleting [setup] form the user file system.
///
/// Override the file name with [overrideName].

final class DeleteEquipmentSetupFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (EquipmentSetup, {String? overrideName, bool downloadIfWeb})
        > {
  DeleteEquipmentSetupFamily._()
    : super(
        retry: null,
        name: r'deleteEquipmentSetupProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for deleting [setup] form the user file system.
  ///
  /// Override the file name with [overrideName].

  DeleteEquipmentSetupProvider call(
    EquipmentSetup setup, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) => DeleteEquipmentSetupProvider._(
    argument: (setup, overrideName: overrideName, downloadIfWeb: downloadIfWeb),
    from: this,
  );

  @override
  String toString() => r'deleteEquipmentSetupProvider';
}

/// A provider for loading an [EquipmentSetup] from a file at [path], if it's
/// valid.

@ProviderFor(loadEquipmentSetupFromFile)
final loadEquipmentSetupFromFileProvider = LoadEquipmentSetupFromFileFamily._();

/// A provider for loading an [EquipmentSetup] from a file at [path], if it's
/// valid.

final class LoadEquipmentSetupFromFileProvider
    extends
        $FunctionalProvider<
          AsyncValue<EquipmentSetup?>,
          EquipmentSetup?,
          FutureOr<EquipmentSetup?>
        >
    with $FutureModifier<EquipmentSetup?>, $FutureProvider<EquipmentSetup?> {
  /// A provider for loading an [EquipmentSetup] from a file at [path], if it's
  /// valid.
  LoadEquipmentSetupFromFileProvider._({
    required LoadEquipmentSetupFromFileFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadEquipmentSetupFromFileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadEquipmentSetupFromFileHash();

  @override
  String toString() {
    return r'loadEquipmentSetupFromFileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<EquipmentSetup?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EquipmentSetup?> create(Ref ref) {
    final argument = this.argument as String;
    return loadEquipmentSetupFromFile(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadEquipmentSetupFromFileProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadEquipmentSetupFromFileHash() =>
    r'a1f1892452fc1a6c7a1b36881a262c3a9307753c';

/// A provider for loading an [EquipmentSetup] from a file at [path], if it's
/// valid.

final class LoadEquipmentSetupFromFileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<EquipmentSetup?>, String> {
  LoadEquipmentSetupFromFileFamily._()
    : super(
        retry: null,
        name: r'loadEquipmentSetupFromFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for loading an [EquipmentSetup] from a file at [path], if it's
  /// valid.

  LoadEquipmentSetupFromFileProvider call(String path) =>
      LoadEquipmentSetupFromFileProvider._(argument: path, from: this);

  @override
  String toString() => r'loadEquipmentSetupFromFileProvider';
}

/// A provider for importing a equipment setup configuration from the user file
/// directory and applying it to the [ConfiguredEquipmentSetup] provider.

@ProviderFor(importEquipmentSetup)
final importEquipmentSetupProvider = ImportEquipmentSetupProvider._();

/// A provider for importing a equipment setup configuration from the user file
/// directory and applying it to the [ConfiguredEquipmentSetup] provider.

final class ImportEquipmentSetupProvider
    extends
        $FunctionalProvider<
          AsyncValue<EquipmentSetup?>,
          EquipmentSetup?,
          FutureOr<EquipmentSetup?>
        >
    with $FutureModifier<EquipmentSetup?>, $FutureProvider<EquipmentSetup?> {
  /// A provider for importing a equipment setup configuration from the user file
  /// directory and applying it to the [ConfiguredEquipmentSetup] provider.
  ImportEquipmentSetupProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'importEquipmentSetupProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$importEquipmentSetupHash();

  @$internal
  @override
  $FutureProviderElement<EquipmentSetup?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EquipmentSetup?> create(Ref ref) {
    return importEquipmentSetup(ref);
  }
}

String _$importEquipmentSetupHash() =>
    r'90ff69be4b648e9a00b4588baac47bf6b1039bb3';
