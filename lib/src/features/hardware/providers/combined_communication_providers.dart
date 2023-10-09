import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
import 'package:agopengps_flutter/src/features/hardware/hardware.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'combined_communication_providers.g.dart';

/// A provider for combining the native network providers that need to be
/// watched.
@riverpod
void _combinedNativeNetwork(_CombinedNativeNetworkRef ref) => ref
  ..watch(hardwareCommunicationConfigProvider)
  ..watch(ntripClientProvider)
  ..watch(tcpServerProvider);

/// A provider for combining the serial providers that need to be watched.
@riverpod
void _combinedSerial(_CombinedSerialRef ref) => ref
  ..watch(hardwareSerialStreamProvider)
  ..watch(imuSerialFrequencyProvider());

/// A provider for combining all the network and hardware communication
/// providers that need to be watched.
@riverpod
void combinedCommunication(CombinedCommunicationRef ref) {
  if (Device.isNative) {
    ref.watch(_combinedNativeNetworkProvider);
  } else if (Device.isWeb) {
    ref.watch(hardwareWebCommunicationConfigProvider);
  }
  if (Device.supportsSerial) {
    ref.watch(_combinedSerialProvider);
  }
  ref.watch(sendMessagesToHardwareProvider);
}

/// A provider for whether any hardware is connected and communicating with
/// us.
@riverpod
bool hardwareAlive(HardwareAliveRef ref) =>
    ref.watch(hardwareSerialAliveProvider) ||
    ref.watch(hardwareNetworkAliveProvider);
