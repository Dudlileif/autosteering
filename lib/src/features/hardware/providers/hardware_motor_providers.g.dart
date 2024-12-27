// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hardware_motor_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSteeringHardwareConfigHash() =>
    r'6fa4a5d48280ae120133fff6b7ad0130d1ded867';

/// A provider for getting the motor configuration from the hardware.
///
/// Copied from [getSteeringHardwareConfig].
@ProviderFor(getSteeringHardwareConfig)
final getSteeringHardwareConfigProvider = FutureProvider<void>.internal(
  getSteeringHardwareConfig,
  name: r'getSteeringHardwareConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSteeringHardwareConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetSteeringHardwareConfigRef = FutureProviderRef<void>;
String _$updateSteeringHardwareConfigHash() =>
    r'6397d7a756a81a2081aaa49abe875b9637b6c1ed';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// A provider for updating the motor configuration on the hardware with the
/// parameters corresponding to [keyContainer].
///
/// Copied from [updateSteeringHardwareConfig].
@ProviderFor(updateSteeringHardwareConfig)
const updateSteeringHardwareConfigProvider =
    UpdateSteeringHardwareConfigFamily();

/// A provider for updating the motor configuration on the hardware with the
/// parameters corresponding to [keyContainer].
///
/// Copied from [updateSteeringHardwareConfig].
class UpdateSteeringHardwareConfigFamily extends Family<AsyncValue<void>> {
  /// A provider for updating the motor configuration on the hardware with the
  /// parameters corresponding to [keyContainer].
  ///
  /// Copied from [updateSteeringHardwareConfig].
  const UpdateSteeringHardwareConfigFamily();

  /// A provider for updating the motor configuration on the hardware with the
  /// parameters corresponding to [keyContainer].
  ///
  /// Copied from [updateSteeringHardwareConfig].
  UpdateSteeringHardwareConfigProvider call(
    SteeringHardwareConfigKeysContainer keyContainer,
  ) {
    return UpdateSteeringHardwareConfigProvider(
      keyContainer,
    );
  }

  @override
  UpdateSteeringHardwareConfigProvider getProviderOverride(
    covariant UpdateSteeringHardwareConfigProvider provider,
  ) {
    return call(
      provider.keyContainer,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateSteeringHardwareConfigProvider';
}

/// A provider for updating the motor configuration on the hardware with the
/// parameters corresponding to [keyContainer].
///
/// Copied from [updateSteeringHardwareConfig].
class UpdateSteeringHardwareConfigProvider extends FutureProvider<void> {
  /// A provider for updating the motor configuration on the hardware with the
  /// parameters corresponding to [keyContainer].
  ///
  /// Copied from [updateSteeringHardwareConfig].
  UpdateSteeringHardwareConfigProvider(
    SteeringHardwareConfigKeysContainer keyContainer,
  ) : this._internal(
          (ref) => updateSteeringHardwareConfig(
            ref as UpdateSteeringHardwareConfigRef,
            keyContainer,
          ),
          from: updateSteeringHardwareConfigProvider,
          name: r'updateSteeringHardwareConfigProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateSteeringHardwareConfigHash,
          dependencies: UpdateSteeringHardwareConfigFamily._dependencies,
          allTransitiveDependencies:
              UpdateSteeringHardwareConfigFamily._allTransitiveDependencies,
          keyContainer: keyContainer,
        );

  UpdateSteeringHardwareConfigProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.keyContainer,
  }) : super.internal();

  final SteeringHardwareConfigKeysContainer keyContainer;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateSteeringHardwareConfigRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateSteeringHardwareConfigProvider._internal(
        (ref) => create(ref as UpdateSteeringHardwareConfigRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        keyContainer: keyContainer,
      ),
    );
  }

  @override
  FutureProviderElement<void> createElement() {
    return _UpdateSteeringHardwareConfigProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateSteeringHardwareConfigProvider &&
        other.keyContainer == keyContainer;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, keyContainer.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UpdateSteeringHardwareConfigRef on FutureProviderRef<void> {
  /// The parameter `keyContainer` of this provider.
  SteeringHardwareConfigKeysContainer get keyContainer;
}

class _UpdateSteeringHardwareConfigProviderElement
    extends FutureProviderElement<void> with UpdateSteeringHardwareConfigRef {
  _UpdateSteeringHardwareConfigProviderElement(super.provider);

  @override
  SteeringHardwareConfigKeysContainer get keyContainer =>
      (origin as UpdateSteeringHardwareConfigProvider).keyContainer;
}

String _$sendSteeringHardwareConfigHash() =>
    r'5d4163f872056a0781518790e027656e9abb22e8';

/// A provider for sending the whole motor configuration to the hardware.
///
/// Copied from [sendSteeringHardwareConfig].
@ProviderFor(sendSteeringHardwareConfig)
final sendSteeringHardwareConfigProvider = FutureProvider<void>.internal(
  sendSteeringHardwareConfig,
  name: r'sendSteeringHardwareConfigProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sendSteeringHardwareConfigHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SendSteeringHardwareConfigRef = FutureProviderRef<void>;
String _$steeringMotorWasTargetHash() =>
    r'72bfced1cb682b28c99afc2943d54c3d6564dcbd';

/// A provider for the WAS target for the steering motor when using guidance.
///
/// Copied from [SteeringMotorWasTarget].
@ProviderFor(SteeringMotorWasTarget)
final steeringMotorWasTargetProvider =
    NotifierProvider<SteeringMotorWasTarget, int?>.internal(
  SteeringMotorWasTarget.new,
  name: r'steeringMotorWasTargetProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorWasTargetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorWasTarget = Notifier<int?>;
String _$steeringMotorActualRPMHash() =>
    r'fd0c697e905907f448c1a8f2bedd21117c27cc48';

/// A provider for the actual current steering motor rpm when using guidance.
///
/// Copied from [SteeringMotorActualRPM].
@ProviderFor(SteeringMotorActualRPM)
final steeringMotorActualRPMProvider =
    AutoDisposeNotifierProvider<SteeringMotorActualRPM, double?>.internal(
  SteeringMotorActualRPM.new,
  name: r'steeringMotorActualRPMProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorActualRPMHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorActualRPM = AutoDisposeNotifier<double?>;
String _$steeringMotorStatusHash() =>
    r'ffd12cf433fc9fa20a3dd21053adc04a42275c41';

/// A provider for the steering motor is enabled when using guidance.
///
/// Copied from [SteeringMotorStatus].
@ProviderFor(SteeringMotorStatus)
final steeringMotorStatusProvider =
    AutoDisposeNotifierProvider<SteeringMotorStatus, MotorStatus?>.internal(
  SteeringMotorStatus.new,
  name: r'steeringMotorStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorStatus = AutoDisposeNotifier<MotorStatus?>;
String _$steeringMotorCurrentScaleHash() =>
    r'230eeaca47163718a89ca86d5c0dbae430036ab3';

/// A provider for the steering motor Stallguard reading.
///
/// Copied from [SteeringMotorCurrentScale].
@ProviderFor(SteeringMotorCurrentScale)
final steeringMotorCurrentScaleProvider =
    AutoDisposeNotifierProvider<SteeringMotorCurrentScale, int?>.internal(
  SteeringMotorCurrentScale.new,
  name: r'steeringMotorCurrentScaleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorCurrentScaleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorCurrentScale = AutoDisposeNotifier<int?>;
String _$steeringMotorStallguardHash() =>
    r'e31f31120e10956d54b5eb5551e6c3bb0e9b2c52';

/// A provider for the steering motor Stallguard reading.
///
/// Copied from [SteeringMotorStallguard].
@ProviderFor(SteeringMotorStallguard)
final steeringMotorStallguardProvider =
    AutoDisposeNotifierProvider<SteeringMotorStallguard, int?>.internal(
  SteeringMotorStallguard.new,
  name: r'steeringMotorStallguardProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorStallguardHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorStallguard = AutoDisposeNotifier<int?>;
String _$steeringMotorEnableCalibrationHash() =>
    r'bf1927a63cd541f39f26083a5814353d3e6b412a';

/// A provider whether the steering motor should be in calibration mode.
///
/// Copied from [SteeringMotorEnableCalibration].
@ProviderFor(SteeringMotorEnableCalibration)
final steeringMotorEnableCalibrationProvider =
    NotifierProvider<SteeringMotorEnableCalibration, bool>.internal(
  SteeringMotorEnableCalibration.new,
  name: r'steeringMotorEnableCalibrationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorEnableCalibrationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorEnableCalibration = Notifier<bool>;
String _$steeringMotorRotationHash() =>
    r'c9287d0e93e6259bf17cbea3a355e62aa1d22cfb';

/// A provider for the current rotational position of the steering motor.
///
/// Copied from [SteeringMotorRotation].
@ProviderFor(SteeringMotorRotation)
final steeringMotorRotationProvider =
    AutoDisposeNotifierProvider<SteeringMotorRotation, double?>.internal(
  SteeringMotorRotation.new,
  name: r'steeringMotorRotationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorRotationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorRotation = AutoDisposeNotifier<double?>;
String _$steeringMotorTargetRotationHash() =>
    r'f2b6a3763c3413fbafc36be6322c16e425985446';

/// A provider for target rotational position of the steering motor,
/// only used in calibration mode.
///
/// Copied from [SteeringMotorTargetRotation].
@ProviderFor(SteeringMotorTargetRotation)
final steeringMotorTargetRotationProvider =
    AutoDisposeNotifierProvider<SteeringMotorTargetRotation, double?>.internal(
  SteeringMotorTargetRotation.new,
  name: r'steeringMotorTargetRotationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorTargetRotationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorTargetRotation = AutoDisposeNotifier<double?>;
String _$steeringMotorStepsPerWasIncrementMinToCenterHash() =>
    r'a4550c9b069a5d02d0891a2d10f65eaaa9a0b897';

/// A provider for the motor steps per WAS increment between WAS min and center
/// value.
///
/// Copied from [SteeringMotorStepsPerWasIncrementMinToCenter].
@ProviderFor(SteeringMotorStepsPerWasIncrementMinToCenter)
final steeringMotorStepsPerWasIncrementMinToCenterProvider =
    AutoDisposeNotifierProvider<SteeringMotorStepsPerWasIncrementMinToCenter,
        double?>.internal(
  SteeringMotorStepsPerWasIncrementMinToCenter.new,
  name: r'steeringMotorStepsPerWasIncrementMinToCenterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorStepsPerWasIncrementMinToCenterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorStepsPerWasIncrementMinToCenter
    = AutoDisposeNotifier<double?>;
String _$steeringMotorStepsPerWasIncrementCenterToMaxHash() =>
    r'8cfdf066aa195f80b253d076abf91fcde7e64eef';

/// A provider for the motor steps per WAS increment between WAS center and max
/// value.
///
/// Copied from [SteeringMotorStepsPerWasIncrementCenterToMax].
@ProviderFor(SteeringMotorStepsPerWasIncrementCenterToMax)
final steeringMotorStepsPerWasIncrementCenterToMaxProvider =
    AutoDisposeNotifierProvider<SteeringMotorStepsPerWasIncrementCenterToMax,
        double?>.internal(
  SteeringMotorStepsPerWasIncrementCenterToMax.new,
  name: r'steeringMotorStepsPerWasIncrementCenterToMaxProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringMotorStepsPerWasIncrementCenterToMaxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringMotorStepsPerWasIncrementCenterToMax
    = AutoDisposeNotifier<double?>;
String _$steeringHardwareConfiguratorUiOffsetHash() =>
    r'9b7a72885bfa15595da20455e44c1493d6f03a1d';

/// A provider for the UI [Offset] for the steering hardware configurator.
///
/// Copied from [SteeringHardwareConfiguratorUiOffset].
@ProviderFor(SteeringHardwareConfiguratorUiOffset)
final steeringHardwareConfiguratorUiOffsetProvider =
    AutoDisposeNotifierProvider<SteeringHardwareConfiguratorUiOffset,
        Offset>.internal(
  SteeringHardwareConfiguratorUiOffset.new,
  name: r'steeringHardwareConfiguratorUiOffsetProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$steeringHardwareConfiguratorUiOffsetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SteeringHardwareConfiguratorUiOffset = AutoDisposeNotifier<Offset>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
