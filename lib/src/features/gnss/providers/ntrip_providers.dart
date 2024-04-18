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
import 'dart:convert';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:nmea/nmea.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'ntrip_providers.g.dart';

/// A provider for whether the [ntripClient] provider should run.
@Riverpod(keepAlive: true)
class NtripEnabled extends _$NtripEnabled {
  @override
  bool build() {
    const initValue = true;
    ref.listenSelf((previous, next) {
      if (next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.ntripEnabled, next);
      }
      if (!next) {
        ref.invalidate(ntripAliveProvider);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.ntripEnabled) ??
        initValue;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Inverts the [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for the NTRIP caster host address.
@Riverpod(keepAlive: true)
class NtripHost extends _$NtripHost {
  @override
  String? build() {
    ref.listenSelf((previous, next) {
      if (next != previous) {
        ref.read(settingsProvider.notifier).update(SettingsKey.ntripHost, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getString(SettingsKey.ntripHost) ??
        'rtk2go.com';
  }

  /// Updates [state] to [value].
  void update(String? value) => Future(() => state = value);
}

/// A provider for the NTRIP caster port.
@Riverpod(keepAlive: true)
class NtripPort extends _$NtripPort {
  @override
  int build() {
    ref.listenSelf((previous, next) {
      if (next != previous) {
        ref.read(settingsProvider.notifier).update(SettingsKey.ntripPort, next);
      }
    });

    return ref.read(settingsProvider.notifier).getInt(SettingsKey.ntripPort) ??
        2101;
  }

  /// Updates [state] to [value].

  void update(int value) => Future(() => state = value);

  /// Update the [state] to [value] if it's a valid integer.
  void updateFromString(String value) => Future(() {
        final port = int.tryParse(value);
        if (port != null) {
          if (port >= 1000 && port <= 65535) {
            state = port;
          }
        }
      });
}

/// A provider for the NTRIP caster mounting point.
@Riverpod(keepAlive: true)
class ActiveNtripMountPoint extends _$ActiveNtripMountPoint {
  @override
  String? build() {
    ref.listenSelf((previous, next) {
      if (next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.ntripMountPoint, next);
      }
    });

    return ref
        .read(settingsProvider.notifier)
        .getString(SettingsKey.ntripMountPoint);
  }

  /// Updates [state] to [value].

  void update(String? value) => Future(() => state = value);
}

/// A provider for the NTRIP caster username (email).
@Riverpod(keepAlive: true)
class NtripUsername extends _$NtripUsername {
  @override
  String? build() {
    ref.listenSelf((previous, next) {
      if (next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.ntripUsername, next);
      }
    });

    return ref
        .read(settingsProvider.notifier)
        .getString(SettingsKey.ntripUsername);
  }

  /// Updates [state] to [value].

  void update(String? value) => Future(() => state = value);
}

/// A provider for the NTRIP caster password.
@Riverpod(keepAlive: true)
class NtripPassword extends _$NtripPassword {
  @override
  String? build() {
    ref.listenSelf((previous, next) {
      if (next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.ntripPassword, next);
      }
    });

    return ref
        .read(settingsProvider.notifier)
        .getString(SettingsKey.ntripPassword);
  }

  /// Updates [state] to [value].

  void update(String? value) => Future(() => state = value);
}

/// A provider for the period between sending [GGASentence]s to the caster.
@Riverpod(keepAlive: true)
class NtripGGASendingInterval extends _$NtripGGASendingInterval {
  @override
  int? build() {
    ref.listenSelf((previous, next) {
      if (next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.ntripGGASendingInterval, next);
      }
    });

    return ref
        .read(settingsProvider.notifier)
        .getInt(SettingsKey.ntripGGASendingInterval);
  }

  /// Updates [state] to [value].
  void update(int? value) => Future(() => state = value);
}

/// A provider for the NTRIP data usage in bytes for this session.
@Riverpod(keepAlive: true)
class NtripDataUsageSession extends _$NtripDataUsageSession {
  @override
  int? build() {
    return null;
  }

  /// Updates [state] to [value].
  void update(int? value) => Future(() => state = value);

  /// Updates [state] by [value].
  void updateBy(int value) => Future(() {
        if (Device.isNative) {
          ref.read(ntripDataUsageByMonthProvider.notifier).updateBy(
                date: DateTime.now(),
                value: value,
              );
        }

        return state = (state ?? 0) + value;
      });
}

/// A provider for telling whether the [ntripClient] is receiving data.
///
/// If not set to true in the last 5 seconds, it will invalidate itself and the
/// [ntripClient].
@Riverpod(keepAlive: true)
class NtripAlive extends _$NtripAlive {
  Timer? _resetTimer;

  @override
  bool build() {
    ref
      ..listenSelf((previous, next) {
        if (next) {
          _resetTimer?.cancel();
          _resetTimer = Timer(
            const Duration(seconds: 5),
            () {
              Logger.instance.i('NTRIP client disconnected, timed out.');
              ref.invalidateSelf();
            },
          );
        }
      })
      ..onDispose(() {
        _resetTimer?.cancel();
        ref.invalidate(ntripClientProvider);
      });

    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for creating and listening to an [NtripClient].
///
/// The received NTRIP messages will be split into parts and sent to the
/// connected [HardwareSerial] if connected or the [TcpServer].
@Riverpod(keepAlive: true)
FutureOr<NtripClient?> ntripClient(NtripClientRef ref) async {
  Timer? ggaSendingTimer;

  if (!ref.watch(ntripEnabledProvider)) {
    return null;
  }

  GGASentence? createGGASentence() {
    final position = ref.read(
      mainVehicleProvider.select((value) => value.position),
    );
    final currentSentence = ref.read(gnssCurrentSentenceProvider);
    GGASentence? ggaSentence;

    if (currentSentence is GGASentence) {
      if (currentSentence.source == 'GP') {
        ggaSentence = currentSentence;
      }
    }
    return ggaSentence ??
        GGASentence.create(
          latitude: position.lat,
          longitude: position.lon,
          numSatellites: currentSentence?.numSatellites,
          altitudeMSL: currentSentence?.altitudeMSL,
          quality: currentSentence?.fixQuality,
          hdop: currentSentence?.hdop ?? 99.99,
          ageOfDifferentialData: currentSentence?.ageOfDifferentialData,
          time: currentSentence?.utc,
          geodialSeparation: currentSentence?.geoidSeparation,
          source: currentSentence is TalkerSentence
              ? (currentSentence! as TalkerSentence).source
              : null,
        );
  }

  ref
    ..onDispose(() {
      Logger.instance.i('NTRIP client disconnected.');
      ggaSendingTimer?.cancel();
    })
    ..listenSelf((previous, next) {
      next.when(
        data: (client) {
          if (client != null) {
            Logger.instance.i(
              '''NTRIP client connecting to ${client.host}:${client.port} asking for station ${client.mountPoint}.''',
            );

            bool sendGGA() {
              final ggaSentence = createGGASentence();
              if (ggaSentence != null) {
                final data = ggaSentence.raw.codeUnits;
                client.socket.add(data);
                ref
                    .read(ntripDataUsageSessionProvider.notifier)
                    .updateBy(data.length);
                return true;
              } else {
                Logger.instance.w('Failed to create GGA sentence.');

                return false;
              }
            }

            if (client.ggaSendingInterval != null &&
                client.ggaSendingInterval! >= 1 &&
                ggaSendingTimer == null) {
              if (sendGGA()) {
                Logger.instance.i('Sent GGA sentence to the NTRIP caster');
              }
            }

            client.socket.listen((event) {
              ref.read(ntripAliveProvider.notifier).update(value: true);

              ref
                  .read(ntripDataUsageSessionProvider.notifier)
                  .updateBy(event.lengthInBytes);

              if (ref.read(hardwareSerialProvider) != null) {
                ref.read(hardwareSerialProvider.notifier).write(event);
              } else {
                ref.read(tcpServerProvider.notifier).send(event);
              }
              if (event.length == 12) {
                //If message is 'ICY 200 OK', we have a confirmed connection.
                if (String.fromCharCodes(event).contains('ICY 200 OK')) {
                  Logger.instance.i('NTRIP client connection confirmed.');
                }
              }
              final dataString = String.fromCharCodes(event);
              if (dataString.contains('SOURCETABLE 200 OK') ||
                  dataString.contains('ENDSOURCETABLE')) {
                ref.read(ntripEnabledProvider.notifier).update(value: false);
                Logger.instance.i(
                  '''NTRIP mount point was not found, but a caster sourcetable was.''',
                );
                ref
                  ..invalidate(ntripSourcetableProvider)
                  ..invalidateSelf();
              }
              if (client.ggaSendingInterval != null &&
                  client.ggaSendingInterval! >= 1 &&
                  ggaSendingTimer == null) {
                Logger.instance.i(
                  '''Starting to send NMEA GGA messages every: ${client.ggaSendingInterval} seconds.''',
                );
                ggaSendingTimer = Timer.periodic(
                  Duration(seconds: client.ggaSendingInterval!),
                  (timer) => sendGGA(),
                );
              }
            });
            ref.onDispose(() {
              client.socket.destroy();
              Logger.instance.i('NTRIP client closed.');
              ggaSendingTimer?.cancel();
            });
          }
        },
        error: (error, stackTrace) => Logger.instance.e(
          'Failed to create NTRIP client.',
          error: error,
          stackTrace: stackTrace,
        ),
        loading: () {},
      );
    });

  final host = ref.watch(ntripHostProvider);
  final port = ref.watch(ntripPortProvider);
  final username = ref.watch(ntripUsernameProvider);
  final password = ref.watch(ntripPasswordProvider) ?? '';
  final mountPoint = ref.watch(activeNtripMountPointProvider);
  final ggaSendingInterval = ref.watch(ntripGGASendingIntervalProvider);

  if (host != null && username != null && mountPoint != null) {
    return NtripClient.create(
      host: host,
      port: port,
      password: password,
      mountPoint: mountPoint,
      username: username,
      ggaSendingInterval: ggaSendingInterval,
    );
  }
  return null;
}

/// A provider for the NTRIP caster sourcetable for the currently selected
/// NTRIP caster server.
@riverpod
FutureOr<Iterable<NtripMountPoint>?> ntripSourcetable(
  NtripSourcetableRef ref,
) async {
  ref.onDispose(() {
    Logger.instance.i('NTRIP caster sourcetable cleared.');
  });

  final host = ref.read(ntripHostProvider);
  final port = ref.read(ntripPortProvider);
  final username = ref.read(ntripUsernameProvider);
  final password = ref.read(ntripPasswordProvider);
  if (host != null) {
    try {
      final auth =
          const Base64Encoder().convert('$username:$password'.codeUnits);
      final message = '''
GET / HTTP/1.1\r
User-Agent: NTRIP NTRIPClient/0.1\r
Accept: */*\r
Authorization: Basic $auth\r
Connection: close\r
\r
''';

      Logger.instance
          .i('Attempting to get NTRIP sourcetable from: $host:$port.');

      final socket = await Socket.connect(host, port);
      socket.add(message.codeUnits);

      final lines =
          (await socket.toList()).map(String.fromCharCodes).join().split('\n');

      Logger.instance.i('NTRIP sourcetable found with ${lines.length} lines.');

      final table = lines.map(NtripSourcetableEntry.fromString);

      return table.whereType<NtripMountPoint>();
    } catch (error, stackTrace) {
      Logger.instance.i(
        '''Failed getting the sourcetable for NTRIP caster server: $host:$port.''',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  return null;
}

/// A provider for sorting the [ntripSourcetable] by their distance to
/// [MainVehicle].
@riverpod
FutureOr<Map<NtripMountPointStream, double?>?> ntripMountPointsSorted(
  NtripMountPointsSortedRef ref,
) async {
  final sourcetable = await ref.watch(ntripSourcetableProvider.future);

  final position =
      ref.read(mainVehicleProvider.select((value) => value.position));
  final sorted = sourcetable?.whereType<NtripMountPointStream>().toList()
    ?..sortByCompare(
      (element) => element.distanceToPoint(position) ?? double.infinity,
      (a, b) => a.compareTo(b),
    );

  if (sorted != null) {
    final closestDistance = sorted.first.distanceToPoint(position);
    Logger.instance.i(
      '''NTRIP sourcetable sorted with ${sorted.length} entries, where ${sorted.first.name}, ${sorted.first.country} - ${closestDistance != null ? '${(closestDistance / 1000).toStringAsFixed(1)} km' : 'unknown position'} was closest.''',
    );

    return Map.fromIterables(
      sorted,
      sorted.map((e) => e.distanceToPoint(position)),
    );
  }
  return null;
}

/// A provider for a map of all recorded months with their corresponding
/// data usage.
@Riverpod(keepAlive: true)
class NtripDataUsageByMonth extends _$NtripDataUsageByMonth {
  @override
  Map<String, int> build() {
    final path = ref.watch(fileDirectoryProvider).requireValue.path;
    final file = File('$path/data_usage_ntrip.json');
    if (!file.existsSync()) {
      file.createSync(recursive: true);
      Logger.instance.log(
        Level.info,
        'Created data usage file: ${file.path}',
      );
    } else {
      Logger.instance.log(
        Level.info,
        'Found data usage file: ${file.path}\n${file.readAsStringSync()}',
      );
    }
    ref.listenSelf((previous, next) {
      if (!file.existsSync()) {
        file.createSync(recursive: true);
        Logger.instance.log(
          Level.info,
          'Created data usage file not found, new created: ${file.path}',
        );
      }
      file.writeAsString(const JsonEncoder.withIndent('    ').convert(next));
    });

    final fileContent = file.readAsStringSync();
    if (fileContent.isNotEmpty) {
      final data = jsonDecode(fileContent);

      if (data is Map) {
        return Map<String, int>.from(data);
      }
    }

    return {};
  }

  /// Updates [state] to [value].

  void update(Map<String, int> value) => Future(() => state = value);

  /// Updates [state] field from [date] by [value].
  void updateBy({required DateTime date, required int value}) => Future(
        () => state = Map.from(state)
          ..update(
            date.toIso8601String().substring(0, 7),
            (old) => old + value,
            ifAbsent: () => value,
          ),
      );

  @override
  bool updateShouldNotify(Map<String, int> previous, Map<String, int> next) {
    final equal = const DeepCollectionEquality().equals(previous, next);
    return !equal;
  }
}
