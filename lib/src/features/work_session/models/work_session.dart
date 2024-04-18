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

import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';

/// A class that contains objects used in and info about a work session.
class WorkSession {
  /// A class that contains objects used in and info about a work session.
  WorkSession({
    this.field,
    this.vehicle,
    this.equipmentSetup,
    List<ABTracking>? abTracking,
    List<PathTracking>? pathTracking,
    this.title,
    this.note,
    this.start,
    this.end,
    this.workedPaths,
  })  : abTracking = abTracking ?? [],
        pathTracking = pathTracking ?? [];

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

    final title = info['title'] as String?;
    final note = info['note'] as String?;

    final time = Map<String, dynamic>.from(json['time'] as Map);

    final start = time['start'] != null
        ? DateTime.tryParse(time['start'] as String)
        : null;
    final end =
        time['end'] != null ? DateTime.tryParse(time['end'] as String) : null;

    final workedPaths = json['worked_paths'] != null
        ? Map<String, List<dynamic>>.from(
            json['worked_paths'] as Map,
          )
            .map(
            (uuid, activations) => MapEntry(
              uuid,
              List<Map<String, dynamic>>.from(activations)
                  .map(
                    (activation) =>
                        Map<String, List<dynamic>?>.from(activation as Map).map(
                      (section, path) => MapEntry(
                        int.parse(section),
                        path != null
                            ? List<Map<String, dynamic>>.from(path)
                                .map(SectionEdgePositions.fromJson)
                                .toList()
                            : null,
                      ),
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
      title: title,
      note: note,
      start: start,
      end: end,
      workedPaths: workedPaths,
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

  /// The recorded path used in this work session.
  List<WayPoint>? pathRecording;

  /// A title for the work session.
  String? title;

  /// A note for adding some info about the work, e.g. type of work done,
  /// species, application rate etc...
  String? note;

  /// The starting time of the working session.
  DateTime? start;

  /// The ending time of the working session.
  DateTime? end;

  /// The work duration for the session. If the [end] time is not set, then
  /// the duration is from [start] to [DateTime.now].
  Duration? get workDuration =>
      start != null ? (end ?? DateTime.now()).difference(start!) : null;

  /// A map with lists of the worked paths for the equipment used in the
  /// session.
  Map<String, List<Map<int, List<SectionEdgePositions>?>>>? workedPaths;

  /// Creates a json compatible structure of the object.
  Map<String, dynamic> toJson() {
    final map = SplayTreeMap<String, dynamic>();

    map['time'] = {
      'start': start?.toIso8601String(),
      'end': end?.toIso8601String(),
    };

    map['info'] = {
      'title': title,
      'note': note,
    };

    map['field'] = field;

    map['vehicle'] = vehicle;

    map['equipment_setup'] = equipmentSetup;

    map['ab_tracking'] = abTracking;

    map['path_tracking'] = pathTracking;

    map['worked_paths'] = workedPaths?.map(
      (uuid, paths) => MapEntry(
        uuid,
        paths
            .map(
              (activation) => activation.map(
                (section, positions) => MapEntry(
                  '$section',
                  positions?.map((e) => e.toJson()).toList(),
                ),
              ),
            )
            .toList(),
      ),
    );
    return map;
  }
}
