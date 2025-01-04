@TestOn('vm')
library;

import 'dart:io';

import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as path;


void main() async {
  final file = File(
    path.join(
      Directory.current.path,
      'test',
      'features',
      'simulator',
      'models',
      'log',
      'testing_log',
    ),
  );

  final logReplay = LogReplay(log: await file.readAsString());

  test(
    'Start time',
    () => expect(
      logReplay.startTime,
      DateTime(2024, 2, 22, 15, 38, 9, 378, 866),
    ),
  );

  //   34.882 197
  // - 09.378 866
  // = 25.503 331
  test(
    'Duration',
    () => expect(
      logReplay.duration,
      const Duration(
        seconds: 25,
        milliseconds: 503,
        microseconds: 331,
      ),
    ),
  );

  test(
    'Number of records',
    () => expect(
      logReplay.records.length,
      3010,
    ),
  );

  test('Check that all records are sent', () async {
    var count = 0;
    final subscription = logReplay.replay.listen((event) {
      count++;
    });
    await subscription.asFuture<String>('');
    await subscription.cancel();
    expect(count, 3010);
  });

  test(
    'Pausing and resuming',
    () async {
      var count = 0;
      final subscription = logReplay.replay.listen((event) {
        count++;
      });
      await Future<void>.delayed(
        const Duration(seconds: 5),
        subscription.pause,
      );
      await Future<void>.delayed(
        const Duration(seconds: 5),
        subscription.resume,
      );

      await subscription.asFuture<String>('');
      await subscription.cancel();
      expect(count, 3010);
    },
    timeout: const Timeout(Duration(seconds: 40)),
  );
}
