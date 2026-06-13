// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the main settings file for the application.

@ProviderFor(settingsFile)
final settingsFileProvider = SettingsFileProvider._();

/// A provider for the main settings file for the application.

final class SettingsFileProvider
    extends $FunctionalProvider<AsyncValue<File>, File, FutureOr<File>>
    with $FutureModifier<File>, $FutureProvider<File> {
  /// A provider for the main settings file for the application.
  SettingsFileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsFileProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsFileHash();

  @$internal
  @override
  $FutureProviderElement<File> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<File> create(Ref ref) {
    return settingsFile(ref);
  }
}

String _$settingsFileHash() => r'98b93957cd675ecf3d627bbbb3d6a77ff40beda5';

/// A provider for the local storage data map for the web version of the
/// application.

@ProviderFor(webLocalStorage)
final webLocalStorageProvider = WebLocalStorageProvider._();

/// A provider for the local storage data map for the web version of the
/// application.

final class WebLocalStorageProvider
    extends $FunctionalProvider<Storage, Storage, Storage>
    with $Provider<Storage> {
  /// A provider for the local storage data map for the web version of the
  /// application.
  WebLocalStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'webLocalStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$webLocalStorageHash();

  @$internal
  @override
  $ProviderElement<Storage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Storage create(Ref ref) {
    return webLocalStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Storage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Storage>(value),
    );
  }
}

String _$webLocalStorageHash() => r'50d83eb101a9fb85659a1001a54480b4c30a3c85';

/// A provider for the settings map for the application.

@ProviderFor(Settings)
final settingsProvider = SettingsProvider._();

/// A provider for the settings map for the application.
final class SettingsProvider
    extends $NotifierProvider<Settings, SplayTreeMap<String, dynamic>> {
  /// A provider for the settings map for the application.
  SettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsHash();

  @$internal
  @override
  Settings create() => Settings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplayTreeMap<String, dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplayTreeMap<String, dynamic>>(
        value,
      ),
    );
  }
}

String _$settingsHash() => r'05647fa8fc03ea0d1d4cdce1650207fe3372e404';

/// A provider for the settings map for the application.

abstract class _$Settings extends $Notifier<SplayTreeMap<String, dynamic>> {
  SplayTreeMap<String, dynamic> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              SplayTreeMap<String, dynamic>,
              SplayTreeMap<String, dynamic>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                SplayTreeMap<String, dynamic>,
                SplayTreeMap<String, dynamic>
              >,
              SplayTreeMap<String, dynamic>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for whether the debug features and switches should be shown.

@ProviderFor(EnableDebugMode)
final enableDebugModeProvider = EnableDebugModeProvider._();

/// A provider for whether the debug features and switches should be shown.
final class EnableDebugModeProvider
    extends $NotifierProvider<EnableDebugMode, bool> {
  /// A provider for whether the debug features and switches should be shown.
  EnableDebugModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'enableDebugModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$enableDebugModeHash();

  @$internal
  @override
  EnableDebugMode create() => EnableDebugMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$enableDebugModeHash() => r'2620409a83bf2fc27eb9fe765a5d4e982543ca47';

/// A provider for whether the debug features and switches should be shown.

abstract class _$EnableDebugMode extends $Notifier<bool> {
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

/// A provider for whether dad mode should be active. This will hide a lot
/// of advanced features that might be confusing.

@ProviderFor(EnableDadMode)
final enableDadModeProvider = EnableDadModeProvider._();

/// A provider for whether dad mode should be active. This will hide a lot
/// of advanced features that might be confusing.
final class EnableDadModeProvider
    extends $NotifierProvider<EnableDadMode, bool> {
  /// A provider for whether dad mode should be active. This will hide a lot
  /// of advanced features that might be confusing.
  EnableDadModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'enableDadModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$enableDadModeHash();

  @$internal
  @override
  EnableDadMode create() => EnableDadMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$enableDadModeHash() => r'40bbbc264e26c5d883c805eaaf8c45bef03a3283';

/// A provider for whether dad mode should be active. This will hide a lot
/// of advanced features that might be confusing.

abstract class _$EnableDadMode extends $Notifier<bool> {
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

/// A provider for exporting [Settings] to a file.

@ProviderFor(exportSettings)
final exportSettingsProvider = ExportSettingsFamily._();

/// A provider for exporting [Settings] to a file.

final class ExportSettingsProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting [Settings] to a file.
  ExportSettingsProvider._({
    required ExportSettingsFamily super.from,
    required ({
      String? overrideName,
      bool downloadIfWeb,
      bool removeSensitiveData,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'exportSettingsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportSettingsHash();

  @override
  String toString() {
    return r'exportSettingsProvider'
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
            as ({
              String? overrideName,
              bool downloadIfWeb,
              bool removeSensitiveData,
            });
    return exportSettings(
      ref,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
      removeSensitiveData: argument.removeSensitiveData,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportSettingsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportSettingsHash() => r'a30f6a519a4fe93718a98f15d053a84a61ef82d1';

/// A provider for exporting [Settings] to a file.

final class ExportSettingsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({String? overrideName, bool downloadIfWeb, bool removeSensitiveData})
        > {
  ExportSettingsFamily._()
    : super(
        retry: null,
        name: r'exportSettingsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for exporting [Settings] to a file.

  ExportSettingsProvider call({
    String? overrideName,
    bool downloadIfWeb = true,
    bool removeSensitiveData = false,
  }) => ExportSettingsProvider._(
    argument: (
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
      removeSensitiveData: removeSensitiveData,
    ),
    from: this,
  );

  @override
  String toString() => r'exportSettingsProvider';
}

/// A provider for importing [Settings] from a file.

@ProviderFor(importSettings)
final importSettingsProvider = ImportSettingsProvider._();

/// A provider for importing [Settings] from a file.

final class ImportSettingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, dynamic>?>,
          Map<String, dynamic>?,
          FutureOr<Map<String, dynamic>?>
        >
    with
        $FutureModifier<Map<String, dynamic>?>,
        $FutureProvider<Map<String, dynamic>?> {
  /// A provider for importing [Settings] from a file.
  ImportSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'importSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$importSettingsHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, dynamic>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, dynamic>?> create(Ref ref) {
    return importSettings(ref);
  }
}

String _$importSettingsHash() => r'837414fcb6326138ece43f9b62aa4a1127a91854';

/// A provider for rebuilding all providers that reads [Settings] during the
/// build method.

@ProviderFor(reloadAllSettings)
final reloadAllSettingsProvider = ReloadAllSettingsProvider._();

/// A provider for rebuilding all providers that reads [Settings] during the
/// build method.

final class ReloadAllSettingsProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  /// A provider for rebuilding all providers that reads [Settings] during the
  /// build method.
  ReloadAllSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reloadAllSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reloadAllSettingsHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return reloadAllSettings(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$reloadAllSettingsHash() => r'cda9fc34c9c7c0205dce8fe1dd421b55ecabeb0c';

/// A provider for which area unit the UI should show.

@ProviderFor(UiUnitArea)
final uiUnitAreaProvider = UiUnitAreaProvider._();

/// A provider for which area unit the UI should show.
final class UiUnitAreaProvider extends $NotifierProvider<UiUnitArea, UnitArea> {
  /// A provider for which area unit the UI should show.
  UiUnitAreaProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uiUnitAreaProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uiUnitAreaHash();

  @$internal
  @override
  UiUnitArea create() => UiUnitArea();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UnitArea value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UnitArea>(value),
    );
  }
}

String _$uiUnitAreaHash() => r'ff7e8ff3cb31c582a775882f2ac2819dbded9417';

/// A provider for which area unit the UI should show.

abstract class _$UiUnitArea extends $Notifier<UnitArea> {
  UnitArea build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UnitArea, UnitArea>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UnitArea, UnitArea>,
              UnitArea,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for which distance unit the UI should show.

@ProviderFor(UiUnitLength)
final uiUnitLengthProvider = UiUnitLengthProvider._();

/// A provider for which distance unit the UI should show.
final class UiUnitLengthProvider
    extends $NotifierProvider<UiUnitLength, UnitLength> {
  /// A provider for which distance unit the UI should show.
  UiUnitLengthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uiUnitLengthProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uiUnitLengthHash();

  @$internal
  @override
  UiUnitLength create() => UiUnitLength();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UnitLength value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UnitLength>(value),
    );
  }
}

String _$uiUnitLengthHash() => r'65b975e775a5fc7c50818dc1d392fb02c9213d33';

/// A provider for which distance unit the UI should show.

abstract class _$UiUnitLength extends $Notifier<UnitLength> {
  UnitLength build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UnitLength, UnitLength>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UnitLength, UnitLength>,
              UnitLength,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for which velocity unit the UI should show.

@ProviderFor(UiUnitVelocity)
final uiUnitVelocityProvider = UiUnitVelocityProvider._();

/// A provider for which velocity unit the UI should show.
final class UiUnitVelocityProvider
    extends $NotifierProvider<UiUnitVelocity, UnitVelocity> {
  /// A provider for which velocity unit the UI should show.
  UiUnitVelocityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uiUnitVelocityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uiUnitVelocityHash();

  @$internal
  @override
  UiUnitVelocity create() => UiUnitVelocity();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UnitVelocity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UnitVelocity>(value),
    );
  }
}

String _$uiUnitVelocityHash() => r'8c837d38b6c6732a8d6dd46c38c375c7edb3bbea';

/// A provider for which velocity unit the UI should show.

abstract class _$UiUnitVelocity extends $Notifier<UnitVelocity> {
  UnitVelocity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UnitVelocity, UnitVelocity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UnitVelocity, UnitVelocity>,
              UnitVelocity,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for which locale to use.

@ProviderFor(UiLocale)
final uiLocaleProvider = UiLocaleProvider._();

/// A provider for which locale to use.
final class UiLocaleProvider extends $NotifierProvider<UiLocale, Locale> {
  /// A provider for which locale to use.
  UiLocaleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'uiLocaleProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$uiLocaleHash();

  @$internal
  @override
  UiLocale create() => UiLocale();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$uiLocaleHash() => r'289b692aee4203fde31d8186eaa4aeba0502a561';

/// A provider for which locale to use.

abstract class _$UiLocale extends $Notifier<Locale> {
  Locale build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Locale, Locale>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Locale, Locale>,
              Locale,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
