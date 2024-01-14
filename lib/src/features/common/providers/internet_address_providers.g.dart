// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internet_address_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$validInternetAddressHash() =>
    r'0e194aceee4198f4f1dab06a472d8b067891d372';

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

/// A provider for figuring out whether an internet [address] is valid, i.e.
/// has a reachable IP address attached to it.
///
/// Copied from [validInternetAddress].
@ProviderFor(validInternetAddress)
const validInternetAddressProvider = ValidInternetAddressFamily();

/// A provider for figuring out whether an internet [address] is valid, i.e.
/// has a reachable IP address attached to it.
///
/// Copied from [validInternetAddress].
class ValidInternetAddressFamily extends Family {
  /// A provider for figuring out whether an internet [address] is valid, i.e.
  /// has a reachable IP address attached to it.
  ///
  /// Copied from [validInternetAddress].
  const ValidInternetAddressFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'validInternetAddressProvider';

  /// A provider for figuring out whether an internet [address] is valid, i.e.
  /// has a reachable IP address attached to it.
  ///
  /// Copied from [validInternetAddress].
  ValidInternetAddressProvider call(
    String? address,
  ) {
    return ValidInternetAddressProvider(
      address,
    );
  }

  @visibleForOverriding
  @override
  ValidInternetAddressProvider getProviderOverride(
    covariant ValidInternetAddressProvider provider,
  ) {
    return call(
      provider.address,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      FutureOr<bool> Function(ValidInternetAddressRef ref) create) {
    return _$ValidInternetAddressFamilyOverride(this, create);
  }
}

class _$ValidInternetAddressFamilyOverride implements FamilyOverride {
  _$ValidInternetAddressFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<bool> Function(ValidInternetAddressRef ref) create;

  @override
  final ValidInternetAddressFamily overriddenFamily;

  @override
  ValidInternetAddressProvider getProviderOverride(
    covariant ValidInternetAddressProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for figuring out whether an internet [address] is valid, i.e.
/// has a reachable IP address attached to it.
///
/// Copied from [validInternetAddress].
class ValidInternetAddressProvider extends AutoDisposeFutureProvider<bool> {
  /// A provider for figuring out whether an internet [address] is valid, i.e.
  /// has a reachable IP address attached to it.
  ///
  /// Copied from [validInternetAddress].
  ValidInternetAddressProvider(
    String? address,
  ) : this._internal(
          (ref) => validInternetAddress(
            ref as ValidInternetAddressRef,
            address,
          ),
          from: validInternetAddressProvider,
          name: r'validInternetAddressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$validInternetAddressHash,
          dependencies: ValidInternetAddressFamily._dependencies,
          allTransitiveDependencies:
              ValidInternetAddressFamily._allTransitiveDependencies,
          address: address,
        );

  ValidInternetAddressProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.address,
  }) : super.internal();

  final String? address;

  @override
  Override overrideWith(
    FutureOr<bool> Function(ValidInternetAddressRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ValidInternetAddressProvider._internal(
        (ref) => create(ref as ValidInternetAddressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        address: address,
      ),
    );
  }

  @override
  (String?,) get argument {
    return (address,);
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ValidInternetAddressProviderElement(this);
  }

  ValidInternetAddressProvider _copyWith(
    FutureOr<bool> Function(ValidInternetAddressRef ref) create,
  ) {
    return ValidInternetAddressProvider._internal(
      (ref) => create(ref as ValidInternetAddressRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      address: address,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ValidInternetAddressProvider && other.address == address;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ValidInternetAddressRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `address` of this provider.
  String? get address;
}

class _ValidInternetAddressProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with ValidInternetAddressRef {
  _ValidInternetAddressProviderElement(super.provider);

  @override
  String? get address => (origin as ValidInternetAddressProvider).address;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
