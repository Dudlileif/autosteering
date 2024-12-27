// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'combined_communication_providers.g.dart';

/// A provider for combining the native network providers that need to be
/// watched.
@riverpod
void _combinedNativeNetwork(Ref ref) => ref
  ..watch(hardwareCommunicationConfigProvider)
  ..watch(deviceIPAddressWlanProvider)
  ..watch(deviceIPAddressAPProvider)
  ..watch(deviceIPAddressEthernetProvider)
  ..watch(ntripClientProvider)
  ..watch(tcpServerProvider)
  ..watch(ntripDataUsageSessionProvider)
  ..watch(ntripDataUsageByMonthProvider);

/// A provider for combining the serial providers that need to be watched.
@riverpod
void _combinedSerial(Ref ref) => ref.watch(hardwareSerialStreamProvider);

/// A provider for combining all the network and hardware communication
/// providers that need to be watched.
@riverpod
void combinedCommunication(Ref ref) {
  if (Device.isNative) {
    ref.watch(_combinedNativeNetworkProvider);
  }
  if (Device.supportsSerial) {
    ref.watch(_combinedSerialProvider);
  }
  ref.watch(sendRemoteControlLedStateProvider);
}

/// A provider for whether any hardware is connected and communicating with
/// us.
@riverpod
bool hardwareAlive(Ref ref) {
  ref.watch(remoteControlHardwareNetworkAliveProvider);
  return ref.watch(hardwareSerialAliveProvider) ||
      ref.watch(steeringHardwareNetworkAliveProvider);
}
