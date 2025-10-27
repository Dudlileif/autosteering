// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gnss_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the quality of last GNSS position update.

@ProviderFor(GnssCurrentSentence)
const gnssCurrentSentenceProvider = GnssCurrentSentenceProvider._();

/// A provider for the quality of last GNSS position update.
final class GnssCurrentSentenceProvider
    extends
        $NotifierProvider<GnssCurrentSentence, GnssPositionCommonSentence?> {
  /// A provider for the quality of last GNSS position update.
  const GnssCurrentSentenceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gnssCurrentSentenceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gnssCurrentSentenceHash();

  @$internal
  @override
  GnssCurrentSentence create() => GnssCurrentSentence();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GnssPositionCommonSentence? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GnssPositionCommonSentence?>(value),
    );
  }
}

String _$gnssCurrentSentenceHash() =>
    r'ca68c8fac86fb77318ff5aa0b21f6122afe0d3b9';

/// A provider for the quality of last GNSS position update.

abstract class _$GnssCurrentSentence
    extends $Notifier<GnssPositionCommonSentence?> {
  GnssPositionCommonSentence? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<GnssPositionCommonSentence?, GnssPositionCommonSentence?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                GnssPositionCommonSentence?,
                GnssPositionCommonSentence?
              >,
              GnssPositionCommonSentence?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the frequency of the GNSS updates.

@ProviderFor(GnssCurrentFrequency)
const gnssCurrentFrequencyProvider = GnssCurrentFrequencyProvider._();

/// A provider for the frequency of the GNSS updates.
final class GnssCurrentFrequencyProvider
    extends $NotifierProvider<GnssCurrentFrequency, double?> {
  /// A provider for the frequency of the GNSS updates.
  const GnssCurrentFrequencyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gnssCurrentFrequencyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gnssCurrentFrequencyHash();

  @$internal
  @override
  GnssCurrentFrequency create() => GnssCurrentFrequency();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$gnssCurrentFrequencyHash() =>
    r'a8fc1a0c70aab7c4c84054d15bc0a6ec2959f8c9';

/// A provider for the frequency of the GNSS updates.

abstract class _$GnssCurrentFrequency extends $Notifier<double?> {
  double? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<double?, double?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double?, double?>,
              double?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the time of the last GNSS update.

@ProviderFor(GnssLastUpdateTime)
const gnssLastUpdateTimeProvider = GnssLastUpdateTimeProvider._();

/// A provider for the time of the last GNSS update.
final class GnssLastUpdateTimeProvider
    extends
        $NotifierProvider<
          GnssLastUpdateTime,
          ({Duration? delay, DateTime device, DateTime? receiver})?
        > {
  /// A provider for the time of the last GNSS update.
  const GnssLastUpdateTimeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gnssLastUpdateTimeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gnssLastUpdateTimeHash();

  @$internal
  @override
  GnssLastUpdateTime create() => GnssLastUpdateTime();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    ({Duration? delay, DateTime device, DateTime? receiver})? value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            ({Duration? delay, DateTime device, DateTime? receiver})?
          >(value),
    );
  }
}

String _$gnssLastUpdateTimeHash() =>
    r'9669eef679461a6c981e15186e481bdde98074a6';

/// A provider for the time of the last GNSS update.

abstract class _$GnssLastUpdateTime
    extends
        $Notifier<({Duration? delay, DateTime device, DateTime? receiver})?> {
  ({Duration? delay, DateTime device, DateTime? receiver})? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              ({Duration? delay, DateTime device, DateTime? receiver})?,
              ({Duration? delay, DateTime device, DateTime? receiver})?
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ({Duration? delay, DateTime device, DateTime? receiver})?,
                ({Duration? delay, DateTime device, DateTime? receiver})?
              >,
              ({Duration? delay, DateTime device, DateTime? receiver})?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the precision error of the last GNSS update.

@ProviderFor(GnssPrecisionError)
const gnssPrecisionErrorProvider = GnssPrecisionErrorProvider._();

/// A provider for the precision error of the last GNSS update.
final class GnssPrecisionErrorProvider
    extends
        $NotifierProvider<
          GnssPrecisionError,
          ({
            double? altitudeError,
            double? latitudeError,
            double? longitudeError,
          })?
        > {
  /// A provider for the precision error of the last GNSS update.
  const GnssPrecisionErrorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gnssPrecisionErrorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gnssPrecisionErrorHash();

  @$internal
  @override
  GnssPrecisionError create() => GnssPrecisionError();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    ({double? altitudeError, double? latitudeError, double? longitudeError})?
    value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            ({
              double? altitudeError,
              double? latitudeError,
              double? longitudeError,
            })?
          >(value),
    );
  }
}

String _$gnssPrecisionErrorHash() =>
    r'39a03ac359f2b51e31bce7937b8275137ffb483f';

/// A provider for the precision error of the last GNSS update.

abstract class _$GnssPrecisionError
    extends
        $Notifier<
          ({
            double? altitudeError,
            double? latitudeError,
            double? longitudeError,
          })?
        > {
  ({double? altitudeError, double? latitudeError, double? longitudeError})?
  build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              ({
                double? altitudeError,
                double? latitudeError,
                double? longitudeError,
              })?,
              ({
                double? altitudeError,
                double? latitudeError,
                double? longitudeError,
              })?
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                ({
                  double? altitudeError,
                  double? latitudeError,
                  double? longitudeError,
                })?,
                ({
                  double? altitudeError,
                  double? latitudeError,
                  double? longitudeError,
                })?
              >,
              ({
                double? altitudeError,
                double? latitudeError,
                double? longitudeError,
              })?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
