// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_replay_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the active [LogReplay].

@ProviderFor(ActiveLogReplay)
final activeLogReplayProvider = ActiveLogReplayProvider._();

/// A provider for the active [LogReplay].
final class ActiveLogReplayProvider
    extends $NotifierProvider<ActiveLogReplay, LogReplay?> {
  /// A provider for the active [LogReplay].
  ActiveLogReplayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeLogReplayProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeLogReplayHash();

  @$internal
  @override
  ActiveLogReplay create() => ActiveLogReplay();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogReplay? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogReplay?>(value),
    );
  }
}

String _$activeLogReplayHash() => r'e8d93a42b54febed5a79e8ea7887d983d672640e';

/// A provider for the active [LogReplay].

abstract class _$ActiveLogReplay extends $Notifier<LogReplay?> {
  LogReplay? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<LogReplay?, LogReplay?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LogReplay?, LogReplay?>,
              LogReplay?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the index of the playing log replay.

@ProviderFor(LogReplayIndex)
final logReplayIndexProvider = LogReplayIndexProvider._();

/// A provider for the index of the playing log replay.
final class LogReplayIndexProvider
    extends $NotifierProvider<LogReplayIndex, int> {
  /// A provider for the index of the playing log replay.
  LogReplayIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logReplayIndexProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logReplayIndexHash();

  @$internal
  @override
  LogReplayIndex create() => LogReplayIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$logReplayIndexHash() => r'dc32309208b056c60eaad78b57186e6a104098c4';

/// A provider for the index of the playing log replay.

abstract class _$LogReplayIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for whether the log replays should loop.

@ProviderFor(LoopLogReplay)
final loopLogReplayProvider = LoopLogReplayProvider._();

/// A provider for whether the log replays should loop.
final class LoopLogReplayProvider
    extends $NotifierProvider<LoopLogReplay, bool> {
  /// A provider for whether the log replays should loop.
  LoopLogReplayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loopLogReplayProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loopLogReplayHash();

  @$internal
  @override
  LoopLogReplay create() => LoopLogReplay();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$loopLogReplayHash() => r'3bec3b6c091b803d78ce49288b328363cab03785';

/// A provider for whether the log replays should loop.

abstract class _$LoopLogReplay extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for loading a [LogReplay] from a file at [path], if it's valid.

@ProviderFor(loadLogReplayFromFile)
final loadLogReplayFromFileProvider = LoadLogReplayFromFileFamily._();

/// A provider for loading a [LogReplay] from a file at [path], if it's valid.

final class LoadLogReplayFromFileProvider
    extends
        $FunctionalProvider<
          AsyncValue<LogReplay?>,
          LogReplay?,
          FutureOr<LogReplay?>
        >
    with $FutureModifier<LogReplay?>, $FutureProvider<LogReplay?> {
  /// A provider for loading a [LogReplay] from a file at [path], if it's valid.
  LoadLogReplayFromFileProvider._({
    required LoadLogReplayFromFileFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadLogReplayFromFileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadLogReplayFromFileHash();

  @override
  String toString() {
    return r'loadLogReplayFromFileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<LogReplay?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<LogReplay?> create(Ref ref) {
    final argument = this.argument as String;
    return loadLogReplayFromFile(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadLogReplayFromFileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadLogReplayFromFileHash() =>
    r'039c5f7116fb6afef9bdce010f1745ac1eba16d3';

/// A provider for loading a [LogReplay] from a file at [path], if it's valid.

final class LoadLogReplayFromFileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<LogReplay?>, String> {
  LoadLogReplayFromFileFamily._()
    : super(
        retry: null,
        name: r'loadLogReplayFromFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for loading a [LogReplay] from a file at [path], if it's valid.

  LoadLogReplayFromFileProvider call(String path) =>
      LoadLogReplayFromFileProvider._(argument: path, from: this);

  @override
  String toString() => r'loadLogReplayFromFileProvider';
}

/// A provider for importing a [LogReplay] from a file.

@ProviderFor(importLogReplay)
final importLogReplayProvider = ImportLogReplayFamily._();

/// A provider for importing a [LogReplay] from a file.

final class ImportLogReplayProvider
    extends
        $FunctionalProvider<
          AsyncValue<LogReplay?>,
          LogReplay?,
          FutureOr<LogReplay?>
        >
    with $FutureModifier<LogReplay?>, $FutureProvider<LogReplay?> {
  /// A provider for importing a [LogReplay] from a file.
  ImportLogReplayProvider._({
    required ImportLogReplayFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'importLogReplayProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$importLogReplayHash();

  @override
  String toString() {
    return r'importLogReplayProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<LogReplay?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<LogReplay?> create(Ref ref) {
    final argument = this.argument as String;
    return importLogReplay(ref, dialogTitle: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ImportLogReplayProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$importLogReplayHash() => r'b52700897b191de4b639359f856921dddc1accfc';

/// A provider for importing a [LogReplay] from a file.

final class ImportLogReplayFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<LogReplay?>, String> {
  ImportLogReplayFamily._()
    : super(
        retry: null,
        name: r'importLogReplayProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for importing a [LogReplay] from a file.

  ImportLogReplayProvider call({required String dialogTitle}) =>
      ImportLogReplayProvider._(argument: dialogTitle, from: this);

  @override
  String toString() => r'importLogReplayProvider';
}
