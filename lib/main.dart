import 'package:agopengps_flutter/src/app/agopengps.dart';
import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!Device.isWeb) {
    await WakelockPlus.enable();
  }

  if (Device.isDesktop) {
    await windowManager.ensureInitialized();

    await windowManager.waitUntilReadyToShow(const WindowOptions(), () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  if (Device.isWeb) {
    await FastCachedImageConfig.init(subDir: 'AgOpenGPS_flutter/image_cache/');
  }

  runApp(
    const ProviderScope(
      child: AgOpenGps(),
    ),
  );
}
