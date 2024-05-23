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
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/features/work_session/work_session.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'startup_loading_providers.g.dart';

/// A provider for adding an artificial startup delay on web, as it won't
/// properly load without it.
@riverpod
FutureOr<void> webArtificialStartupDelay(
  WebArtificialStartupDelayRef ref,
) async =>
    await Future.delayed(const Duration(milliseconds: 500));

/// A provider for handling the initial loading of saved user files.
///
/// Returns true whilst loading and false when all files have been loaded.
@riverpod
bool startupLoading(StartupLoadingRef ref) {
// Return on web as there is no files to be read.
  if (Device.isWeb) {
    return ref.watch(lastUsedVehicleProvider) is! AsyncData ||
        ref.watch(webArtificialStartupDelayProvider) is! AsyncData;
  }
  // Native platforms with file directory support.
  else {
    // We are loading until the file directory, the settings file and
    // the last used vehicle is ready.

    if (ref.watch(fileDirectoryProvider) is AsyncData) {
      if (ref.watch(settingsFileProvider) is AsyncData) {
        ref.watch(loggingProvider);

        return [
          ref.watch(savedVehiclesProvider) is! AsyncData,
          ref.watch(savedEquipmentsProvider) is! AsyncData,
          ref.watch(savedEquipmentSetupsProvider) is! AsyncData,
          ref.watch(savedABTrackingsProvider) is! AsyncData,
          ref.watch(savedPathTrackingsProvider) is! AsyncData,
          ref.watch(savedWorkSessionsProvider) is! AsyncData,
          ref.watch(savedFieldsProvider) is! AsyncData,
          ref.watch(lastUsedVehicleProvider) is! AsyncData,
        ].any((element) => element);
      }
    }
  }

  return true;
}
