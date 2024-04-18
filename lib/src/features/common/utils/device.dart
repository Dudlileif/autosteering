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

import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';

/// A class for getting info about the device.
class Device {
  /// Whether the program is running in a web browser.
  static bool get isWeb => kIsWeb;

  /// Whether the program is running on a native platform.
  static bool get isNative => !kIsWeb;

  /// Whether the program is running on a desktop platform.
  static bool get isDesktop =>
      !isWeb && (Platform.isLinux || Platform.isWindows || Platform.isMacOS);

  /// Whether the program is running on a mobile platform.
  static bool get isMobile => !isWeb && (Platform.isAndroid || Platform.isIOS);

  /// Whether the device supports serial communication.
  static bool get supportsSerial => isDesktop; // || Platform.isAndroid;
  // TODO(dudlileif): update Android implementation to usb_serial package
}
