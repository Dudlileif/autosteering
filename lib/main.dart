import 'package:agopengps_flutter/src/app/agopengps.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FastCachedImageConfig.init(subDir: 'AgOpenGPS_flutter/image_cache/');

  runApp(
    const ProviderScope(
      child: AgOpenGps(),
    ),
  );
}
