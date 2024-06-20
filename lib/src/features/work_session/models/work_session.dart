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

import 'dart:collection';
import 'dart:convert';

import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:uuid/uuid.dart';

/// A class that contains objects used in and info about a work session.
class WorkSession {
  /// A class that contains objects used in and info about a work session.
  WorkSession({
    this.field,
    this.vehicle,
    this.equipmentSetup,
    List<ABTracking>? abTracking,
    List<PathTracking>? pathTracking,
    this.name,
    this.note,
    this.start,
    this.end,
    Map<String, List<EquipmentLogRecord>>? equipmentLogs,
    String? uuid,
  })  : abTracking = abTracking ?? [],
        pathTracking = pathTracking ?? [],
        equipmentLogs = equipmentLogs ?? {},
        uuid = uuid ?? const Uuid().v4();

  /// Creates a work session object from the [json] object.
  factory WorkSession.fromJson(Map<String, dynamic> json) {
    final field = json['field'] != null
        ? Field.fromJson(Map<String, dynamic>.from(json['field'] as Map))
        : null;

    final vehicle = json['vehicle'] != null
        ? Vehicle.fromJson(Map<String, dynamic>.from(json['vehicle'] as Map))
        : null;

    final equipmentSetup = json['equipment_setup'] != null
        ? EquipmentSetup.fromJson(
            Map<String, dynamic>.from(json['equipment_setup'] as Map),
          )
        : null;

    final abTracking = json['ab_tracking'] != null
        ? List<Map<String, dynamic>>.from(json['ab_tracking'] as List)
            .map(ABTracking.fromJson)
            .toList()
        : <ABTracking>[];

    final pathTracking = json['path_tracking'] != null
        ? List<Map<String, dynamic>>.from(json['path_tracking'] as List)
            .map(PathTracking.fromJson)
            .toList()
        : <PathTracking>[];

    final info = Map<String, dynamic>.from(json['info'] as Map);

    final name = info['name'] as String?;
    final note = info['note'] as String?;
    final uuid = info['uuid'] as String?;

    final time = Map<String, dynamic>.from(json['time'] as Map);

    final start = time['start'] != null
        ? DateTime.tryParse(time['start'] as String)
        : null;
    final end =
        time['end'] != null ? DateTime.tryParse(time['end'] as String) : null;

    final equipmentLogs = json['equipment_logs'] != null
        ? Map<String, dynamic>.from(
            json['equipment_logs'] as Map,
          ).map(
            (uuid, log) => MapEntry(
              uuid,
              List<String>.from(log as List)
                  .map(
                    (line) => EquipmentLogRecord.fromJson(
                      Map<String, dynamic>.from(jsonDecode(line) as Map),
                    ),
                  )
                  .toList(),
            ),
          )
        : null;

    return WorkSession(
      field: field,
      vehicle: vehicle,
      equipmentSetup: equipmentSetup,
      abTracking: abTracking,
      pathTracking: pathTracking,
      name: name,
      note: note,
      uuid: uuid,
      start: start,
      end: end,
      equipmentLogs: equipmentLogs,
    );
  }

  /// The field this work session was on.
  Field? field;

  /// The [Vehicle] used for this session.
  Vehicle? vehicle;

  /// The [EquipmentSetup] (chain) used for this session.
  EquipmentSetup? equipmentSetup;

  /// The [ABTracking]s used in this work session.
  List<ABTracking> abTracking = [];

  /// The [PathTracking]s used in this work session.
  List<PathTracking> pathTracking = [];

  /// A name for the work session.
  String? name;

  /// A unique identifier for this.
  final String uuid;

  /// A note for adding some info about the work, e.g. type of work done,
  /// species, application rate etc...
  String? note;

  /// The starting time of the working session.
  DateTime? start;

  /// The ending time of the working session.
  DateTime? end;

  /// The duration for the session from [start] to [end]. If the [end] time is
  /// not set, then the duration is from [start] to [DateTime.now].
  Duration? get startToEndDuration =>
      start != null ? (end ?? DateTime.now()).difference(start!) : null;

  /// The active work duration, i.e. accumulated time where at least one
  /// equipment section was active.
  Duration? get workDuration {
    if (equipmentLogs.isEmpty) {
      return null;
    }
    DateTime? firstWorkTime;

    final timeSpans = <String, List<({DateTime start, DateTime end})>>{};
    for (final equipment in equipmentLogs.entries) {
      final uuid = equipment.key;
      final logs = equipment.value;

      DateTime? start;
      for (final record in logs) {
        if (start == null && record.activeSections.isNotEmpty) {
          firstWorkTime ??= record.time;
          if (record.time.isBefore(firstWorkTime)) {
            firstWorkTime = record.time;
          }
          start = record.time;
        } else if (record.activeSections.isEmpty) {
          if (start != null) {
            timeSpans.update(
              uuid,
              (prevSpans) => [...prevSpans, (start: start!, end: record.time)],
              ifAbsent: () => [(start: start!, end: record.time)],
            );
          }
          start = null;
        }
      }
    }
    if (timeSpans.isEmpty) {
      return null;
    } else if (timeSpans.length == 1) {
      return timeSpans.values.first.fold<Duration>(
        Duration.zero,
        (duration, span) => duration + span.end.difference(span.start),
      );
    } else {
      final flattened = [for (final equipment in timeSpans.values) ...equipment]
          .sortedBy<DateTime>((e) => e.start);

      flattened.removeWhere(
        (span) => flattened
            .whereNot(
              (other) => other.start == span.start && other.end == span.end,
            )
            .any(
              (other) =>
                  other.start.isBefore(span.start) &&
                  other.end.isAfter(span.end),
            ),
      );
      var loop = true;
      while (loop) {
        var doBreak = false;
        for (var i = 0; i < flattened.length; i++) {
          if (doBreak) {
            break;
          }
          for (var j = 0; j < flattened.length; j++) {
            if (i != j) {
              final span = flattened[i];
              final other = flattened[j];
              if (span.start.isBefore(other.start)) {
                if (span.end.isAfter(other.end)) {
                  flattened.removeAt(j);
                  doBreak = true;
                  break;
                } else if (span.end.isAfter(other.start)) {
                  flattened[i] = (start: span.start, end: other.end);
                  flattened.removeAt(j);
                  doBreak = true;
                  break;
                }
              }
              // span.start is after other.start
              else {
                if (span.end.isBefore(other.end)) {
                  flattened.removeAt(i);
                  doBreak = true;
                  break;
                } else if (span.start.isBefore(other.end) &&
                    span.end.isAfter(other.end)) {
                  flattened[i] = (start: other.start, end: span.end);
                  flattened.removeAt(j);
                  doBreak = true;
                  break;
                }
              }
            }
          }
        }
        if (doBreak) {
          continue;
        }
        loop = flattened.any(
          (span) => flattened
              .whereNot(
                (other) => other.start == span.start && other.end == span.end,
              )
              .any(
                (other) =>
                    other.start.isBefore(span.start) &&
                    other.end.isAfter(span.end),
              ),
        );
      }
      return flattened.fold<Duration>(
        Duration.zero,
        (duration, span) => duration + span.end.difference(span.start),
      );
    }
  }

  /// The idle duration, i.e. accumulated time where all equipment sections are
  /// disabled after the first section activiation.
  Duration? get idleDuration {
    if (equipmentLogs.isEmpty) {
      return null;
    } else if (equipmentLogs.length == 1) {
      final timeSpans = <String, List<({DateTime start, DateTime end})>>{};
      DateTime? firstTime;

      for (final equipment in equipmentLogs.entries) {
        final uuid = equipment.key;
        final logs = equipment.value;

        DateTime? start;
        for (final record in logs) {
          if (record.activeSections.isEmpty) {
            firstTime ??= record.time;
            if (record.time.isBefore(firstTime)) {
              firstTime = record.time;
            }
            start = record.time;
          } else {
            if (start != null) {
              timeSpans.update(
                uuid,
                (prevSpans) =>
                    [...prevSpans, (start: start!, end: record.time)],
                ifAbsent: () => [(start: start!, end: record.time)],
              );
            }
            start = null;
          }
        }
      }

      return timeSpans.values.firstOrNull?.fold<Duration>(
        Duration.zero,
        (duration, span) => duration + span.end.difference(span.start),
      );
    } else {
      DateTime? firstActivation;
      DateTime? lastDeactivation;

      for (final equipment in equipmentLogs.entries) {
        final logs = equipment.value;

        for (final record in logs) {
          if (record.activeSections.isNotEmpty) {
            if (firstActivation != null &&
                record.time.isBefore(firstActivation)) {
              firstActivation = record.time;
            } else {
              firstActivation ??= record.time;
            }
          } else {
            if (lastDeactivation != null &&
                record.time.isAfter(lastDeactivation)) {
              lastDeactivation = record.time;
            } else {
              lastDeactivation ??= record.time;
            }
          }
        }
      }

      if (firstActivation != null && lastDeactivation != null) {
        return lastDeactivation.difference(firstActivation) -
            (workDuration ?? Duration.zero);
      }
    }

    return null;
  }

  /// The total duration from the first to the last active section activation,
  /// i.e. the sum of [workDuration] and [idleDuration].
  Duration? get workAndIdleDuration {
    if (idleDuration != null) {
      return (workDuration ?? Duration.zero) + idleDuration!;
    }
    return workDuration;
  }

  /// A map with equipment logs for all the equipment that have been active at
  /// some point.
  Map<String, List<EquipmentLogRecord>> equipmentLogs;

  /// Creates a json compatible structure of the object.
  Map<String, dynamic> toJson({bool withEquipmentLogs = false}) {
    final map = SplayTreeMap<String, dynamic>();

    map['time'] = {
      'start': start?.toIso8601String(),
      'end': end?.toIso8601String(),
    };

    map['info'] = {
      'name': name,
      'note': note,
      'uuid': uuid,
    };

    map['field'] = field;

    map['vehicle'] = vehicle;

    map['equipment_setup'] = equipmentSetup;

    map['ab_tracking'] = abTracking;

    map['path_tracking'] = pathTracking;

    if (withEquipmentLogs && equipmentLogs.isNotEmpty) {
      map['equipment_logs'] = equipmentLogs.map(
        (uuid, log) => MapEntry(
          uuid,
          log.map((record) => jsonEncode(record.toJson())).toList(),
        ),
      );
    }

    return map;
  }

  /// Creates a new work session with some parameters altered.
  WorkSession copyWith({
    Field? field,
    Vehicle? vehicle,
    EquipmentSetup? equipmentSetup,
    List<ABTracking>? abTracking,
    List<PathTracking>? pathTracking,
    String? name,
    String? note,
    DateTime? start,
    DateTime? end,
    Map<String, List<EquipmentLogRecord>>? equipmentLogs,
    String? uuid,
  }) =>
      WorkSession(
        uuid: uuid ?? this.uuid,
        field: field ?? this.field,
        vehicle: vehicle ?? this.vehicle,
        equipmentSetup: equipmentSetup ?? this.equipmentSetup,
        abTracking: abTracking ?? List.from(this.abTracking),
        pathTracking: pathTracking ?? List.from(this.pathTracking),
        name: name ?? this.name,
        note: note ?? this.note,
        start: start ?? this.start,
        end: end ?? this.end,
        equipmentLogs: equipmentLogs ?? Map.from(this.equipmentLogs),
      );
}
