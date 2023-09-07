import 'dart:collection';

import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:geobase/geobase.dart';

/// A class that contains info about a work session on a [Field].
class WorkSession {
  /// A class that contains info about a work session on a [Field].
  WorkSession({
    required this.field,
    this.vehicle,
    this.equipmentSetup,
    this.title,
    this.note,
    this.start,
    this.end,
  });

  /// Creates a work session object from the [json] object.
  factory WorkSession.fromJson(Map<String, dynamic> json) {
    final field =
        Field.fromJson(Map<String, dynamic>.from(json['field'] as Map));

    final vehicle = json['vehicle'] != null
        ? Vehicle.fromJson(Map<String, dynamic>.from(json['vehicle'] as Map))
        : null;

    final equipmentSetup = json['equipment_setup'] != null
        ? EquipmentSetup.fromJson(
            Map<String, dynamic>.from(json['equipment_setup'] as Map),
          )
        : null;

    final info = Map<String, dynamic>.from(json['info'] as Map);

    final title = info['title'] as String?;
    final note = info['note'] as String?;

    final time = Map<String, dynamic>.from(json['time'] as Map);

    final start = time['start'] != null
        ? DateTime.tryParse(time['start'] as String)
        : null;
    final end =
        time['end'] != null ? DateTime.tryParse(time['end'] as String) : null;

    return WorkSession(
      field: field,
      vehicle: vehicle,
      equipmentSetup: equipmentSetup,
      title: title,
      note: note,
      start: start,
      end: end,
    );
  }

  /// The field this work session was on.
  final Field field;

  /// The [Vehicle] used for this session.
  final Vehicle? vehicle;

  /// The [EquipmentSetup] (chain) used for this session.
  final EquipmentSetup? equipmentSetup;

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

  /// A list of worked lines for the equipment used.
  ///
  /// A list of the line maps with lines for the different sections.
  ///
  ///```
  /// [
  ///   {
  ///     1: [
  ///           [lon, lat]
  ///           [lon, lat]
  ///        ],
  ///     2: [
  ///           [lon, lat]
  ///           [lon, lat]
  ///        ]
  ///   },
  ///   {
  ///     1: [
  ///           [lon, lat]
  ///           [lon, lat]
  ///        ],
  ///     4: [
  ///           [lon, lat]
  ///           [lon, lat]
  ///        ]
  ///   },...
  /// ]
  ///```
  List<Map<int, List<Geographic>?>> workedPaths = [];

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

    map['field'] = field.toJson();

    map['vehicle'] = vehicle?.toJson();

    map['equipment_setup'] = equipmentSetup?.toJson();

    map['worked_paths'] = workedPaths;

    return map;
  }
}
