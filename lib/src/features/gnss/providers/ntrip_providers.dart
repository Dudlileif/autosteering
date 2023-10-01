import 'dart:async';
import 'dart:typed_data';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
import 'package:agopengps_flutter/src/features/network/network.dart';
import 'package:agopengps_flutter/src/features/settings/settings.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
        '3.143.243.81';
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
class NtripMountPoint extends _$NtripMountPoint {
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

/// A provider for telling whether the [ntripClient] is receiving data.
///
/// If not set to true in the last 5 seconds, it will invalidate itself and
/// restart as false.
@Riverpod(keepAlive: true)
class NtripAlive extends _$NtripAlive {
  Timer? _resetTimer;

  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (next) {
        _resetTimer?.cancel();
        _resetTimer = Timer(
          const Duration(seconds: 5),
          () => ref.invalidateSelf(),
        );
      } else {
        Logger.instance.i('NTRIP client disconnected.');
      }
    });

    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for creating and listening to an [NtripClient].
///
/// The receives NTRIP messages will be sent to the simulation core
/// to be sent to the hardware.
@Riverpod(keepAlive: true)
Future<NtripClient?> ntripClient(NtripClientRef ref) async {
  if (!ref.watch(ntripEnabledProvider)) {
    return null;
  }

  ref.listenSelf((previous, next) {
    next.when(
      data: (data) {
        if (data != null) {
          Logger.instance.i(
            '''NTRIP client connecting to ${data.host}:${data.port} asking for station ${data.mountPoint}.''',
          );
          data.socket.listen((event) {
            ref.read(ntripAliveProvider.notifier).update(value: true);

            // Only forward messages that start with 0xD3 = 211 which RTCM start
            // swith.
            if (event.first == 0xD3) {
              // ref.read(tcpServerProvider.notifier).send(event);

              // The messages can be bunched up, so we split them up to send
              // them separatley to the receiver.
              final indices = <int>[];
              final types = <int>[];
              final lengths = <int>[];
              final messages = <Uint8List>[];
              var i = 0;
              while (i < event.length) {
                if (event[i] == 0xD3) {
                  indices.add(i);
                  final type = (event[i + 3] << 4) + (event[i + 4] >> 4);
                  types.add(type);
                  final length =
                      ((event[i + 1] & 3) << 8) + (event[i + 2] << 0) + 6;
                  lengths.add(length);
                  messages.add(
                    Uint8List.fromList(
                      event.getRange(i, i + length).toList(),
                    ),
                  );
                  i += length;
                } else {
                  i++;
                }
              }

              for (final message in messages) {
                ref.read(tcpServerProvider.notifier).send(message);
                ref.read(gnssSerialProvider)?.write(message);
              }
            }
            //If message is 'ICY 200 OK', we have a confirmed connection.
            else if (String.fromCharCodes(event) == 'ICY 200 OK\r\n') {
              Logger.instance.i('NTRIP client connection confirmed.');
            } else {
              Logger.instance.w(
                '''Unknown NTRIP message: $event -> ${String.fromCharCodes(event)}''',
              );
            }
          });
          ref.onDispose(() {
            data.socket.destroy();
            Logger.instance.i('NTRIP client closed.');
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
  final mountPoint = ref.watch(ntripMountPointProvider);

  if (host != null && username != null && mountPoint != null) {
    return NtripClient.create(
      host: host,
      port: port,
      password: password,
      mountPoint: mountPoint,
      username: username,
    );
  }
  return null;
}

/// A provider for the quality of last GNSS position update.
@riverpod
class GnssCurrentFixQuality extends _$GnssCurrentFixQuality {
  Timer? _resetTimer;
  // DateTime? _prev;
  @override
  GnssFixQuality build() {
    ref.listenSelf((previous, next) {
      // final now = DateTime.now();
      // if (_prev != null) {
      //   print(now.difference(_prev!).inMicroseconds);
      // }
      // _prev = now;
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        () => ref.invalidateSelf(),
      );
      if (previous != next) {
        Logger.instance
            .i('GPS fix quality: ${next.name}, NMEA code: ${next.nmeaValue}');
      }
    });

    return GnssFixQuality.notAvailable;
  }

  /// Updates [state] to [value].
  void update(GnssFixQuality value) => Future(() => state = value);

  /// Updates [state] to the [GnssFixQuality] that corresponds to [index].
  void updateByIndex(int index) => Future(
        () => state = GnssFixQuality.values.elementAtOrNull(index) ?? state,
      );
}

/// A provider for the quality of last GNSS position update.
@riverpod
class GnssCurrentNumSatellites extends _$GnssCurrentNumSatellites {
  Timer? _resetTimer;

  @override
  int? build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        ref.invalidateSelf,
      );
      if (previous != next) {
        Logger.instance.i('GPS satellite count: $next');
      }
    });

    return null;
  }

  /// Updates [state] to [value].
  void update(int? value) => Future(() => state = value);
}
