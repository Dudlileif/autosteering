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

import 'dart:convert';

import 'package:autosteering/src/features/common/common.dart';
import 'package:universal_io/io.dart';

/// A client for receiving NTRIP messages from an NTRIP caster.
class NtripClient {
  /// A client for receiving NTRIP messages from an NTRIP caster.
  const NtripClient._({
    required this.host,
    required this.socket,
    required this.username,
    required this.password,
    required this.port,
    required this.mountPoint,
  });

  /// Attempts to create an [NtripClient], but will only succeed if
  /// [socket] is given or it manages to create and connect to one given
  /// by [host], [port] and [mountPoint].
  static Future<NtripClient?> create({
    required String host,
    required String mountPoint,
    required String username,
    String password = '',
    int port = 2101,
    Socket? connectedSocket,
  }) async {
    final auth = const Base64Encoder().convert('$username:$password'.codeUnits);
    final message = '''
GET /$mountPoint HTTP/1.1\r
User-Agent: NTRIP NTRIPClient/0.1\r
Authorization: Basic $auth\r
Accept: */*\r
Connection: close\r
\r
      ''';
    try {
      final socket = (connectedSocket ?? await Socket.connect(host, port))
        ..add(message.codeUnits);

      return NtripClient._(
        host: host,
        port: port,
        username: username,
        password: password,
        mountPoint: mountPoint,
        socket: socket,
      );
    } catch (error) {
      Logger.instance.e(
        'Failed to connect to NTRIP server $host:$port with message: $message',
        error: error,
      );
      return null;
    }
  }

  /// The host of the NTRIP caster service.
  final String host;

  /// The port for the NTRIP caster service.
  final int port;

  /// The username/email for authenticating with the NTRIP caster service.
  final String username;

  /// The password for authenticating with the NTRIP caster service.
  final String password;

  /// Which mounting point/base station to connect to at the NTRIP caster
  /// service.
  final String mountPoint;

  /// The socket communicating with the NTRIP caster service.
  final Socket socket;
}
