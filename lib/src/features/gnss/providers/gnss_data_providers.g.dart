// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gnss_data_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the last GNSS position NMEA sentence.

@ProviderFor(GnssCurrentSentence)
final gnssCurrentSentenceProvider = GnssCurrentSentenceProvider._();

/// A provider for the last GNSS position NMEA sentence.
final class GnssCurrentSentenceProvider
    extends
        $NotifierProvider<GnssCurrentSentence, GnssPositionCommonSentence?> {
  /// A provider for the last GNSS position NMEA sentence.
  GnssCurrentSentenceProvider._()
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
    r'546d03ba5dc9fed55018508605ac36cfbbf0d28d';

/// A provider for the last GNSS position NMEA sentence.

abstract class _$GnssCurrentSentence
    extends $Notifier<GnssPositionCommonSentence?> {
  GnssPositionCommonSentence? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
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
    return element.handleCreate(ref, build);
  }
}

/// A provider for the frequency of the GNSS updates.

@ProviderFor(GnssCurrentFrequency)
final gnssCurrentFrequencyProvider = GnssCurrentFrequencyProvider._();

/// A provider for the frequency of the GNSS updates.
final class GnssCurrentFrequencyProvider
    extends $NotifierProvider<GnssCurrentFrequency, double?> {
  /// A provider for the frequency of the GNSS updates.
  GnssCurrentFrequencyProvider._()
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
    r'4b8f1340185af6374be892c35af870a4e69009be';

/// A provider for the frequency of the GNSS updates.

abstract class _$GnssCurrentFrequency extends $Notifier<double?> {
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

/// A provider for the time of the last GNSS update.

@ProviderFor(GnssLastUpdateTime)
final gnssLastUpdateTimeProvider = GnssLastUpdateTimeProvider._();

/// A provider for the time of the last GNSS update.
final class GnssLastUpdateTimeProvider
    extends
        $NotifierProvider<
          GnssLastUpdateTime,
          ({Duration? delay, DateTime device, DateTime? receiver})?
        > {
  /// A provider for the time of the last GNSS update.
  GnssLastUpdateTimeProvider._()
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
  WhenComplete runBuild() {
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
    return element.handleCreate(ref, build);
  }
}

/// A provider for the precision error of the last GNSS update.

@ProviderFor(GnssPrecisionError)
final gnssPrecisionErrorProvider = GnssPrecisionErrorProvider._();

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
  GnssPrecisionErrorProvider._()
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
    r'4944db0f98c53ce51ad099924c151981cc5b726a';

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
  WhenComplete runBuild() {
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
    return element.handleCreate(ref, build);
  }
}

/// A provider for the last secondary GNSS position NMEA.

@ProviderFor(GnssSecondaryCurrentSentence)
final gnssSecondaryCurrentSentenceProvider =
    GnssSecondaryCurrentSentenceProvider._();

/// A provider for the last secondary GNSS position NMEA.
final class GnssSecondaryCurrentSentenceProvider
    extends
        $NotifierProvider<
          GnssSecondaryCurrentSentence,
          GnssPositionCommonSentence?
        > {
  /// A provider for the last secondary GNSS position NMEA.
  GnssSecondaryCurrentSentenceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gnssSecondaryCurrentSentenceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gnssSecondaryCurrentSentenceHash();

  @$internal
  @override
  GnssSecondaryCurrentSentence create() => GnssSecondaryCurrentSentence();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GnssPositionCommonSentence? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GnssPositionCommonSentence?>(value),
    );
  }
}

String _$gnssSecondaryCurrentSentenceHash() =>
    r'4abd15c0b6cf1130b518640958409cde543ee3a8';

/// A provider for the last secondary GNSS position NMEA.

abstract class _$GnssSecondaryCurrentSentence
    extends $Notifier<GnssPositionCommonSentence?> {
  GnssPositionCommonSentence? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
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
    return element.handleCreate(ref, build);
  }
}

/// A provider for sending the vehicle GNSS config to the hardware.

@ProviderFor(sendGnssReceiverConfig)
final sendGnssReceiverConfigProvider = SendGnssReceiverConfigFamily._();

/// A provider for sending the vehicle GNSS config to the hardware.

final class SendGnssReceiverConfigProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  /// A provider for sending the vehicle GNSS config to the hardware.
  SendGnssReceiverConfigProvider._({
    required SendGnssReceiverConfigFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sendGnssReceiverConfigProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sendGnssReceiverConfigHash();

  @override
  String toString() {
    return r'sendGnssReceiverConfigProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    final argument = this.argument as String;
    return sendGnssReceiverConfig(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SendGnssReceiverConfigProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sendGnssReceiverConfigHash() =>
    r'1b94bad866034d8efe4d2192a26aadb8763d71c1';

/// A provider for sending the vehicle GNSS config to the hardware.

final class SendGnssReceiverConfigFamily extends $Family
    with $FunctionalFamilyOverride<void, String> {
  SendGnssReceiverConfigFamily._()
    : super(
        retry: null,
        name: r'sendGnssReceiverConfigProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for sending the vehicle GNSS config to the hardware.

  SendGnssReceiverConfigProvider call(String config) =>
      SendGnssReceiverConfigProvider._(argument: config, from: this);

  @override
  String toString() => r'sendGnssReceiverConfigProvider';
}
