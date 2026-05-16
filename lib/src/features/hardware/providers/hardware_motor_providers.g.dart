// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_motor_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the WAS target for the steering motor when using guidance.

@ProviderFor(SteeringMotorWasTarget)
final steeringMotorWasTargetProvider = SteeringMotorWasTargetProvider._();

/// A provider for the WAS target for the steering motor when using guidance.
final class SteeringMotorWasTargetProvider
    extends $NotifierProvider<SteeringMotorWasTarget, int?> {
  /// A provider for the WAS target for the steering motor when using guidance.
  SteeringMotorWasTargetProvider._()
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
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the actual current steering motor rpm when using guidance.

@ProviderFor(SteeringMotorActualRPM)
final steeringMotorActualRPMProvider = SteeringMotorActualRPMProvider._();

/// A provider for the actual current steering motor rpm when using guidance.
final class SteeringMotorActualRPMProvider
    extends $NotifierProvider<SteeringMotorActualRPM, double?> {
  /// A provider for the actual current steering motor rpm when using guidance.
  SteeringMotorActualRPMProvider._()
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
    r'c4f3c88a8606b80852fb178dd15c8b0ad9ad1188';

/// A provider for the actual current steering motor rpm when using guidance.

abstract class _$SteeringMotorActualRPM extends $Notifier<double?> {
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

/// A provider for the steering motor is enabled when using guidance.

@ProviderFor(SteeringMotorStatus)
final steeringMotorStatusProvider = SteeringMotorStatusProvider._();

/// A provider for the steering motor is enabled when using guidance.
final class SteeringMotorStatusProvider
    extends $NotifierProvider<SteeringMotorStatus, MotorStatus?> {
  /// A provider for the steering motor is enabled when using guidance.
  SteeringMotorStatusProvider._()
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
    r'dc98d7275246421dfa6cbb3ddf4c7ebb78c1d5a4';

/// A provider for the steering motor is enabled when using guidance.

abstract class _$SteeringMotorStatus extends $Notifier<MotorStatus?> {
  MotorStatus? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MotorStatus?, MotorStatus?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MotorStatus?, MotorStatus?>,
              MotorStatus?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the steering motor Stallguard reading.

@ProviderFor(SteeringMotorCurrentScale)
final steeringMotorCurrentScaleProvider = SteeringMotorCurrentScaleProvider._();

/// A provider for the steering motor Stallguard reading.
final class SteeringMotorCurrentScaleProvider
    extends $NotifierProvider<SteeringMotorCurrentScale, int?> {
  /// A provider for the steering motor Stallguard reading.
  SteeringMotorCurrentScaleProvider._()
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
    r'385d48e3ca2429af7f1306d07dfe1091cd033711';

/// A provider for the steering motor Stallguard reading.

abstract class _$SteeringMotorCurrentScale extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the steering motor Stallguard reading.

@ProviderFor(SteeringMotorStallguard)
final steeringMotorStallguardProvider = SteeringMotorStallguardProvider._();

/// A provider for the steering motor Stallguard reading.
final class SteeringMotorStallguardProvider
    extends $NotifierProvider<SteeringMotorStallguard, int?> {
  /// A provider for the steering motor Stallguard reading.
  SteeringMotorStallguardProvider._()
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
    r'8b9286afc47a92a44a3f2ea13ad31d9fdb19473f';

/// A provider for the steering motor Stallguard reading.

abstract class _$SteeringMotorStallguard extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider whether the steering motor should be in calibration mode.

@ProviderFor(SteeringMotorEnableCalibration)
final steeringMotorEnableCalibrationProvider =
    SteeringMotorEnableCalibrationProvider._();

/// A provider whether the steering motor should be in calibration mode.
final class SteeringMotorEnableCalibrationProvider
    extends $NotifierProvider<SteeringMotorEnableCalibration, bool> {
  /// A provider whether the steering motor should be in calibration mode.
  SteeringMotorEnableCalibrationProvider._()
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

/// A provider for the current rotational position of the steering motor.

@ProviderFor(SteeringMotorRotation)
final steeringMotorRotationProvider = SteeringMotorRotationProvider._();

/// A provider for the current rotational position of the steering motor.
final class SteeringMotorRotationProvider
    extends $NotifierProvider<SteeringMotorRotation, double?> {
  /// A provider for the current rotational position of the steering motor.
  SteeringMotorRotationProvider._()
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
    r'01574ee0d54a7e626ce64e64227e43cf28bb2491';

/// A provider for the current rotational position of the steering motor.

abstract class _$SteeringMotorRotation extends $Notifier<double?> {
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

/// A provider for target rotational position of the steering motor,
/// only used in calibration mode.

@ProviderFor(SteeringMotorTargetRotation)
final steeringMotorTargetRotationProvider =
    SteeringMotorTargetRotationProvider._();

/// A provider for target rotational position of the steering motor,
/// only used in calibration mode.
final class SteeringMotorTargetRotationProvider
    extends $NotifierProvider<SteeringMotorTargetRotation, double?> {
  /// A provider for target rotational position of the steering motor,
  /// only used in calibration mode.
  SteeringMotorTargetRotationProvider._()
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
    r'5027b7447f3ec20ce598291b7d4497c3a6413768';

/// A provider for target rotational position of the steering motor,
/// only used in calibration mode.

abstract class _$SteeringMotorTargetRotation extends $Notifier<double?> {
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

/// A provider for the motor steps per WAS increment between WAS min and center
/// value.

@ProviderFor(SteeringMotorStepsPerWasIncrementMinToCenter)
final steeringMotorStepsPerWasIncrementMinToCenterProvider =
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
  SteeringMotorStepsPerWasIncrementMinToCenterProvider._()
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
    r'b79b35df72bf991cede0a94cd76f04d0a1b2a3ec';

/// A provider for the motor steps per WAS increment between WAS min and center
/// value.

abstract class _$SteeringMotorStepsPerWasIncrementMinToCenter
    extends $Notifier<double?> {
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

/// A provider for the motor steps per WAS increment between WAS center and max
/// value.

@ProviderFor(SteeringMotorStepsPerWasIncrementCenterToMax)
final steeringMotorStepsPerWasIncrementCenterToMaxProvider =
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
  SteeringMotorStepsPerWasIncrementCenterToMaxProvider._()
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
    r'bdfe3257ed0fdd08b4dfa13b7f32b4b97e1aeb52';

/// A provider for the motor steps per WAS increment between WAS center and max
/// value.

abstract class _$SteeringMotorStepsPerWasIncrementCenterToMax
    extends $Notifier<double?> {
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

/// A provider for getting the motor configuration from the hardware.

@ProviderFor(getSteeringHardwareConfig)
final getSteeringHardwareConfigProvider = GetSteeringHardwareConfigProvider._();

/// A provider for getting the motor configuration from the hardware.

final class GetSteeringHardwareConfigProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for getting the motor configuration from the hardware.
  GetSteeringHardwareConfigProvider._()
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
final updateSteeringHardwareConfigProvider =
    UpdateSteeringHardwareConfigFamily._();

/// A provider for updating the motor configuration on the hardware with the
/// parameters corresponding to [keyContainer].

final class UpdateSteeringHardwareConfigProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for updating the motor configuration on the hardware with the
  /// parameters corresponding to [keyContainer].
  UpdateSteeringHardwareConfigProvider._({
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
    r'6327d1d2fc5c13ae79fe899e5786fabd27939539';

/// A provider for updating the motor configuration on the hardware with the
/// parameters corresponding to [keyContainer].

final class UpdateSteeringHardwareConfigFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          SteeringHardwareConfigKeysContainer
        > {
  UpdateSteeringHardwareConfigFamily._()
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
final sendSteeringHardwareConfigProvider =
    SendSteeringHardwareConfigProvider._();

/// A provider for sending the whole motor configuration to the hardware.

final class SendSteeringHardwareConfigProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for sending the whole motor configuration to the hardware.
  SendSteeringHardwareConfigProvider._()
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
    r'62d96745b25217a351728df2cc8ebb21af34af23';

/// A provider for the UI [Offset] for the steering hardware configurator.

@ProviderFor(SteeringHardwareConfiguratorUiOffset)
final steeringHardwareConfiguratorUiOffsetProvider =
    SteeringHardwareConfiguratorUiOffsetProvider._();

/// A provider for the UI [Offset] for the steering hardware configurator.
final class SteeringHardwareConfiguratorUiOffsetProvider
    extends $NotifierProvider<SteeringHardwareConfiguratorUiOffset, Offset> {
  /// A provider for the UI [Offset] for the steering hardware configurator.
  SteeringHardwareConfiguratorUiOffsetProvider._()
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
    final ref = this.ref as $Ref<Offset, Offset>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Offset, Offset>,
              Offset,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
