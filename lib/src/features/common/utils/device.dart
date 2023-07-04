import 'dart:io';

import 'package:flutter/foundation.dart';

/// A class for getting info about the device.
class Device {
  static bool get isWeb => kIsWeb;

  static bool get isDesktop =>
      !isWeb && (Platform.isLinux || Platform.isWindows || Platform.isMacOS);

  static bool get isMobile => !isWeb && (Platform.isAndroid || Platform.isIOS);
}
