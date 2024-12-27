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

import 'dart:isolate';

import 'package:archive/archive_io.dart';
import 'package:async/async.dart';
import 'package:universal_io/io.dart';

/// A class with methods for handling some file directory operations.
class FileHandler {
  /// Exports the directory at [dirPath] to the ZIP file at [exportPath].
  ///
  /// The stream events are the progress of the export.
  static Stream<double> exportFileDirectory({
    required String dirPath,
    required String exportPath,
  }) async* {
    Future<void> worker(SendPort sendPort) async {
      await ZipFileEncoder().zipDirectory(
        Directory(dirPath),
        filename: exportPath,
        onProgress: sendPort.send,
      );

      sendPort.send(null);
      Isolate.exit();
    }

    final receivePort = ReceivePort('Receive export progress for $exportPath');

    await Isolate.spawn(
      worker,
      receivePort.sendPort,
      debugName: 'Exporter for $exportPath',
    );

    final queue = StreamQueue<dynamic>(receivePort);

    while (true) {
      final message = await queue.next;
      if (message is double) {
        yield message;
      } else {
        break;
      }
    }
  }
}
