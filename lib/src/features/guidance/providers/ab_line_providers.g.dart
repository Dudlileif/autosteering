// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ab_line_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the AB-line.

@ProviderFor(ABLine)
final aBLineProvider = ABLineProvider._();

/// A provider for the AB-line.
final class ABLineProvider
    extends $AsyncNotifierProvider<ABLine, guidance.ABLine?> {
  /// A provider for the AB-line.
  ABLineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aBLineProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aBLineHash();

  @$internal
  @override
  ABLine create() => ABLine();
}

String _$aBLineHash() => r'89bf16cd284574737b546967390070cb6b1d6d1d';

/// A provider for the AB-line.

abstract class _$ABLine extends $AsyncNotifier<guidance.ABLine?> {
  FutureOr<guidance.ABLine?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<guidance.ABLine?>, guidance.ABLine?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<guidance.ABLine?>, guidance.ABLine?>,
              AsyncValue<guidance.ABLine?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the A+-line bearing.

@ProviderFor(APlusLineBearing)
final aPlusLineBearingProvider = APlusLineBearingProvider._();

/// A provider for the A+-line bearing.
final class APlusLineBearingProvider
    extends $NotifierProvider<APlusLineBearing, double?> {
  /// A provider for the A+-line bearing.
  APlusLineBearingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aPlusLineBearingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aPlusLineBearingHash();

  @$internal
  @override
  APlusLineBearing create() => APlusLineBearing();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$aPlusLineBearingHash() => r'59b6ab1e4921ed1dacf2103e6613059183d6ebae';

/// A provider for the A+-line bearing.

abstract class _$APlusLineBearing extends $Notifier<double?> {
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

/// A provider for the A+-line.

@ProviderFor(APlusLine)
final aPlusLineProvider = APlusLineProvider._();

/// A provider for the A+-line.
final class APlusLineProvider
    extends $AsyncNotifierProvider<APlusLine, guidance.APlusLine?> {
  /// A provider for the A+-line.
  APlusLineProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aPlusLineProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aPlusLineHash();

  @$internal
  @override
  APlusLine create() => APlusLine();
}

String _$aPlusLineHash() => r'8c67312daf006935e172b3e4e2d7752b611b3501';

/// A provider for the A+-line.

abstract class _$APlusLine extends $AsyncNotifier<guidance.APlusLine?> {
  FutureOr<guidance.APlusLine?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<guidance.APlusLine?>, guidance.APlusLine?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<guidance.APlusLine?>, guidance.APlusLine?>,
              AsyncValue<guidance.APlusLine?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
