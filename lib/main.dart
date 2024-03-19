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

import 'dart:async';

import 'package:autosteering/src/app/autosteering.dart';
import 'package:autosteering/src/features/common/common.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  if (Device.isMobile) {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    await SystemChrome.setSystemUIChangeCallback(
        (systemOverlaysAreVisible) async {
      if (systemOverlaysAreVisible) {
        Timer(const Duration(milliseconds: 1500), () async {
          await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
        });
      }
    });
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
    await FastCachedImageConfig.init(subDir: 'autosteering/image_cache/');
    Logger.instance.i('Configured CachedImage directory');
  }

  Logger.instance.i('Precaching shader: assets/shaders/glow.frag');
  await ShaderBuilder.precacheShader('assets/shaders/glow.frag');

  Logger.instance.i('Starting main application...');

  runApp(
    const ProviderScope(
      child: Autosteering(),
    ),
  );

  LicenseRegistry.addLicense(() async* {
    yield const LicenseEntryWithLineBreaks(['autosteering'], '''
Copyright (C) 2024 Gaute Hagen

Autosteering is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Autosteering is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Autosteering. If not, see https://www.gnu.org/licenses/.
''');
  });
}
