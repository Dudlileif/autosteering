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

import 'package:autosteering/src/features/common/common.dart';
import 'package:logger/logger.dart' as implementation;

export 'package:logger/logger.dart' hide Logger;

/// A singleton wrapper for [implementation.Logger] to make it accessible from
/// anywhere in the application.
///
/// The [fileLogger] should be set as soon as possible if a log file should
/// be created on native platforms.
class Logger {
  Logger._internal() : initializeTime = DateTime.now();
  static final Logger _singleton = Logger._internal();

  /// An memory output to hold our logs until a new [fileLogger] with can write
  /// them.
  static final MemoryOutput memoryOutput = MemoryOutput();

  /// The time when the logger was first initialized.
  final DateTime initializeTime;

  final implementation.Logger _consoleLogger =
      implementation.Logger(filter: ProductionFilter(), level: Level.all);

  /// The actual [implementation.Logger] to call for doing the logging.
  implementation.Logger? _fileLogger;

  set fileLogger(implementation.Logger? newLogger) {
    if (Device.isNative && newLogger != null) {
      final messages = memoryOutput.buffer.toList(growable: false);
      memoryOutput.buffer.clear();
      for (final message in messages) {
        newLogger.log(
          message.origin.level,
          message.origin.message,
          time: message.origin.time,
          error: message.origin.error,
          stackTrace: message.origin.stackTrace,
        );
      }
    }
    _fileLogger = newLogger;
  }

  /// The actual [implementation.Logger] to call for doing the logging.
  implementation.Logger? get fileLogger => _fileLogger;

  /// A singleton wrapper for [implementation.Logger] to make it accessible from
  /// anywhere in the application.
  ///
  /// The [fileLogger] should be set as soon as possible if a log file should
  /// be created on native platforms.
  static Logger get instance => _singleton;

  /// Log a message at level [Level.trace].
  void t(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(Level.trace, message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.debug].
  void d(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(Level.debug, message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.info].
  void i(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(Level.info, message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.warning].
  void w(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(
      Level.warning,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log a message at level [Level.error].
  void e(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(Level.error, message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.fatal].
  void f(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log(Level.fatal, message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message with [level].
  void log(
    Level level,
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _consoleLogger.log(
      level,
      message,
      time: time,
      error: error,
      stackTrace: stackTrace,
    );

    if (Device.isNative) {
      (_fileLogger ??
              implementation.Logger(
                printer: SimplePrinter(colors: false, printTime: true),
                output: memoryOutput,
                filter: ProductionFilter(),
                level: Level.all,
              ))
          .log(
        level,
        message,
        time: time,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
