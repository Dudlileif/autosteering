import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';

/// A class for getting info about the device.
class Device {
  /// Whether the program is running in a web browser.
  static bool get isWeb => kIsWeb;

  /// Whether the program is running on a desktop platform.
  static bool get isDesktop =>
      !isWeb && (Platform.isLinux || Platform.isWindows || Platform.isMacOS);

  /// Whether the program is running on a mobile platform.
  static bool get isMobile => !isWeb && (Platform.isAndroid || Platform.isIOS);
}