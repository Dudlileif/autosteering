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
    this.abTracking,
    this.pathRecording,
    this.title,
    this.note,
    this.start,
    this.end,
    this.workedPaths,
  });

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
        ? ABTracking.fromJson(
            Map<String, dynamic>.from(json['ab_tracking'] as Map),
          )
        : null;

    final pathRecording = json['path_recording'] != null
        ? List<Map<String, dynamic>>.from(json['path_recording'] as List)
            .map(WayPoint.fromJson)
            .toList()
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

    final workedPaths = json['worked_paths'] != null
        ? (json['worked_paths'] as List)
            .map(
              (e) => Map<int, List<dynamic>>.from(e as Map).map(
                (key, value) => MapEntry(
                  key,
                  value
                      .map(
                        (pos) => SectionEdgePositions.fromJson(
                          Map<String, dynamic>.from(pos as Map),
                        ),
                      )
                      .toList(),
                ),
              ),
            )
            .toList()
        : null;

    return WorkSession(
      field: field,
      vehicle: vehicle,
      equipmentSetup: equipmentSetup,
      abTracking: abTracking,
      pathRecording: pathRecording,
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

  /// The [PathTracking] used in this work session.
  ABTracking? abTracking;

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
  List<Map<int, List<SectionEdgePositions>?>>? workedPaths;

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

    map['path_recording'] = pathRecording;

    map['worked_paths'] = workedPaths;

    return map;
  }
}
