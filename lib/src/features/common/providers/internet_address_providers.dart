import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'internet_address_providers.g.dart';

/// A provider for figuring out whether an internet [address] is valid, i.e.
/// has a reachable IP address attached to it.
@riverpod
Future<bool> validInternetAddress(
  ValidInternetAddressRef ref,
  String? address,
) async {
  if (address == null) {
    return false;
  }
  try {
    return (await InternetAddress.lookup(address)).isNotEmpty;
  } catch (error, _stackTrace) {
    // Logger.instance.i(
    //   'No IP address found when looking up: $address',
    //   error: error,
    //   stackTrace: stackTrace,
    // );
  }
  return false;
}
