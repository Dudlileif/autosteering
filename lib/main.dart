import 'package:agopengps_flutter/src/app/agopengps.dart';
import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  Logger.instance.i('Application startup initiated...');
  WidgetsFlutterBinding.ensureInitialized();
  if (Device.isNative) {
    await WakelockPlus.enable();
    Logger.instance.i('Wakelock enabled.');
  }

  if (Device.isDesktop) {
    await windowManager.ensureInitialized();
    Logger.instance.i(
      'Desktop window manager initalized, waiting until ready to show window.',
    );

    await windowManager.waitUntilReadyToShow(const WindowOptions(), () async {
      await windowManager.show();
      await windowManager.focus();
    });
    Logger.instance.i('Desktop window showing and in focus.');
  }

  if (Device.isWeb) {
    await FastCachedImageConfig.init(subDir: 'AgOpenGPS_flutter/image_cache/');
    Logger.instance.i('Configured CachedImage directory');
  }

  Logger.instance.i('Precaching shader: assets/shaders/glow.frag');
  await ShaderBuilder.precacheShader('assets/shaders/glow.frag');

  Logger.instance.i('Starting main application...');

  runApp(
    const ProviderScope(
      child: AgOpenGps(),
    ),
  );
}
