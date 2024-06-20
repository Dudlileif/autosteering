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

import 'package:collection/collection.dart';

/// A class for replicating an already recorded log.
class LogReplay {
  /// Creates a [LogReplay] from the [log].
  ///
  /// [log] is split into single lines that are parsed as records, if the
  /// records are split over several lines a different factory must be used
  /// or created.
  ///
  /// [loop] is whehter the log should restart when reaching the end.
  factory LogReplay({required String log, bool loop = false}) {
    DateTime? firstRecordTime;
    final records = const LineSplitter()
        .convert(log)
        .where((element) => element.isNotEmpty && element.contains(':'))
        .mapIndexed((index, raw) {
      final record = LogReplayRecord(
        index: index,
        raw: raw,
        firstRecordTime: firstRecordTime,
      );
      firstRecordTime ??= record.logTime;
      return record;
    }).toList();

    return LogReplay._(log: log, records: records, loop: loop);
  }

  /// Default constructor
  LogReplay._({
    required this.log,
    required this.records,
    this.loop = false,
  });

  /// Whether the replay should loop.
  bool loop;

  /// Raw string of the log.
  final String log;

  /// Parsed list of all the messages, i.e. each line in the [log] with time
  /// stamps.
  final List<LogReplayRecord> records;

  /// Recorded time stamp of the first message in the log.
  DateTime? get startTime => records.firstOrNull?.logTime;

  /// Duration from the first to the last message in the log.
  Duration? get duration => records.lastOrNull?.replayTime;

  /// Scrub the replay to [index] of [records].
  LogReplayRecord? scrubToIndex(int index) {
    if (index >= 0) {
      final record = records[index];
      _ticks = record.replayTime.inMilliseconds;
      _readyRecords
        ..clear()
        ..addAll(records.sublist(index));
      _controller.add(record);
      return record;
    }
    return null;
  }

  late final _readyRecords = [...records];
  Timer? _recordTimer;
  var _ticks = 0;

  /// Stops the timer for replaying the log, i.e. stops the playback.
  void stopTimer() {
    _recordTimer?.cancel();
    _recordTimer = null;
  }

  /// Starts the timer for replaying the log.
  void startTimer() {
    _recordTimer = Timer.periodic(const Duration(milliseconds: 1), _tick);
  }

  Future<void> _tick(Timer timer) async {
    _ticks++;
    final indices = <int>[];
    for (var i = 0; i < _readyRecords.length; i++) {
      if (_readyRecords[i].replayTime.inMilliseconds < _ticks) {
        indices.add(i);
      } else {
        break;
      }
    }
    if (indices.isNotEmpty) {
      _readyRecords
          .getRange(indices.first, indices.last + 1)
          .forEach((record) => _controller.add(record));
      _readyRecords.removeRange(indices.first, indices.last + 1);
    }
    if (_readyRecords.isEmpty) {
      if (loop) {
        _readyRecords.addAll(records);
        stopTimer();
        _ticks = 0;
        _recordTimer = Timer.periodic(const Duration(milliseconds: 1), _tick);
      } else {
        stopTimer();
      }
    }
  }

  late final StreamController<LogReplayRecord> _controller =
      StreamController.broadcast();

  /// A stream replicating the recorded log.
  ///
  /// By listening to this stream the [LogReplayRecord.message] of the [records]
  /// will be dispatched when the listen duration passes the
  /// [LogReplayRecord.replayTime] for the given record.
  Stream<LogReplayRecord> get replay => _controller.stream;
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
  factory LogReplayRecord({
    required int index,
    required String raw,
    DateTime? firstRecordTime,
  }) {
    // Regex for basic ISO 8601 datetime.
    final splits =
        raw.split(RegExp(r'\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d*Z*: '));
    final timeString =
        RegExp(r'\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}.\d*Z*').matchAsPrefix(raw);
    final logTime =
        DateTime.parse(raw.substring(timeString?.start ?? 0, timeString?.end));
    final message = splits.last;
    return LogReplayRecord._(
      index: index,
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
    required this.index,
    required this.raw,
    required this.message,
    required this.logTime,
    required this.replayTime,
  });

  /// The index of this in the log.
  final int index;

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
