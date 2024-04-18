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

/// A class for replicating an already recorded log.
class LogReplay {
  /// Creates a [LogReplay] from the [log].
  ///
  /// [log] is split into single lines that are parsed as records, if the
  /// records are split over several lines a different factory must be used
  /// or created.
  factory LogReplay({required String log}) {
    DateTime? firstRecordTime;
    final records = log
        .split('\n')
        .where((element) => element.isNotEmpty && element.contains(':'))
        .map((raw) {
      final record =
          LogReplayRecord(raw: raw, firstRecordTime: firstRecordTime);
      firstRecordTime ??= record.logTime;
      return record;
    }).toList();

    return LogReplay._(log: log, records: records);
  }

  /// Default constructor
  const LogReplay._({required this.log, required this.records});

  /// Raw string of the log.
  final String log;

  /// Parsed list of all the messages, i.e. each line in the [log] with time
  /// stamps.
  final List<LogReplayRecord> records;

  /// Recorded time stamp of the first message in the log.
  DateTime? get startTime => records.firstOrNull?.logTime;

  /// Duration from the first to the last message in the log.
  Duration? get duration => records.lastOrNull?.replayTime;

  /// A stream replicating the recorded log.
  ///
  /// By listening to this stream the [LogReplayRecord.message] of the [records]
  /// will be dispatched when the listen duration passes the
  /// [LogReplayRecord.replayTime] for the given record.
  Stream<String> get replay {
    final readyRecords = [...records];
    late final StreamController<String> controller;
    Timer? recordTimer;
    var ticks = 0;
    void stopTimer() {
      recordTimer?.cancel();
      recordTimer = null;
    }

    Future<void> tick(Timer timer) async {
      ticks++;
      final indices = <int>[];
      for (var i = 0; i < readyRecords.length; i++) {
        if (readyRecords[i].replayTime.inMilliseconds < ticks) {
          indices.add(i);
        } else {
          break;
        }
      }
      if (indices.isNotEmpty) {
        readyRecords
            .getRange(indices.first, indices.last + 1)
            .forEach((record) => controller.add(record.message));
        readyRecords.removeRange(indices.first, indices.last + 1);
      }
      if (readyRecords.isEmpty) {
        stopTimer();
        await controller.close();
      }
    }

    void startTimer() {
      recordTimer = Timer.periodic(const Duration(milliseconds: 1), tick);
    }

    controller = StreamController<String>(
      onListen: startTimer,
      onPause: stopTimer,
      onCancel: stopTimer,
      onResume: startTimer,
    );

    return controller.stream;
  }
}

/// A log record for use with [LogReplay].
///
/// The record has timing information about the [logTime] it was originally
/// logged, the [replayTime] which is the [Duration] from the first record in
/// the log and this record. The [message] is what was logged and [raw] is the
/// whole raw string line in the log.
class LogReplayRecord {
  /// Creates a [LogReplayRecord] from the [raw] string.
  ///
  /// If [firstRecordTime] is given, the [replayTime] will be calculated from
  /// the difference to that from the parsed [logTime].
  factory LogReplayRecord({required String raw, DateTime? firstRecordTime}) {
    final splits = raw.split(': ');
    final logTime = DateTime.parse(splits.first);
    final message = splits.last;
    return LogReplayRecord._(
      raw: raw,
      message: message,
      logTime: logTime,
      replayTime: firstRecordTime != null
          ? logTime.difference(firstRecordTime)
          : Duration.zero,
    );
  }

  /// Default constructor
  const LogReplayRecord._({
    required this.raw,
    required this.message,
    required this.logTime,
    required this.replayTime,
  });

  /// Raw string line of this.
  final String raw;

  /// Message part of the log record.
  final String message;

  /// The time this record was originally logged.
  final DateTime logTime;

  /// How far into the log this record was logged.
  ///
  /// The [Duration] from the first logged record and this [logTime].
  final Duration replayTime;
}
