// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internet_address_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for figuring out whether an internet [address] is valid, i.e.
/// has a reachable IP address attached to it.

@ProviderFor(validInternetAddress)
const validInternetAddressProvider = ValidInternetAddressFamily._();

/// A provider for figuring out whether an internet [address] is valid, i.e.
/// has a reachable IP address attached to it.

final class ValidInternetAddressProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// A provider for figuring out whether an internet [address] is valid, i.e.
  /// has a reachable IP address attached to it.
  const ValidInternetAddressProvider._({
    required ValidInternetAddressFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'validInternetAddressProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$validInternetAddressHash();

  @override
  String toString() {
    return r'validInternetAddressProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as String?;
    return validInternetAddress(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ValidInternetAddressProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$validInternetAddressHash() =>
    r'cb0d71484ee45f0396cacb74b13b31a34757645b';

/// A provider for figuring out whether an internet [address] is valid, i.e.
/// has a reachable IP address attached to it.

final class ValidInternetAddressFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, String?> {
  const ValidInternetAddressFamily._()
    : super(
        retry: null,
        name: r'validInternetAddressProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for figuring out whether an internet [address] is valid, i.e.
  /// has a reachable IP address attached to it.

  ValidInternetAddressProvider call(String? address) =>
      ValidInternetAddressProvider._(argument: address, from: this);

  @override
  String toString() => r'validInternetAddressProvider';
}
