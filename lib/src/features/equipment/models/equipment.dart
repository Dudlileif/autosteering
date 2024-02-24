import 'dart:collection';
import 'dart:math';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/hitching/hitching.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as map;
import 'package:geobase/geobase.dart';

/// A class for equipment used for working on the fields.
class Equipment extends Hitchable with EquatableMixin {
  /// A class for equipment used for working on the fields.
  ///
  /// The required [hitchType] specifies how this equipment connects to a
  /// parent.
  ///
  /// The [workingAreaLength] refers to the length of the working area, and the
  /// [drawbarLength] how long the drawbar(s) is/are. The working area starts
  /// after the drawbar.
  ///
  /// To add child hitches to the equipment, set the distance from the hitch
  /// point to the corresponding [hitchToChildFrontFixedHitchLength],
  /// [hitchToChildRearFixedHitchLength], [hitchToChildRearTowbarHitchLength]
  /// depending on which hitch(es) you wan't to add.
  ///
  /// The [bearing] and [position] parameters generally doesn't need to be
  /// set, as the equipment usually doesn't spawn/show initially without a
  /// parent to inherit position and bearing from.
  Equipment({
    required this.hitchType,
    super.hitchParent,
    super.hitchFrontFixedChild,
    super.hitchRearFixedChild,
    super.hitchRearTowbarChild,
    super.name,
    super.uuid,
    this.workingAreaLength = 2,
    this.drawbarLength = 1,
    this.sidewaysOffset = 0,
    this.hitchToChildFrontFixedHitchLength,
    this.hitchToChildRearFixedHitchLength,
    this.hitchToChildRearTowbarHitchLength,
    this.hitchToDecorationStartLength,
    this.decorationSidewaysOffset,
    this.decorationLength,
    this.decorationWidth,
    List<Section>? sections,
    DateTime? lastUsed,
    double bearing = 0,
    Geographic position = const Geographic(lat: 0, lon: 0),
  })  : sections = sections ?? [],
        _position = position,
        _bearing = hitchParent?.bearing ?? bearing,
        lastUsed = lastUsed ?? DateTime.now();

  /// Creates an [Equipment] from the [json] object.
  factory Equipment.fromJson(Map<String, dynamic> json) {
    final info = Map<String, dynamic>.from(json['info'] as Map);
    final dimensions = Map<String, dynamic>.from(json['dimensions'] as Map);
    final hitches = Map<String, dynamic>.from(json['hitches'] as Map);

    final decoration = dimensions['decoration'] != null
        ? Map<String, dynamic>.from(dimensions['decoration'] as Map)
        : null;

    final sections = json['sections'] != null
        ? (json['sections'] as List)
            .map(
              (section) =>
                  Section.fromJson(Map<String, dynamic>.from(section as Map)),
            )
            .toList()
        : null;

    final equipment = Equipment(
      hitchType: HitchType.values.firstWhere(
        (element) => element.name == info['hitch_type'] as String,
      ),
      name: info['name'] as String?,
      uuid: info['uuid'] as String,
      drawbarLength: dimensions['drawbar_length'] as double,
      sidewaysOffset: dimensions['sideways_offset'] as double,
      workingAreaLength: dimensions['working_area_length'] as double,
      sections: sections,
      hitchToChildFrontFixedHitchLength:
          hitches['hitch_to_child_front_fixed_hitch_length'] as double?,
      hitchToChildRearFixedHitchLength:
          hitches['hitch_to_child_rear_fixed_hitch_length'] as double?,
      hitchToChildRearTowbarHitchLength:
          hitches['hitch_to_child_rear_towbar_hitch_length'] as double?,
      hitchToDecorationStartLength:
          decoration?['hitch_to_decoration_start_length'] as double?,
      decorationLength: decoration?['decoration_length'] as double?,
      decorationWidth: decoration?['decoration_width'] as double?,
      decorationSidewaysOffset:
          decoration?['decoration_sideways_offset'] as double?,
      lastUsed: DateTime.tryParse(info['last_used'] as String),
    );

    final children = json['children'] != null
        ? Map<String, Map<String, dynamic>?>.from(
            json['children'] as Map,
          )
        : null;

    final hitchFrontFixedChild = children?['front_fixed'] != null
        ? Equipment.fromJson(
            Map<String, dynamic>.from(children!['front_fixed']!),
          )
        : null;
    final hitchRearFixedChild = children?['rear_fixed'] != null
        ? Equipment.fromJson(
            Map<String, dynamic>.from(children!['rear_fixed']!),
          )
        : null;
    final hitchRearTowbarChild = children?['rear_towbar'] != null
        ? Equipment.fromJson(
            Map<String, dynamic>.from(children!['rear_towbar']!),
          )
        : null;

    if (hitchFrontFixedChild != null) {
      equipment.attachChild(hitchFrontFixedChild, Hitch.frontFixed);
    }
    if (hitchRearFixedChild != null) {
      equipment.attachChild(hitchRearFixedChild);
    }
    if (hitchRearTowbarChild != null) {
      equipment.attachChild(hitchRearTowbarChild, Hitch.rearTowbar);
    }

    return equipment;
  }

  /// The last time this equipment was used.
  DateTime lastUsed;

  /// Which type of hitch point this equipment has.
  HitchType hitchType;

  /// The working sections of this equipment
  List<Section> sections;

  /// The length of the working area of the equipment. This length starts
  /// at the [drawbarEnd] and ends at the end of the equipment.
  double workingAreaLength;

  /// The length from the front hitch point to the start of the main equipment
  /// working area/sections.
  double drawbarLength;

  /// How much the working area is offset to the side from the hitch
  /// [position].
  ///
  /// Positive value means to the right of the forward direction.
  double sidewaysOffset = 0;

  /// The length from the hitch point to the child fixed hitch at the front,
  /// if there is one.
  double? hitchToChildFrontFixedHitchLength;

  /// The length from the primary hitch point to the child fixed hitch at the
  /// rear, if there is one.
  double? hitchToChildRearFixedHitchLength;

  /// The length from the primary hitch point to the child rear towbar hitch at
  /// the rear, if there is one.
  double? hitchToChildRearTowbarHitchLength;

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

  /// The position of the hitch point of the equipment, will use the parent's
  /// hitch point if connected.
  ///
  /// All geometry calculations for this equipment is based on this point.
  @override
  Geographic get position => parentHitchPoint ?? _position;

  /// Manually update the position of the equipment to [value].
  @override
  set position(Geographic value) => _position = value;

  /// The velocity of the equipment, will use the parent's velocity if the
  /// connection is fixed, otherwise the explicitly set [_velocity].
  @override
  double get velocity {
    if (hitchParent != null && parentHitch != Hitch.rearTowbar) {
      return hitchParent!.velocity;
    }
    return _velocity;
  }

  /// Manually update the velocity of the equipment to [value].
  @override
  set velocity(double value) => _velocity = value;

  /// The bearing/bearing of the equipment, will use the parent's bearing if
  /// connection is fixed, otherwise the explicitly set [_bearing].
  @override
  double get bearing {
    if (hitchParent != null && parentHitch != Hitch.rearTowbar) {
      return switch (hitchParent! is ArticulatedTractor) {
        true => parentHitch == Hitch.frontFixed
            ? (hitchParent! as ArticulatedTractor).frontAxleAngle
            : (hitchParent! as ArticulatedTractor).rearAxleAngle + 180,
        false => hitchParent!.bearing,
      };
    }
    return _bearing;
  }

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
  void toggleAll() {
    for (final element in sections) {
      element.active = !element.active;
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
  List<bool> get sectionActivationStatus =>
      sections.map((e) => e.active).toList();

  /// The hitch connection position where this equipment is attached to the
  /// [hitchParent], if it's connected.
  Geographic? get parentHitchPoint => switch (parentHitch != null) {
        true => switch (parentHitch!) {
            Hitch.frontFixed => hitchParent!.hitchFrontFixedPoint,
            Hitch.rearFixed => hitchParent!.hitchRearFixedPoint,
            Hitch.rearTowbar => hitchParent!.hitchRearTowbarPoint,
          },
        false => null,
      };

  /// The position of the front fixed child hitch on this equipment, if there is
  /// one.
  @override
  Geographic? get hitchFrontFixedPoint =>
      switch (hitchToChildFrontFixedHitchLength != null) {
        true => position.spherical.destinationPoint(
            distance: hitchToChildFrontFixedHitchLength!,
            bearing: bearing,
          ),
        false => null
      };

  /// The position of the rear fixed child hitch on this equipment, if there is
  /// one.
  @override
  Geographic? get hitchRearFixedPoint =>
      switch (hitchToChildRearFixedHitchLength != null) {
        true => position.spherical.destinationPoint(
            distance: hitchToChildRearFixedHitchLength!,
            bearing: bearing + 180,
          ),
        false => null
      };

  /// The position of the rear towbar child hitch on this equipment, if there is
  /// one.
  @override
  Geographic? get hitchRearTowbarPoint =>
      switch (hitchToChildRearTowbarHitchLength != null) {
        true => position.spherical.destinationPoint(
            distance: hitchToChildRearTowbarHitchLength!,
            bearing: bearing + 180,
          ),
        false => null
      };

  /// Update the [bearing] and [velocity] of the equipment when connected to
  /// parent with a towbar.
  void updateTowbar() {
    if (hitchParent != null && parentHitch == Hitch.rearTowbar) {
      final hitchAngle = signedBearingDifference(
        position.spherical.initialBearingTo(hitchParent!.position),
        position.spherical.initialBearingTo(workingCenter),
      ).toRadians();

      final bearingChange = hitchParent!.velocity /
          (drawbarLength + workingAreaLength / 2) *
          sin(hitchAngle);

      // Only change bearing if we're moving.
      if (hitchParent!.velocity.abs() > 0 || true) {
        bearing = _bearing + bearingChange;
      }
      _velocity = hitchParent!.velocity * -cos(hitchAngle);
    }
  }

  /// Update the children connected to this. Also checks and updates this
  /// equipment if it's connected to parent with a towbar.
  @override
  void updateChildren() {
    updateTowbar();
    super.updateChildren();
  }

  /// The working area center of this equipment.
  Geographic get workingCenter => position.spherical
      .destinationPoint(
        distance: drawbarLength + workingAreaLength / 2,
        bearing: switch (parentHitch) {
          Hitch.frontFixed => bearing,
          Hitch.rearFixed => bearing + 180,
          Hitch.rearTowbar => bearing + 180,
          null => bearing,
        },
      )
      .spherical
      .destinationPoint(distance: sidewaysOffset, bearing: bearing + 90);

  /// The position of the end of the drawbar, i.e. furthest away from the
  /// parent, where the working area starts.
  Geographic get drawbarEnd => switch (parentHitch) {
        Hitch.frontFixed => position.spherical
            .destinationPoint(distance: drawbarLength, bearing: bearing),
        Hitch.rearFixed => position.spherical
            .destinationPoint(distance: drawbarLength, bearing: bearing + 180),
        Hitch.rearTowbar => position.spherical
            .destinationPoint(distance: drawbarLength, bearing: bearing + 180),
        null => position.spherical
            .destinationPoint(distance: drawbarLength, bearing: bearing),
      };

  /// The corner points for the given [section].
  List<Geographic> sectionPoints(int section) {
    // The starting point of this equipment, i.e. the center-front point
    // of the working area.
    final equipmentStart = switch (parentHitch) {
      Hitch.frontFixed => drawbarEnd.spherical
          .destinationPoint(distance: workingAreaLength, bearing: bearing),
      _ => drawbarEnd
    }
        .spherical
        .destinationPoint(distance: sidewaysOffset, bearing: bearing + 90);

    // The width of the preceding sections.
    final widthBefore = sections.getRange(0, section).map((e) => e.width).sum;

    final sectionFrontLeft = equipmentStart.spherical.destinationPoint(
      distance: width / 2 - widthBefore,
      bearing: bearing - 90,
    );

    final sectionRearLeft = sectionFrontLeft.spherical
        .destinationPoint(distance: workingAreaLength, bearing: bearing + 180);

    final sectionRearRight = sectionRearLeft.spherical.destinationPoint(
      distance: sections[section].width,
      bearing: bearing + 90,
    );

    final sectionFrontRight = sectionRearRight.spherical
        .destinationPoint(distance: workingAreaLength, bearing: bearing);

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
  /// ```
  /// [
  ///   front left,
  ///   rear left,
  ///   rear right,
  ///   front right,
  /// ]
  /// ```
  List<Geographic> sectionCornerPoints(int index) {
    // The starting point of this equipment, i.e. the center-front point
    // of the working area.
    final equipmentStart = switch (parentHitch) {
      Hitch.frontFixed => drawbarEnd.spherical
          .destinationPoint(distance: workingAreaLength, bearing: bearing),
      _ => drawbarEnd
    }
        .spherical
        .destinationPoint(distance: sidewaysOffset, bearing: bearing + 90);

    final section = sections[index];

    // The width of the preceding sections.
    final widthBefore = sections.getRange(0, index).map((e) => e.width).sum +
        (section.width - section.workingWidth) / 2;

    final sectionFrontLeft = equipmentStart.spherical.destinationPoint(
      distance: width / 2 - widthBefore,
      bearing: bearing - 90,
    );

    final sectionRearLeft = sectionFrontLeft.spherical
        .destinationPoint(distance: workingAreaLength, bearing: bearing + 180);

    final sectionRearRight = sectionRearLeft.spherical.destinationPoint(
      distance: section.workingWidth,
      bearing: bearing + 90,
    );

    final sectionFrontRight = sectionRearRight.spherical
        .destinationPoint(distance: workingAreaLength, bearing: bearing);

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
  /// [fraction] is used to get the intermediate positions between the rear and
  /// the front of the section. 0 means the rear and 1 means the front
  /// Defaults to the rear, 0.
  ///
  /// ```
  ///  1    ---------
  ///       |       |
  ///       |       |
  /// 0.5   o-------o
  ///       |       |
  ///       |       |
  ///  0    ---------
  /// ```
  SectionEdgePositions sectionEdgePositions(
    int index, {
    double fraction = 0,
  }) {
    final points = sectionCornerPoints(index);

    return SectionEdgePositions(
      left: points[1]
          .spherical
          .intermediatePointTo(points[0], fraction: fraction),
      right: points[2]
          .spherical
          .intermediatePointTo(points[3], fraction: fraction),
    );
  }

  /// The center point of the given [section].
  Geographic sectionCenter(int section) {
    final points = sectionPoints(section);
    return points[0].spherical.midPointTo(points[2]);
  }

  /// The polygon for the given [section].
  Polygon sectionPolygon(int section) => Polygon(
        [
          PositionSeries.view(
            sectionPoints(section).map((e) => e.values).flattened.toList(),
          ),
        ],
      );

  /// The working polygon for the given [section].
  Polygon sectionWorkingPolygon(int section) => Polygon(
        [
          PositionSeries.view(
            sectionCornerPoints(section)
                .map((e) => e.values)
                .flattened
                .toList(),
          ),
        ],
      );

  /// An iterable of all the sections' polygons.
  Iterable<Polygon> get sectionPolygons =>
      Iterable.generate(sections.length, sectionPolygon).whereNotNull();

  /// An iterable of all the sections' working polygons.
  Iterable<Polygon> get sectionWorkingPolygons =>
      Iterable.generate(sections.length, sectionWorkingPolygon).whereNotNull();

  /// The map polygon for the [Section] with the given [index].
  map.Polygon sectionMapPolygon(int index) {
    final section = sections[index];

    return sectionPolygon(index).mapPolygon(
      borderStrokeWidth: 2,
      isFilled: section.active,
      borderColor: switch (section.active) {
        true => section.color?.brighten(30) ?? Colors.greenAccent,
        false => Colors.grey,
      },
      color: switch (section.active) {
        true => (section.color ?? Colors.green).withOpacity(0.8),
        false => Colors.grey.withOpacity(0.4),
      },
    );
  }

  /// The map polygon for the [Section]'s work area with the given [index].
  map.Polygon sectionWorkingMapPolygon(int index) {
    final section = sections[index];

    return sectionWorkingPolygon(index).mapPolygon(
      borderStrokeWidth: 2,
      isFilled: section.active,
      borderColor: switch (section.active) {
        true => section.color?.brighten(30) ?? Colors.greenAccent,
        false => Colors.grey,
      },
      color: switch (section.active) {
        true => (section.color ?? Colors.green).withOpacity(0.8),
        false => Colors.grey.withOpacity(0.4),
      },
    );
  }

  /// An iterable of all the sections' polygons.
  Iterable<map.Polygon> get sectionMapPolygons =>
      List.generate(sections.length, sectionMapPolygon, growable: false)
          .whereNotNull();

  /// An iterable of all the sections' working polygons.
  Iterable<map.Polygon> get sectionWorkingMapPolygons =>
      List.generate(sections.length, sectionWorkingMapPolygon, growable: false)
          .whereNotNull();

  /// A list of the polygon(s) for the drawbar(s).
  List<map.Polygon> get drawbarMapPolygons => switch (hitchType) {
        HitchType.towbar => [
            map.Polygon(
              borderStrokeWidth: 3,
              isFilled: true,
              color: Colors.grey.shade800,
              borderColor: Colors.black,
              points: [
                position.spherical
                    .destinationPoint(
                      distance: 0.05,
                      bearing: bearing - 90,
                    )
                    .latLng,
                drawbarEnd.spherical
                    .destinationPoint(
                      distance: 0.05,
                      bearing: bearing - 90,
                    )
                    .latLng,
                drawbarEnd.spherical
                    .destinationPoint(
                      distance: 0.05,
                      bearing: bearing + 90,
                    )
                    .latLng,
                position.spherical
                    .destinationPoint(
                      distance: 0.05,
                      bearing: bearing + 90,
                    )
                    .latLng,
              ],
            ),
          ],
        HitchType.fixed => [
            // Left hitch bar
            map.Polygon(
              borderStrokeWidth: 3,
              isFilled: true,
              color: Colors.grey.shade800,
              borderColor: Colors.black,
              points: [
                position.spherical
                    .destinationPoint(
                      distance: 0.35,
                      bearing: bearing - 90,
                    )
                    .latLng,
                drawbarEnd.spherical
                    .destinationPoint(
                      distance: 0.35,
                      bearing: bearing - 90,
                    )
                    .latLng,
                drawbarEnd.spherical
                    .destinationPoint(
                      distance: 0.3,
                      bearing: bearing - 90,
                    )
                    .latLng,
                position.spherical
                    .destinationPoint(
                      distance: 0.3,
                      bearing: bearing - 90,
                    )
                    .latLng,
              ],
            ),
            // Right hitch bar
            map.Polygon(
              borderStrokeWidth: 3,
              isFilled: true,
              color: Colors.grey.shade800,
              borderColor: Colors.black,
              points: [
                position.spherical
                    .destinationPoint(
                      distance: 0.35,
                      bearing: bearing + 90,
                    )
                    .latLng,
                drawbarEnd.spherical
                    .destinationPoint(
                      distance: 0.35,
                      bearing: bearing + 90,
                    )
                    .latLng,
                drawbarEnd.spherical
                    .destinationPoint(
                      distance: 0.3,
                      bearing: bearing + 90,
                    )
                    .latLng,
                position.spherical
                    .destinationPoint(
                      distance: 0.3,
                      bearing: bearing + 90,
                    )
                    .latLng,
              ],
            ),
          ]
      };

  /// A polygon drawing the decoration of the equipment.
  map.Polygon? get decorationPolygon {
    if (hitchToDecorationStartLength != null &&
        decorationLength != null &&
        decorationWidth != null) {
      final decorationStart = position.spherical
          .destinationPoint(
            distance: hitchToDecorationStartLength!,
            bearing: bearing - 180,
          )
          .spherical
          .destinationPoint(
            distance: decorationSidewaysOffset ?? 0,
            bearing: bearing + 90,
          );
      final decorationEnd = decorationStart.spherical.destinationPoint(
        distance: decorationLength!,
        bearing: bearing - 180,
      );

      final points = [
        decorationStart.spherical.destinationPoint(
          distance: decorationWidth! / 2,
          bearing: bearing + 90,
        ),
        decorationEnd.spherical.destinationPoint(
          distance: decorationWidth! / 2,
          bearing: bearing + 90,
        ),
        decorationEnd.spherical.destinationPoint(
          distance: decorationWidth! / 2,
          bearing: bearing - 90,
        ),
        decorationStart.spherical.destinationPoint(
          distance: decorationWidth! / 2,
          bearing: bearing - 90,
        ),
      ];

      return map.Polygon(
        isFilled: true,
        borderStrokeWidth: 3,
        color: Colors.grey.shade800.withOpacity(0.7),
        borderColor: Colors.black,
        points: points.map((e) => e.latLng).toList(),
      );
    }
    return null;
  }

  /// A list of all the polygons for the equipment, i.e. [drawbarMapPolygons]
  /// and all the [sectionMapPolygon]s.
  List<map.Polygon> get mapPolygons {
    return [
      ...drawbarMapPolygons,
      if (decorationPolygon != null) decorationPolygon!,
      // ...List.generate(
      //   sections.length,
      //   sectionMapPolygon,
      //   growable: false,
      // ),
      ...List.generate(
        sections.length,
        sectionWorkingMapPolygon,
        growable: false,
      ).whereNotNull(),
    ];
  }

  /// Properties used to check for equality.
  @override
  List<Object?> get props => [
        uuid,
        hitchType,
        sections,
        workingAreaLength,
        drawbarLength,
        position,
        bearing,
        velocity,
        hitchToChildFrontFixedHitchLength,
        hitchToChildRearFixedHitchLength,
        hitchToChildRearTowbarHitchLength,
      ];

  /// Returns a new [Equipment] based on this one, but with
  /// parameters/variables altered.
  @override
  Equipment copyWith({
    String? name,
    String? uuid,
    HitchType? hitchType,
    Hitchable? hitchParent,
    Hitchable? hitchFrontFixedChild,
    Hitchable? hitchRearFixedChild,
    Hitchable? hitchRearTowbarChild,
    List<Section>? sections,
    double? workingAreaLength,
    double? drawbarLength,
    double? sidewaysOffset,
    double? bearing,
    Geographic? position,
    double? hitchToChildFrontFixedHitchLength,
    double? hitchToChildRearFixedHitchLength,
    double? hitchToChildRearTowbarHitchLength,
    double? hitchToDecorationStartLength,
    double? decorationSidewaysOffset,
    double? decorationLength,
    double? decorationWidth,
    DateTime? lastUsed,
  }) =>
      Equipment(
        name: name ?? this.name,
        uuid: uuid ?? this.uuid,
        hitchType: hitchType ?? this.hitchType,
        hitchParent: hitchParent ?? this.hitchParent,
        hitchRearFixedChild: hitchRearFixedChild ?? this.hitchRearFixedChild,
        hitchRearTowbarChild: hitchRearTowbarChild ?? this.hitchRearTowbarChild,
        sections: sections ?? this.sections,
        workingAreaLength: workingAreaLength ?? this.workingAreaLength,
        drawbarLength: drawbarLength ?? this.drawbarLength,
        sidewaysOffset: sidewaysOffset ?? this.sidewaysOffset,
        position: position ?? this.position,
        bearing: bearing ?? this.bearing,
        hitchToChildFrontFixedHitchLength: hitchToChildFrontFixedHitchLength ??
            this.hitchToChildFrontFixedHitchLength,
        hitchToChildRearFixedHitchLength: hitchToChildRearFixedHitchLength ??
            this.hitchToChildRearFixedHitchLength,
        hitchToChildRearTowbarHitchLength: hitchToChildRearTowbarHitchLength ??
            this.hitchToChildRearTowbarHitchLength,
        hitchToDecorationStartLength:
            hitchToDecorationStartLength ?? this.hitchToDecorationStartLength,
        decorationLength: decorationLength ?? this.decorationLength,
        decorationWidth: decorationWidth ?? this.decorationWidth,
        decorationSidewaysOffset:
            decorationSidewaysOffset ?? this.decorationSidewaysOffset,
        lastUsed: lastUsed ?? this.lastUsed,
      );

  /// Converts the object to a json compatible structure.
  @override
  Map<String, dynamic> toJson() {
    final map = SplayTreeMap<String, dynamic>();

    map['info'] = {
      'name': name,
      'uuid': uuid,
      'last_used': lastUsed.toIso8601String(),
      'hitch_type': hitchType.name,
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
      'drawbar_length': drawbarLength,
      'sideways_offset': sidewaysOffset,
      'width': width,
      'working_area_length': workingAreaLength,
      'decoration': decoration,
    };

    map['sections'] = sections;

    map['hitches'] = {
      'hitch_to_child_front_fixed_hitch_length':
          hitchToChildFrontFixedHitchLength,
      'hitch_to_child_rear_fixed_hitch_length':
          hitchToChildRearFixedHitchLength,
      'hitch_to_child_rear_towbar_hitch_length':
          hitchToChildRearTowbarHitchLength,
    };

    return map;
  }
}
