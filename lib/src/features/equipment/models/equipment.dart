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
import 'dart:math';
import 'dart:ui';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as map;
import 'package:geobase/geobase.dart';

/// A class for equipment used for working on the fields.
class Equipment extends Hitchable {
  /// A class for equipment used for working on the fields.
  ///
  /// The [bearing] and [_position] parameters generally doesn't need to be
  /// set, as the equipment usually doesn't spawn/show initially without a
  /// parent to inherit position and bearing from.
  Equipment({
    super.connectors = const [],
    super.childConnections,
    this.parentConnection,
    super.name,
    super.id,
    super.uuid,
    super.lastUsedAt,
    this.recordingPositionFraction = 1,
    this.hitchToDecorationStartLength,
    this.decorationSidewaysOffset,
    this.decorationLength,
    this.decorationWidth,
    List<Section>? sections,
    double bearing = 0,
    this._position = const Geographic(lat: 0, lon: 0),
    super.createdAt,
    super.lastUpdatedAt,
  }) : sections = sections ?? [],
       _bearing = parentConnection?.childBearing ?? bearing;

  /// Creates an [Equipment] from the [json] object.
  factory Equipment.fromJson(Map<String, dynamic> json) {
    final info = Map<String, dynamic>.from(json['info'] as Map);
    final dimensions = Map<String, dynamic>.from(json['dimensions'] as Map);
    final decoration = dimensions['decoration'] != null
        ? Map<String, dynamic>.from(dimensions['decoration'] as Map)
        : null;

    final sections = switch (json['sections']) {
      final List<dynamic> sections =>
        List<Map<String, dynamic>>.from(sections)
            .fold<
              ({
                List<Map<String, dynamic>> sections,
                double precedingWidth,
              })
            >(
              (
                sections: [],
                precedingWidth:
                    (-(dimensions['width'] as double) / 2) +
                    (dimensions['sideways_offset'] as double),
              ),
              (acc, section) => (
                sections: [
                  ...acc.sections,
                  {
                    ...section,
                    'section_count': sections.length,
                    'preceding_width': acc.precedingWidth,
                    'length': dimensions['working_area_length'] as double?,
                    'longitudinal_offset':
                        dimensions['drawbar_length'] as double? ?? 1,
                  },
                ],
                precedingWidth:
                    acc.precedingWidth + (section['width'] as double),
              ),
            )
            .sections
            .map(Section.fromJson)
            .toList(),
      _ => null,
    };

    final equipment = Equipment(
      name: info['name'] as String?,
      uuid: info['uuid'] as String,
      connectors: [
        Connector(
          longitudinalOffsetFromRef: 0.5,
          lateralOffsetFromRef: 0,
          type: .values.firstWhere(
            (value) => value.name == (info['type'] ?? info['hitch_type']),
            orElse: () => .fixed,
          ),
          relation: .child,
        ),
      ],
      recordingPositionFraction:
          (dimensions['recording_position_fraction'] as double?) ?? 1,
      sections: sections,
      hitchToDecorationStartLength:
          decoration?['hitch_to_decoration_start_length'] as double?,
      decorationLength: decoration?['decoration_length'] as double?,
      decorationWidth: decoration?['decoration_width'] as double?,
      decorationSidewaysOffset:
          decoration?['decoration_sideways_offset'] as double?,
      lastUsedAt: DateTime.tryParse(info['last_used'] as String),
    );

    return equipment;
  }

  /// Constructor for use with the local database.
  factory Equipment.fromDatabase({
    required int id,
    required String uuid,
    String? name,
    DateTime? createdAt,
    DateTime? lastUsedAt,
    DateTime? lastUpdatedAt,
  }) {
    return Equipment(
      id: id,
      uuid: uuid,
      name: name,
      createdAt: createdAt,
      lastUpdatedAt: lastUpdatedAt,
      lastUsedAt: lastUsedAt,
    );
  }

  /// The connection to a parent [Hitchable].
  Connection? parentConnection;

  /// The working sections of this equipment
  List<Section> sections;

  /// How much the working area is offset to the side from the hitch
  /// [position].
  ///
  /// Positive value means to the right of the forward direction.
  double sidewaysOffset = 0;

  /// The fraction  used to get the intermediate positions between the rear and
  /// the front of the work area. 0 means the rear and 1 means the front
  /// Defaults to the front, 1.
  ///
  /// ```_
  ///  1    ---------
  ///       |       |
  ///       |       |
  /// 0.5   o-------o
  ///       |       |
  ///       |       |
  ///  0    ---------
  /// ```
  double recordingPositionFraction = 1;

  /// The distance from the hitch [position] to the start of the decoration
  /// polygon.
  double? hitchToDecorationStartLength;

  /// The length of the decoration polygon.
  double? decorationLength;

  /// The width of the decoration polygon.
  double? decorationWidth;

  /// The sideways offset for the decoration polygon.
  double? decorationSidewaysOffset;

  /// The position of the equipment, used to specifically set the [position].
  Geographic _position = const Geographic(lon: 0, lat: 0);

  /// The velocity of the equipment, used to specifically set the [velocity].
  double _velocity = 0;

  /// The bearing of the equipment, used to specifically set the [bearing].
  double _bearing = 0;

  /// The previous position of the [position], only used in
  /// [updateDrawbar].
  late Geographic _prevPosition = position;

  /// The previous [bearing] of this, only used in [updateDrawbar].
  double _prevBearing = 0;

  /// The previous hitch angle, only used in [updateDrawbar].
  double _prevHitchAngle = 0;

  /// The turning radius of this, only used in [updateDrawbar].
  double? _turningRadius;

  /// The turning radius center of this, only used in [updateDrawbar].
  Geographic? _turningRadiusCenter;

  @override
  double? get currentTurningRadius => switch (parentConnection) {
    Connection(childConnector: Connector(type: .fixed)) =>
      turningRadiusCenter?.rhumb.distanceTo(position),
    _ => _turningRadius,
  };

  @override
  Geographic? get turningRadiusCenter => switch (parentConnection) {
    Connection(
      childConnector: Connector(type: .fixed),
      parent: Hitchable(:final turningRadiusCenter),
    ) =>
      turningRadiusCenter,
    _ => _turningRadiusCenter,
  };

  /// The angular velocity of the equipment, if it is turning.
  /// Unit is degrees/s.
  double? get angularVelocity {
    if (currentTurningRadius == null) {
      return null;
    }
    var value = (velocity / (2 * pi * currentTurningRadius!)) * 360;
    final isTurningLeft =
        signedBearingDifference(
          bearing,
          turningRadiusCenter!.rhumb.initialBearingTo(position),
        ) <
        0;
    if (isTurningLeft) {
      value *= -1;
    }
    return value;
  }

  /// The position of the hitch point of the equipment, will use the parent's
  /// hitch point if connected.
  ///
  /// All geometry calculations for this equipment is based on this point.
  @override
  Geographic get position => parentConnection?.childRefPosition ?? _position;

  /// Manually update the position of the equipment to [value].
  @override
  set position(Geographic value) => _position = value;

  /// The velocity of the equipment, will use the parent's velocity if the
  /// connection is fixed, otherwise the explicitly set [_velocity].
  @override
  double get velocity => switch (parentConnection) {
    Connection(parent: Hitchable(:final velocity)) => velocity,
    _ => _velocity,
  };

  /// Manually update the velocity of the equipment to [value].
  @override
  set velocity(double value) => _velocity = value;

  /// The bearing/bearing of the equipment, will use the parent's bearing if
  /// connection is fixed, otherwise the explicitly set [_bearing].
  @override
  double get bearing => switch (parentConnection) {
    Connection(:final childBearing) => childBearing,
    _ => _bearing,
  };

  /// Manually update the bearing of the equipment to [value].
  @override
  set bearing(double value) => _bearing = value;

  /// The total width of the equipment. Found by summing the [Section.width]
  /// for all the [sections].
  double get width => sections.fold(
    0,
    (previousValue, element) => previousValue + element.width,
  );

  /// Activate the given [section].
  void activateSection(int section) => sections[section].active = true;

  /// Deactivate the given [section].
  void deActivateSection(int section) => sections[section].active = false;

  /// Toggle the given [section].
  void toggleSection(int section) =>
      sections[section].active = !sections[section].active;

  /// Activate the given [sections].
  void activateSections(List<int> sectionsToActivate) {
    for (final section in sectionsToActivate) {
      sections[section].active = true;
    }
  }

  /// Deactivate the given [sections].
  void deactivateSections(List<int> sectionsToDeactivate) {
    for (final section in sectionsToDeactivate) {
      sections[section].active = false;
    }
  }

  /// Toggle the given [sections].
  void toggleSections(List<int> sectionsToToggle) {
    for (final section in sectionsToToggle) {
      sections[section].active = !sections[section].active;
    }
  }

  /// Activate all of the [sections].
  void activateAll() {
    for (final element in sections) {
      element.active = true;
    }
  }

  /// Deactivate all of the [sections].
  void deactivateAll() {
    for (final element in sections) {
      element.active = false;
    }
  }

  /// Toggle all of the [sections].
  ///
  /// If [deactivateAllIfAnyActive] is true, then all sections will be
  /// deactivated if any section is active.
  void toggleAll({bool deactivateAllIfAnyActive = false}) {
    if (deactivateAllIfAnyActive && sections.any((element) => element.active)) {
      deactivateAll();
    } else {
      for (final element in sections) {
        element.active = !element.active;
      }
    }
  }

  /// Enable automatic activation of the [sections].
  void enableSectionAutomation() {
    for (final element in sections) {
      element.automateActivation = true;
    }
  }

  /// Disable automatic activation of the [sections].
  void disableSectionAutomation() {
    for (final element in sections) {
      element.automateActivation = false;
    }
  }

  /// A list of the current activation status for the [sections].
  Map<int, bool> get sectionActivationStatus => Map.fromEntries(
    sections
        .where((section) => section.workingWidth > 0)
        .map((section) => MapEntry(section.index, section.active)),
  );

  /// A log record with position, active sections and a time stamp for the
  /// current state.
  EquipmentLogRecord get logRecord => EquipmentLogRecord(
    wayPoint: WayPoint(position: position, bearing: bearing),
    activeSections: sections
        .where((section) => section.active)
        .map((section) => section.index)
        .toList(),
    time: DateTime.now(),
  );

  /// Updates the state of this with [record].
  ///
  /// Typically used to create worked paths after loading a work session log
  /// file.
  void updateByLogRecord(EquipmentLogRecord record) {
    position = record.wayPoint.position;
    bearing = record.wayPoint.bearing;

    for (final section in sections) {
      section.active = record.activeSections.contains(section.index);
    }
  }

  /// The hitch connection position where this equipment is attached to the
  /// [parentConnection], if it's connected.
  Geographic? get parentConnectorPoint => parentConnection?.connectionPoint;

  /// Update the [bearing] and [velocity] of the equipment when connected to
  /// parent with a drawbar.
  ///
  /// Depends on the parent having a turning circle and radius, so it will not
  /// work without a steering angle on the main vehicle (i.e. WAS is required
  /// on physical vehicle).
  void updateDrawbar(double period) {
    if (parentConnection case Connection(
      childConnector: Connector(
        type: .drawbar,
        :final longitudinalOffsetFromRef,
      ),
      :final parent,
      :final connectionPoint,
      :final parentConnector,
    )) {
      var hitchAngle = _prevHitchAngle;
      final prevBearing = bearing;

      // Only change bearing if we're moving.
      if (parent.velocity.abs() > 0) {
        final movedDistance = _prevPosition.rhumb.distanceTo(
          position,
        );

        final bearingChange = signedBearingDifference(
          _prevBearing,
          position.rhumb.initialBearingTo(connectionPoint),
        );

        var turningRadius = bearingChange.abs() > 0
            // Circle chord to radius
            ? clampDouble(
                movedDistance / (2 * sin(bearingChange.toRadians() / 2)),
                -500,
                500,
              )
            : null;

        if (turningRadius != null) {
          if (turningRadius.abs() >= 500) {
            turningRadius = null;
          } else if (isReversing) {
            turningRadius *= -1;
          }
        }
        _turningRadius = turningRadius?.abs();

        _turningRadiusCenter = turningRadius != null
            ? position.rhumb.destinationPoint(
                distance: turningRadius,
                bearing: bearing + 90,
              )
            : null;

        final hitchToParentTurningCircleBase =
            parentConnector.longitudinalOffsetFromRef;

        // https://www.landtechnik-online.eu/landtechnik/article/view/2010-65-3-178-181/2010-65-3-178-181-en-pdf
        final a =
            parent.velocity /
            (longitudinalOffsetFromRef + hitchToParentTurningCircleBase);

        final y1 = parent.currentTurningRadius != null
            ? atan(
                hitchToParentTurningCircleBase / parent.currentTurningRadius!,
              )
            : 0.0;

        var y2 = parent.currentTurningRadius != null
            ? clampDouble(
                asin(
                  longitudinalOffsetFromRef /
                      sqrt(
                        pow(hitchToParentTurningCircleBase, 2) +
                            pow(parent.currentTurningRadius!, 2),
                      ),
                ),
                -1,
                1,
              )
            : 0.0;
        if (y2.isNaN) {
          y2 = 0;
        }

        var targetStaticAngle = (y1 + y2).toDegrees();
        if (parent.turningRadiusCenter != null &&
            signedBearingDifference(
                  parent.position.rhumb.initialBearingTo(
                    parent.turningRadiusCenter!,
                  ),
                  parent.bearing,
                ) <
                0) {
          targetStaticAngle *= -1;
        }
        hitchAngle = clampDouble(
          _prevHitchAngle + (targetStaticAngle - _prevHitchAngle) * a * period,
          -90,
          90,
        );

        bearing =
            (position.rhumb.initialBearingTo(parent.position) + hitchAngle)
                .wrap360();
      }
      _velocity = parent.velocity * cos(hitchAngle.abs().toRadians());
      _prevHitchAngle = hitchAngle;
      _prevPosition = position;
      _prevBearing = prevBearing;
    }
  }

  /// Update the children connected to this. Also checks and updates this
  /// equipment if it's connected to parent with a drawbar.
  @override
  void updateChildren(double period) {
    updateDrawbar(period);
    super.updateChildren(period);
  }

  /// The corner points for the given section [index].
  List<Geographic> sectionPoints(int index) {
    final section = sections[index];

    final sectionFrontLeft = position.rhumb
        .destinationPoint(
          distance: section.longitudinalOffset,
          bearing: bearing,
        )
        .rhumb
        .destinationPoint(
          distance: section.lateralOffset - section.width / 2,
          bearing: bearing + 90,
        );

    final sectionRearLeft = sectionFrontLeft.rhumb.destinationPoint(
      distance: section.length,
      bearing: bearing + 180,
    );

    final sectionRearRight = sectionRearLeft.rhumb.destinationPoint(
      distance: section.width,
      bearing: bearing + 90,
    );

    final sectionFrontRight = sectionRearRight.rhumb.destinationPoint(
      distance: section.length,
      bearing: bearing,
    );

    return [
      sectionFrontLeft,
      sectionRearLeft,
      sectionRearRight,
      sectionFrontRight,
    ];
  }

  /// The corner points for the working area for the section with index [index].
  ///
  /// The order of the points is
  ///
  /// ```_
  /// [
  ///   front left,
  ///   rear left,
  ///   rear right,
  ///   front right,
  /// ]
  /// ```
  List<Geographic>? sectionCornerPoints(
    int index, {
    bool force = false,
    bool forceOwnPositionAndBearing = false,
  }) {
    if (sections[index].workingWidth == 0 && !force) {
      return null;
    }

    final calculationBearing = forceOwnPositionAndBearing ? _bearing : bearing;

    final section = sections[index];

    final sectionFrontLeft = position.rhumb
        .destinationPoint(
          distance: section.longitudinalOffset,
          bearing: calculationBearing,
        )
        .rhumb
        .destinationPoint(
          distance: section.lateralOffset - section.workingWidth / 2,
          bearing: calculationBearing + 90,
        );

    final sectionRearLeft = sectionFrontLeft.rhumb.destinationPoint(
      distance: section.length,
      bearing: calculationBearing + 180,
    );

    final sectionRearRight = sectionRearLeft.rhumb.destinationPoint(
      distance: section.workingWidth,
      bearing: calculationBearing + 90,
    );

    final sectionFrontRight = sectionRearRight.rhumb.destinationPoint(
      distance: section.length,
      bearing: calculationBearing,
    );

    return [
      sectionFrontLeft,
      sectionRearLeft,
      sectionRearRight,
      sectionFrontRight,
    ];
  }

  /// Finds the drawing/recording edge positions for the section with index
  /// [index].
  ///
  /// [fraction] can be set to override the [recordingPositionFraction].
  SectionEdgePositions? sectionEdgePositions(
    int index, {
    double? fraction,
    bool force = false,
    DateTime? overrideTime,
    bool forceOwnPositionAndBearing = false,
  }) {
    final points = sectionCornerPoints(
      index,
      force: force,
      forceOwnPositionAndBearing: forceOwnPositionAndBearing,
    );
    if (points != null) {
      return SectionEdgePositions(
        left: points[1].spherical.intermediatePointTo(
          points[0],
          fraction: fraction ?? recordingPositionFraction,
        ),
        right: points[2].spherical.intermediatePointTo(
          points[3],
          fraction: fraction ?? recordingPositionFraction,
        ),
        time: overrideTime ?? lastUsedAt,
      );
    }
    return null;
  }

  /// A map of all the section indexes and their [SectionEdgePositions] if they
  /// are active.
  Map<int, SectionEdgePositions> activeEdgePositions({
    double? fraction,
    List<int> forceIndices = const [],
    DateTime? overrideTime,
    bool forceOwnPositionAndBearing = false,
  }) {
    final map = <int, SectionEdgePositions>{};
    for (final element in sections.where(
      (section) => section.workingWidth > 0,
    )) {
      if (element.active || forceIndices.contains(element.index)) {
        map[element.index] = sectionEdgePositions(
          element.index,
          fraction: fraction,
          overrideTime: overrideTime,
          forceOwnPositionAndBearing: forceOwnPositionAndBearing,
        )!;
      }
    }
    return map;
  }

  /// The center point of the given [sectionIndex].
  Geographic sectionCenter(int sectionIndex) {
    final points = sectionPoints(sectionIndex);
    return points[0].rhumb
        .midPointTo(points[3])
        .rhumb
        .destinationPoint(
          distance:
              (1 - recordingPositionFraction) * sections[sectionIndex].length,
          bearing: (bearing - 180).wrap360(),
        );
  }

  /// The polygon for the given [section].
  Polygon sectionPolygon(int section) =>
      Polygon([PositionSeries.from(sectionPoints(section))]);

  /// The working polygon for the given [section].
  Polygon? sectionWorkingPolygon(int section) {
    final cornerPoints = sectionCornerPoints(section);
    if (cornerPoints != null) {
      return Polygon([PositionSeries.from(cornerPoints)]);
    }
    return null;
  }

  /// An iterable of all the sections' polygons.
  Iterable<Polygon> get sectionPolygons =>
      Iterable.generate(sections.length, sectionPolygon).nonNulls;

  /// An iterable of all the sections' working polygons.
  Iterable<Polygon> get sectionWorkingPolygons =>
      Iterable.generate(sections.length, sectionWorkingPolygon).nonNulls;

  /// The map polygon for the [Section] with the given [index].
  map.Polygon sectionMapPolygon(int index) {
    final section = sections[index];

    return sectionPolygon(index).mapPolygon(
      borderStrokeWidth: 2,
      borderColor: switch (section.active) {
        true => section.color?.brighten(30) ?? Colors.greenAccent,
        false => Colors.grey,
      },
      color: switch (section.active) {
        true => (section.color ?? Colors.green).withValues(alpha: 0.8),
        false => Colors.grey.withValues(alpha: 0.2),
      },
    );
  }

  /// The map polygon for the [Section]'s work area with the given [index].
  map.Polygon? sectionWorkingMapPolygon(int index) {
    final section = sections[index];

    return sectionWorkingPolygon(index)?.mapPolygon(
      borderStrokeWidth: 2,
      borderColor: switch (section.workingWidth > 0) {
        true => switch (section.active) {
          true => section.color?.brighten(30) ?? Colors.greenAccent,
          false => Colors.grey,
        },
        false => Colors.transparent,
      },
      color: switch (section.active) {
        true => (section.color ?? Colors.green).withValues(alpha: 0.8),
        false => Colors.grey.withValues(alpha: 0.2),
      },
    );
  }

  /// An iterable of all the sections' polygons.
  Iterable<map.Polygon> get sectionMapPolygons => List.generate(
    sections.length,
    sectionMapPolygon,
    growable: false,
  ).nonNulls;

  /// An iterable of all the sections' working polygons.
  Iterable<map.Polygon> get sectionWorkingMapPolygons => List.generate(
    sections.length,
    sectionWorkingMapPolygon,
    growable: false,
  ).nonNulls;

  /// A list of the polygon(s) for the drawbar(s).
  List<map.Polygon> get drawbarMapPolygons => [
    if (sections.isNotEmpty) ...[
      map.Polygon(
        borderStrokeWidth: 3,
        color: Colors.grey.shade800,
        borderColor: Colors.black,
        points: [
          position.rhumb
              .destinationPoint(distance: 0.1, bearing: bearing)
              .rhumb
              .destinationPoint(distance: 0.05, bearing: bearing - 90)
              .latLng,
          sectionEdgePositions(0, fraction: 1, force: true)!.left.rhumb
              .destinationPoint(distance: 0.1, bearing: bearing)
              .latLng,
          sectionEdgePositions(0, fraction: 1, force: true)!.left.latLng,
          position.rhumb
              .destinationPoint(distance: 0.05, bearing: bearing - 90)
              .latLng,
        ],
      ),
      map.Polygon(
        borderStrokeWidth: 3,
        color: Colors.grey.shade800,
        borderColor: Colors.black,
        points: [
          position.rhumb
              .destinationPoint(distance: 0.1, bearing: bearing)
              .rhumb
              .destinationPoint(distance: 0.05, bearing: bearing + 90)
              .latLng,
          sectionEdgePositions(sections.length - 1, fraction: 1, force: true)!
              .right
              .rhumb
              .destinationPoint(distance: 0.1, bearing: bearing)
              .latLng,
          sectionEdgePositions(
            sections.length - 1,
            fraction: 1,
            force: true,
          )!.right.latLng,
          position.rhumb
              .destinationPoint(distance: 0.05, bearing: bearing + 90)
              .latLng,
        ],
      ),
    ],
    ...?switch (parentConnection) {
      Connection(
        childConnector: Connector(
          type: .drawbar,
        ),
        :final connectionPoint,
      ) =>
        [
          map.Polygon(
            borderStrokeWidth: 3,
            color: Colors.grey.shade800,
            borderColor: Colors.black,
            points: [
              position.rhumb
                  .destinationPoint(distance: 0.05, bearing: bearing - 90)
                  .latLng,
              connectionPoint.rhumb
                  .destinationPoint(distance: 0.05, bearing: bearing - 90)
                  .latLng,
              connectionPoint.rhumb
                  .destinationPoint(distance: 0.05, bearing: bearing + 90)
                  .latLng,
              position.rhumb
                  .destinationPoint(distance: 0.05, bearing: bearing + 90)
                  .latLng,
            ],
          ),
        ],
      Connection(
        childConnector: Connector(
          type: .fixed,
        ),
        :final connectionPoint,
      ) =>
        [
          // Left hitch bar
          map.Polygon(
            borderStrokeWidth: 3,
            color: Colors.grey.shade800,
            borderColor: Colors.black,
            points: [
              position.rhumb
                  .destinationPoint(distance: 0.35, bearing: bearing - 90)
                  .latLng,
              connectionPoint.rhumb
                  .destinationPoint(distance: 0.35, bearing: bearing - 90)
                  .latLng,
              connectionPoint.rhumb
                  .destinationPoint(distance: 0.3, bearing: bearing - 90)
                  .latLng,
              position.rhumb
                  .destinationPoint(distance: 0.3, bearing: bearing - 90)
                  .latLng,
            ],
          ),
          // Right hitch bar
          map.Polygon(
            borderStrokeWidth: 3,
            color: Colors.grey.shade800,
            borderColor: Colors.black,
            points: [
              position.rhumb
                  .destinationPoint(distance: 0.35, bearing: bearing + 90)
                  .latLng,
              connectionPoint.rhumb
                  .destinationPoint(distance: 0.35, bearing: bearing + 90)
                  .latLng,
              connectionPoint.rhumb
                  .destinationPoint(distance: 0.3, bearing: bearing + 90)
                  .latLng,
              position.rhumb
                  .destinationPoint(distance: 0.3, bearing: bearing + 90)
                  .latLng,
            ],
          ),
        ],
      _ => null,
    },
  ];

  /// A polygon drawing the decoration of the equipment.
  map.Polygon? get decorationPolygon {
    if (hitchToDecorationStartLength != null &&
        decorationLength != null &&
        decorationWidth != null) {
      final decorationStart = position.rhumb
          .destinationPoint(
            distance: hitchToDecorationStartLength!,
            bearing: bearing - 180,
          )
          .rhumb
          .destinationPoint(
            distance: decorationSidewaysOffset ?? 0,
            bearing: bearing + 90,
          );
      final decorationEnd = decorationStart.rhumb.destinationPoint(
        distance: decorationLength!,
        bearing: bearing - 180,
      );

      final points = [
        decorationStart.rhumb.destinationPoint(
          distance: decorationWidth! / 2,
          bearing: bearing + 90,
        ),
        decorationEnd.rhumb.destinationPoint(
          distance: decorationWidth! / 2,
          bearing: bearing + 90,
        ),
        decorationEnd.rhumb.destinationPoint(
          distance: decorationWidth! / 2,
          bearing: bearing - 90,
        ),
        decorationStart.rhumb.destinationPoint(
          distance: decorationWidth! / 2,
          bearing: bearing - 90,
        ),
      ];

      return map.Polygon(
        borderStrokeWidth: 3,
        color: Colors.grey.shade800.withValues(alpha: 0.7),
        borderColor: Colors.black,
        points: points.map((e) => e.latLng).toList(),
      );
    }
    return null;
  }

  /// A list of all the polygons for the equipment, i.e. [drawbarMapPolygons]
  /// and all the [sectionWorkingMapPolygon]s.
  List<map.Polygon> get mapPolygons {
    return [
      ...drawbarMapPolygons,
      ?decorationPolygon,
      ...List.generate(
        sections.length,
        sectionWorkingMapPolygon,
        growable: false,
      ).nonNulls,
    ];
  }

  /// The projected trajectory of the [position] for the moving equipment.
  LineString trajectory({double? seconds, double? minLength}) =>
      trajectoryFrom(position, seconds: seconds, minLength: minLength);

  /// Finds the trajectory form an arbitrary [start] point.
  /// Looks 10 seconds ahead in time
  LineString trajectoryFrom(
    Geographic start, {
    double? seconds,
    double? minLength,
  }) {
    final time = seconds ?? 10;
    final points = <Geographic>[start];

    if (turningRadiusCenter != null && currentTurningRadius != null) {
      final isTurningLeft =
          signedBearingDifference(
            bearing,
            turningRadiusCenter!.rhumb.initialBearingTo(position),
          ) <
          0;

      var arcDegrees = clampDouble(time * angularVelocity!.abs(), 0, 360);

      if (minLength != null) {
        final centerTurningRadius = position.rhumb.distanceTo(
          turningRadiusCenter!,
        );
        if (arcDegrees.toRadians() * centerTurningRadius < minLength) {
          arcDegrees = (minLength / centerTurningRadius).toDegrees();
        }
      }

      final bearingFromRadiusCenterToEquipment = turningRadiusCenter!.rhumb
          .initialBearingTo(start);

      final turningRadius = start.rhumb.distanceTo(turningRadiusCenter!);

      const numberOfPoints = 36;
      for (var i = 0; i < numberOfPoints + 1; i++) {
        {
          // The angle from the turning circle center to the projected
          // position.
          final angle =
              bearingFromRadiusCenterToEquipment -
              switch (isTurningLeft) {
                // Turning left
                true => switch (isReversing) {
                  // Reversing
                  true => i / numberOfPoints * arcDegrees,
                  // Forward
                  false => -i / numberOfPoints * arcDegrees,
                },
                // Turning right
                false => switch (isReversing) {
                  // Reversing
                  true => -i / numberOfPoints * arcDegrees,
                  // Forward
                  false => i / numberOfPoints * arcDegrees,
                },
              };

          points.add(
            turningRadiusCenter!.rhumb.destinationPoint(
              distance: turningRadius,
              bearing: angle.wrap360(),
            ),
          );
        }
      }
    } else {
      var distance = time * velocity;
      if (minLength != null && distance.abs() < minLength) {
        distance =
            minLength *
            switch (velocity.isNegative) {
              true => -1,
              false => 1,
            };
      }
      points.add(
        start.rhumb.destinationPoint(distance: distance, bearing: bearing),
      );
    }
    return LineString.from(points);
  }

  /// The projected trajectory of the [sectionCenter] for the given [section].
  LineString sectionCenterTrajectory(
    int section, {
    double? seconds,
    double? minLength,
  }) => trajectoryFrom(
    sectionCenter(section),
    seconds: seconds,
    minLength: minLength,
  );

  /// The projected trajectories for the [section]s edge positions.
  ({LineString left, LineString right}) sectionEdgeTrajectories(
    int section, {
    double? seconds,
    double? minLength,
  }) {
    final edgePositions = sectionEdgePositions(section, force: true)!;
    return (
      left: trajectoryFrom(
        edgePositions.left,
        seconds: seconds,
        minLength: minLength,
      ),
      right: trajectoryFrom(
        edgePositions.right,
        seconds: seconds,
        minLength: minLength,
      ),
    );
  }

  /// Returns a new [Equipment] based on this one, but with
  /// parameters/variables altered.
  @override
  Equipment copyWith({
    String? name,
    String? uuid,
    List<Connector>? connectors,
    List<Connection>? childConnections,
    Connection? parentConnection,
    List<Section>? sections,
    double? recordingPositionFraction,
    double? bearing,
    Geographic? position,
    double? hitchToDecorationStartLength,
    double? decorationSidewaysOffset,
    double? decorationLength,
    double? decorationWidth,
    DateTime? lastUsedAt,
    bool clearParentConnection = false,
    int? id,
  }) => Equipment(
    name: name ?? this.name,
    uuid: uuid ?? this.uuid,
    id: id ?? this.id,
    connectors: connectors ?? this.connectors,
    childConnections: childConnections ?? this.childConnections,
    parentConnection: switch (clearParentConnection) {
      true => null,
      _ => parentConnection ?? this.parentConnection,
    },
    sections: sections ?? this.sections,
    recordingPositionFraction:
        recordingPositionFraction ?? this.recordingPositionFraction,
    position: position ?? this.position,
    bearing: bearing ?? this.bearing,
    hitchToDecorationStartLength:
        hitchToDecorationStartLength ?? this.hitchToDecorationStartLength,
    decorationLength: decorationLength ?? this.decorationLength,
    decorationWidth: decorationWidth ?? this.decorationWidth,
    decorationSidewaysOffset:
        decorationSidewaysOffset ?? this.decorationSidewaysOffset,
    lastUsedAt: lastUsedAt ?? this.lastUsedAt,
  );

  /// Converts the object to a json compatible structure.
  @override
  Map<String, dynamic> toJson() {
    final map = SplayTreeMap<String, dynamic>();

    map['info'] = {
      'name': name,
      'uuid': uuid,
      'hitch_type': childConnectors.first.type.name,
      'last_used': lastUsedAt.toIso8601String(),
    };

    Map<String, double?>? decoration;

    if (hitchToDecorationStartLength != null &&
        decorationLength != null &&
        decorationWidth != null) {
      decoration = {
        'hitch_to_decoration_start_length': hitchToDecorationStartLength,
        'decoration_length': decorationLength,
        'decoration_width': decorationWidth,
        'decoration_sideways_offset': decorationSidewaysOffset,
      };
    }

    map['dimensions'] = {
      'sideways_offset': sidewaysOffset,
      'width': width,
      'recording_position_fraction': recordingPositionFraction,
      'decoration': decoration,
    };

    map['sections'] = sections;

    return map;
  }
}
