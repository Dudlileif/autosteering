// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_motor_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the WAS target for the steering motor when using guidance.

@ProviderFor(SteeringMotorWasTarget)
const steeringMotorWasTargetProvider = SteeringMotorWasTargetProvider._();

/// A provider for the WAS target for the steering motor when using guidance.
final class SteeringMotorWasTargetProvider
    extends $NotifierProvider<SteeringMotorWasTarget, int?> {
  /// A provider for the WAS target for the steering motor when using guidance.
  const SteeringMotorWasTargetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steeringMotorWasTargetProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steeringMotorWasTargetHash();

  @$internal
  @override
  SteeringMotorWasTarget create() => SteeringMotorWasTarget();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$steeringMotorWasTargetHash() =>
    r'72bfced1cb682b28c99afc2943d54c3d6564dcbd';

/// A provider for the WAS target for the steering motor when using guidance.

abstract class _$SteeringMotorWasTarget extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the actual current steering motor rpm when using guidance.

@ProviderFor(SteeringMotorActualRPM)
const steeringMotorActualRPMProvider = SteeringMotorActualRPMProvider._();

/// A provider for the actual current steering motor rpm when using guidance.
final class SteeringMotorActualRPMProvider
    extends $NotifierProvider<SteeringMotorActualRPM, double?> {
  /// A provider for the actual current steering motor rpm when using guidance.
  const SteeringMotorActualRPMProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steeringMotorActualRPMProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steeringMotorActualRPMHash();

  @$internal
  @override
  SteeringMotorActualRPM create() => SteeringMotorActualRPM();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$steeringMotorActualRPMHash() =>
    r'fd0c697e905907f448c1a8f2bedd21117c27cc48';

/// A provider for the actual current steering motor rpm when using guidance.

abstract class _$SteeringMotorActualRPM extends $Notifier<double?> {
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

/// A provider for the steering motor is enabled when using guidance.

@ProviderFor(SteeringMotorStatus)
const steeringMotorStatusProvider = SteeringMotorStatusProvider._();

/// A provider for the steering motor is enabled when using guidance.
final class SteeringMotorStatusProvider
    extends $NotifierProvider<SteeringMotorStatus, MotorStatus?> {
  /// A provider for the steering motor is enabled when using guidance.
  const SteeringMotorStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steeringMotorStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steeringMotorStatusHash();

  @$internal
  @override
  SteeringMotorStatus create() => SteeringMotorStatus();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MotorStatus? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MotorStatus?>(value),
    );
  }
}

String _$steeringMotorStatusHash() =>
    r'8f8122085fa4bd0dfb71d341dfb997184c2505c5';

/// A provider for the steering motor is enabled when using guidance.

abstract class _$SteeringMotorStatus extends $Notifier<MotorStatus?> {
  MotorStatus? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MotorStatus?, MotorStatus?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MotorStatus?, MotorStatus?>,
              MotorStatus?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the steering motor Stallguard reading.

@ProviderFor(SteeringMotorCurrentScale)
const steeringMotorCurrentScaleProvider = SteeringMotorCurrentScaleProvider._();

/// A provider for the steering motor Stallguard reading.
final class SteeringMotorCurrentScaleProvider
    extends $NotifierProvider<SteeringMotorCurrentScale, int?> {
  /// A provider for the steering motor Stallguard reading.
  const SteeringMotorCurrentScaleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steeringMotorCurrentScaleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steeringMotorCurrentScaleHash();

  @$internal
  @override
  SteeringMotorCurrentScale create() => SteeringMotorCurrentScale();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$steeringMotorCurrentScaleHash() =>
    r'230eeaca47163718a89ca86d5c0dbae430036ab3';

/// A provider for the steering motor Stallguard reading.

abstract class _$SteeringMotorCurrentScale extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the steering motor Stallguard reading.

@ProviderFor(SteeringMotorStallguard)
const steeringMotorStallguardProvider = SteeringMotorStallguardProvider._();

/// A provider for the steering motor Stallguard reading.
final class SteeringMotorStallguardProvider
    extends $NotifierProvider<SteeringMotorStallguard, int?> {
  /// A provider for the steering motor Stallguard reading.
  const SteeringMotorStallguardProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steeringMotorStallguardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steeringMotorStallguardHash();

  @$internal
  @override
  SteeringMotorStallguard create() => SteeringMotorStallguard();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$steeringMotorStallguardHash() =>
    r'e31f31120e10956d54b5eb5551e6c3bb0e9b2c52';

/// A provider for the steering motor Stallguard reading.

abstract class _$SteeringMotorStallguard extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider whether the steering motor should be in calibration mode.

@ProviderFor(SteeringMotorEnableCalibration)
const steeringMotorEnableCalibrationProvider =
    SteeringMotorEnableCalibrationProvider._();

/// A provider whether the steering motor should be in calibration mode.
final class SteeringMotorEnableCalibrationProvider
    extends $NotifierProvider<SteeringMotorEnableCalibration, bool> {
  /// A provider whether the steering motor should be in calibration mode.
  const SteeringMotorEnableCalibrationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steeringMotorEnableCalibrationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steeringMotorEnableCalibrationHash();

  @$internal
  @override
  SteeringMotorEnableCalibration create() => SteeringMotorEnableCalibration();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$steeringMotorEnableCalibrationHash() =>
    r'bf1927a63cd541f39f26083a5814353d3e6b412a';

/// A provider whether the steering motor should be in calibration mode.

abstract class _$SteeringMotorEnableCalibration extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the current rotational position of the steering motor.

@ProviderFor(SteeringMotorRotation)
const steeringMotorRotationProvider = SteeringMotorRotationProvider._();

/// A provider for the current rotational position of the steering motor.
final class SteeringMotorRotationProvider
    extends $NotifierProvider<SteeringMotorRotation, double?> {
  /// A provider for the current rotational position of the steering motor.
  const SteeringMotorRotationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steeringMotorRotationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steeringMotorRotationHash();

  @$internal
  @override
  SteeringMotorRotation create() => SteeringMotorRotation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$steeringMotorRotationHash() =>
    r'c9287d0e93e6259bf17cbea3a355e62aa1d22cfb';

/// A provider for the current rotational position of the steering motor.

abstract class _$SteeringMotorRotation extends $Notifier<double?> {
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

/// A provider for target rotational position of the steering motor,
/// only used in calibration mode.

@ProviderFor(SteeringMotorTargetRotation)
const steeringMotorTargetRotationProvider =
    SteeringMotorTargetRotationProvider._();

/// A provider for target rotational position of the steering motor,
/// only used in calibration mode.
final class SteeringMotorTargetRotationProvider
    extends $NotifierProvider<SteeringMotorTargetRotation, double?> {
  /// A provider for target rotational position of the steering motor,
  /// only used in calibration mode.
  const SteeringMotorTargetRotationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steeringMotorTargetRotationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$steeringMotorTargetRotationHash();

  @$internal
  @override
  SteeringMotorTargetRotation create() => SteeringMotorTargetRotation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$steeringMotorTargetRotationHash() =>
    r'f2b6a3763c3413fbafc36be6322c16e425985446';

/// A provider for target rotational position of the steering motor,
/// only used in calibration mode.

abstract class _$SteeringMotorTargetRotation extends $Notifier<double?> {
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

/// A provider for the motor steps per WAS increment between WAS min and center
/// value.

@ProviderFor(SteeringMotorStepsPerWasIncrementMinToCenter)
const steeringMotorStepsPerWasIncrementMinToCenterProvider =
    SteeringMotorStepsPerWasIncrementMinToCenterProvider._();

/// A provider for the motor steps per WAS increment between WAS min and center
/// value.
final class SteeringMotorStepsPerWasIncrementMinToCenterProvider
    extends
        $NotifierProvider<
          SteeringMotorStepsPerWasIncrementMinToCenter,
          double?
        > {
  /// A provider for the motor steps per WAS increment between WAS min and center
  /// value.
  const SteeringMotorStepsPerWasIncrementMinToCenterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steeringMotorStepsPerWasIncrementMinToCenterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$steeringMotorStepsPerWasIncrementMinToCenterHash();

  @$internal
  @override
  SteeringMotorStepsPerWasIncrementMinToCenter create() =>
      SteeringMotorStepsPerWasIncrementMinToCenter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$steeringMotorStepsPerWasIncrementMinToCenterHash() =>
    r'a4550c9b069a5d02d0891a2d10f65eaaa9a0b897';

/// A provider for the motor steps per WAS increment between WAS min and center
/// value.

abstract class _$SteeringMotorStepsPerWasIncrementMinToCenter
    extends $Notifier<double?> {
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

/// A provider for the motor steps per WAS increment between WAS center and max
/// value.

@ProviderFor(SteeringMotorStepsPerWasIncrementCenterToMax)
const steeringMotorStepsPerWasIncrementCenterToMaxProvider =
    SteeringMotorStepsPerWasIncrementCenterToMaxProvider._();

/// A provider for the motor steps per WAS increment between WAS center and max
/// value.
final class SteeringMotorStepsPerWasIncrementCenterToMaxProvider
    extends
        $NotifierProvider<
          SteeringMotorStepsPerWasIncrementCenterToMax,
          double?
        > {
  /// A provider for the motor steps per WAS increment between WAS center and max
  /// value.
  const SteeringMotorStepsPerWasIncrementCenterToMaxProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steeringMotorStepsPerWasIncrementCenterToMaxProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$steeringMotorStepsPerWasIncrementCenterToMaxHash();

  @$internal
  @override
  SteeringMotorStepsPerWasIncrementCenterToMax create() =>
      SteeringMotorStepsPerWasIncrementCenterToMax();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$steeringMotorStepsPerWasIncrementCenterToMaxHash() =>
    r'8cfdf066aa195f80b253d076abf91fcde7e64eef';

/// A provider for the motor steps per WAS increment between WAS center and max
/// value.

abstract class _$SteeringMotorStepsPerWasIncrementCenterToMax
    extends $Notifier<double?> {
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

/// A provider for getting the motor configuration from the hardware.

@ProviderFor(getSteeringHardwareConfig)
const getSteeringHardwareConfigProvider = GetSteeringHardwareConfigProvider._();

/// A provider for getting the motor configuration from the hardware.

final class GetSteeringHardwareConfigProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for getting the motor configuration from the hardware.
  const GetSteeringHardwareConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getSteeringHardwareConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getSteeringHardwareConfigHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return getSteeringHardwareConfig(ref);
  }
}

String _$getSteeringHardwareConfigHash() =>
    r'6fa4a5d48280ae120133fff6b7ad0130d1ded867';

/// A provider for updating the motor configuration on the hardware with the
/// parameters corresponding to [keyContainer].

@ProviderFor(updateSteeringHardwareConfig)
const updateSteeringHardwareConfigProvider =
    UpdateSteeringHardwareConfigFamily._();

/// A provider for updating the motor configuration on the hardware with the
/// parameters corresponding to [keyContainer].

final class UpdateSteeringHardwareConfigProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for updating the motor configuration on the hardware with the
  /// parameters corresponding to [keyContainer].
  const UpdateSteeringHardwareConfigProvider._({
    required UpdateSteeringHardwareConfigFamily super.from,
    required SteeringHardwareConfigKeysContainer super.argument,
  }) : super(
         retry: null,
         name: r'updateSteeringHardwareConfigProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateSteeringHardwareConfigHash();

  @override
  String toString() {
    return r'updateSteeringHardwareConfigProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as SteeringHardwareConfigKeysContainer;
    return updateSteeringHardwareConfig(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateSteeringHardwareConfigProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateSteeringHardwareConfigHash() =>
    r'6397d7a756a81a2081aaa49abe875b9637b6c1ed';

/// A provider for updating the motor configuration on the hardware with the
/// parameters corresponding to [keyContainer].

final class UpdateSteeringHardwareConfigFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          SteeringHardwareConfigKeysContainer
        > {
  const UpdateSteeringHardwareConfigFamily._()
    : super(
        retry: null,
        name: r'updateSteeringHardwareConfigProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// A provider for updating the motor configuration on the hardware with the
  /// parameters corresponding to [keyContainer].

  UpdateSteeringHardwareConfigProvider call(
    SteeringHardwareConfigKeysContainer keyContainer,
  ) => UpdateSteeringHardwareConfigProvider._(
    argument: keyContainer,
    from: this,
  );

  @override
  String toString() => r'updateSteeringHardwareConfigProvider';
}

/// A provider for sending the whole motor configuration to the hardware.

@ProviderFor(sendSteeringHardwareConfig)
const sendSteeringHardwareConfigProvider =
    SendSteeringHardwareConfigProvider._();

/// A provider for sending the whole motor configuration to the hardware.

final class SendSteeringHardwareConfigProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for sending the whole motor configuration to the hardware.
  const SendSteeringHardwareConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendSteeringHardwareConfigProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendSteeringHardwareConfigHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return sendSteeringHardwareConfig(ref);
  }
}

String _$sendSteeringHardwareConfigHash() =>
    r'5d4163f872056a0781518790e027656e9abb22e8';

/// A provider for the UI [Offset] for the steering hardware configurator.

@ProviderFor(SteeringHardwareConfiguratorUiOffset)
const steeringHardwareConfiguratorUiOffsetProvider =
    SteeringHardwareConfiguratorUiOffsetProvider._();

/// A provider for the UI [Offset] for the steering hardware configurator.
final class SteeringHardwareConfiguratorUiOffsetProvider
    extends $NotifierProvider<SteeringHardwareConfiguratorUiOffset, Offset> {
  /// A provider for the UI [Offset] for the steering hardware configurator.
  const SteeringHardwareConfiguratorUiOffsetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'steeringHardwareConfiguratorUiOffsetProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$steeringHardwareConfiguratorUiOffsetHash();

  @$internal
  @override
  SteeringHardwareConfiguratorUiOffset create() =>
      SteeringHardwareConfiguratorUiOffset();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Offset value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Offset>(value),
    );
  }
}

String _$steeringHardwareConfiguratorUiOffsetHash() =>
    r'9b7a72885bfa15595da20455e44c1493d6f03a1d';

/// A provider for the UI [Offset] for the steering hardware configurator.

abstract class _$SteeringHardwareConfiguratorUiOffset
    extends $Notifier<Offset> {
  Offset build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Offset, Offset>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Offset, Offset>,
              Offset,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
