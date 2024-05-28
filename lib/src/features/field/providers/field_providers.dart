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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/work_session/work_session.dart';
import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:geobase/geobase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'field_providers.g.dart';

/// A provider for whether the active field should be shown.
@Riverpod(keepAlive: true)
class ShowField extends _$ShowField {
  @override
  bool build() => true;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for the active field.
@Riverpod(keepAlive: true)
class ActiveField extends _$ActiveField {
  @override
  Field? build() {
    ref
      ..onDispose(() => Logger.instance.i('Closed active field.'))
      ..listenSelf((previous, next) {
        if (next != null) {
          Logger.instance.i('Loaded active field: ${next.name}.');
          ref.read(fieldBufferEnabledProvider.notifier).update(value: false);
          if (ref.read(
            activeWorkSessionProvider
                .select((value) => value != null && value.field == null),
          )) {
            ref.read(activeWorkSessionProvider.notifier).updateField(next);
          }
        }
      });

    return null;
  }

  /// Update the [state] to [field].
  void update(Field? field) => Future(() => state = field);
}

/// A provider for whether the active field's border's points should be shown.
@Riverpod(keepAlive: true)
class ShowFieldBorderPoints extends _$ShowFieldBorderPoints {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for whether bounding box of the active field should be shown.
@Riverpod(keepAlive: true)
class ShowFieldBoundingBox extends _$ShowFieldBoundingBox {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for which type of join should be used when buffering the
/// exterior.
@Riverpod(keepAlive: true)
class FieldExteriorBufferJoin extends _$FieldExteriorBufferJoin {
  @override
  BufferJoin build() => BufferJoin.round;

  /// Update the [state] to [value].
  void update(BufferJoin value) => Future(() => state = value);

  /// Go to the next value of [BufferJoin.values].
  void toggle() => Future(
        () => state = BufferJoin.values[
            (BufferJoin.values.indexOf(state) + 1) % BufferJoin.values.length],
      );
}

/// A provider for which type of join should be used when buffering the
/// interior holes.
@Riverpod(keepAlive: true)
class FieldInteriorBufferJoin extends _$FieldInteriorBufferJoin {
  @override
  BufferJoin build() => BufferJoin.round;

  /// Update the [state] to [value].
  void update(BufferJoin value) => Future(() => state = value);

  /// Go to the next value of [BufferJoin.values].
  void toggle() => Future(
        () => state = BufferJoin.values[
            (BufferJoin.values.indexOf(state) + 1) % BufferJoin.values.length],
      );
}

/// Whether the field buffer functionality should be enabled.
@Riverpod(keepAlive: true)
class FieldBufferEnabled extends _$FieldBufferEnabled {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for which type of field buffer distance should be used.
@Riverpod(keepAlive: true)
class ActiveFieldBufferDistanceType extends _$ActiveFieldBufferDistanceType {
  @override
  FieldBufferDistanceType build() => FieldBufferDistanceType.equipmentWidths;

  /// Update the [state] to [value].
  void update(FieldBufferDistanceType value) => Future(() => state = value);
}

/// A provider for the distance that the [Field.polygon] exterior should
/// be buffered.
@Riverpod(keepAlive: true)
class FieldExteriorBufferDistance extends _$FieldExteriorBufferDistance {
  @override
  double build() =>
      -0.5 *
      (ref.read(
            allEquipmentsProvider.select(
              (value) => value.values
                  .firstWhereOrNull((element) => element.width > 0)
                  ?.width,
            ),
          ) ??
          10);

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the distance that the [Field.polygon] interior should
/// be buffered.
@Riverpod(keepAlive: true)
class FieldInteriorBufferDistance extends _$FieldInteriorBufferDistance {
  @override
  double build() =>
      0.5 *
      (ref.read(
            allEquipmentsProvider.select(
              (value) => value.values
                  .firstWhereOrNull((element) => element.width > 0)
                  ?.width,
            ),
          ) ??
          10);

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for whether the buffered field should be shown.
@Riverpod(keepAlive: true)
class ShowBufferedField extends _$ShowBufferedField {
  @override
  bool build() => true;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for creating and updating the buffered test field.
@Riverpod(keepAlive: true)
Future<Field?> bufferedField(BufferedFieldRef ref) async {
  ref.onDispose(() => Logger.instance.i('Closed buffered field.'));

  if (!ref.watch(fieldBufferEnabledProvider)) {
    return null;
  }
  final field = ref.watch(activeFieldProvider);
  if (field != null) {
    final exteriorDistance = ref.watch(fieldExteriorBufferDistanceProvider);
    final interiorDistance = ref.watch(fieldInteriorBufferDistanceProvider);
    final exteriorJoinType = ref.watch(fieldExteriorBufferJoinProvider);
    final interiorJoinType = ref.watch(fieldInteriorBufferJoinProvider);
    final getRawPoints = ref.watch(fieldBufferGetRawPointsProvider);

    ref.listenSelf((previous, next) {
      final bufferSpecs = {
        'exteriorDistance': exteriorDistance,
        'interiorDistance': interiorDistance,
        'exteriorJoinType': exteriorJoinType,
        'interiorJoinType': interiorJoinType,
        'getRawPoints': getRawPoints,
      };

      next.when(
        data: (data) {
          if (data != null) {
            Logger.instance.i('Buffered field ${data.name} with $bufferSpecs.');
          }
        },
        error: (error, stackTrace) => Logger.instance.e(
          'Error when buffering field ${field.name} with $bufferSpecs',
          error: error,
          stackTrace: stackTrace,
        ),
        loading: () {},
      );
    });

    late final Polygon bufferedPolygon;
    if (Device.isWeb) {
      bufferedPolygon = field.polygon.bufferedPolygon(
        exteriorDistance: exteriorDistance,
        interiorDistance: interiorDistance,
        exteriorJoinType: exteriorJoinType,
        interiorJoinType: interiorJoinType,
        getRawPoints: getRawPoints,
      );
    } else {
      final polygonString = field.polygon.toString();

      final json = await Future(
        () => jsonEncode({
          'polygon': polygonString,
          'exterior_distance': exteriorDistance,
          'interior_distance': interiorDistance,
          'exterior_join_type': exteriorJoinType.name,
          'interior_join_type': interiorJoinType.name,
          'get_raw_points': getRawPoints,
        }),
      );

      bufferedPolygon = Polygon.parse(
        await compute(
          PolygonBufferExtension.bufferedPolygonFromJson,
          json,
          debugLabel: 'Field Buffering: ${field.name}',
        ),
      );
    }

    return field.copyWith(
      polygon: bufferedPolygon,
      boundingBox: bufferedPolygon.exterior != null &&
              (!bufferedPolygon.exterior!.isEmptyByGeometry)
          ? GeoBox.from(bufferedPolygon.exterior!.toGeographicPositions)
          : null,
    );
  }
  return null;
}

/// A provider for whether bounding box of the test field should be shown.
@Riverpod(keepAlive: true)
class ShowBufferedFieldBoundingBox extends _$ShowBufferedFieldBoundingBox {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state = !state);
}

/// A provider for whether bounding box of the field should be shown.
@Riverpod(keepAlive: true)
class FieldBufferGetRawPoints extends _$FieldBufferGetRawPoints {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state = !state);
}

/// A provider for the recorded exterior ring of a field.
@Riverpod(keepAlive: true)
class FieldExteriorRing extends _$FieldExteriorRing {
  @override
  List<Geographic>? build() => null;

  /// Updates [state] to [value].
  void update(List<Geographic>? value) => Future(() => state = value);
}

/// A provider for the recorded interior rings of a field.
@Riverpod(keepAlive: true)
class FieldInteriorRings extends _$FieldInteriorRings {
  @override
  List<List<Geographic>>? build() => null;

  /// Updates [state] to [value].
  void update(List<List<Geographic>>? value) => Future(() => state = value);

  /// Adds an interior [ring] to the [state], will be skipped if it already
  /// is in list of rings.
  void addRing(List<Geographic>? ring) => Future(() {
        if (ring != null) {
          if (state == null) {
            state = [ring];
          } else if (state != null) {
            var exists = false;
            for (final other in state!) {
              if (const DeepCollectionEquality().equals(ring, other)) {
                exists = true;
              }
            }
            if (!exists) {
              state = [...?state, ring];
            }
          }
        }
      });
}

/// A provider for saving [field] to a file in the user file directory.
///
/// Override the file name with [overrideName].
@riverpod
Future<void> saveField(
  SaveFieldRef ref,
  Field field, {
  String? overrideName,
  bool downloadIfWeb = false,
}) async =>
    ref.watch(
      saveJsonToFileDirectoryProvider(
        object: field,
        fileName: overrideName ?? field.name,
        folder: 'fields',
        downloadIfWeb: downloadIfWeb,
      ).future,
    );

/// A provider for exporting [field] to a file.
///
/// Override the file name with [overrideName].
@riverpod
Future<void> exportField(
  ExportFieldRef ref,
  Field field, {
  String? overrideName,
  bool downloadIfWeb = true,
}) async =>
    await ref.watch(
      exportJsonToFileDirectoryProvider(
        object: field,
        fileName: overrideName ?? field.name,
        folder: 'fields',
        downloadIfWeb: downloadIfWeb,
      ).future,
    );

/// A provider for reading and holding all the saved [Field]s in the
/// user file directory.
@Riverpod(keepAlive: true)
FutureOr<List<Field>> savedFields(SavedFieldsRef ref) async => await ref
    .watch(
      savedFilesProvider(fromJson: Field.fromJson, folder: 'fields').future,
    )
    .then((data) => data.cast());

/// A provider for deleting [field] from the user file system.
///
/// Override the file name with [overrideName].
@riverpod
FutureOr<void> deleteField(
  DeleteFieldRef ref,
  Field field, {
  String? overrideName,
}) async =>
    ref.watch(
      deleteJsonFromFileDirectoryProvider(
        fileName: overrideName ?? field.name,
        folder: 'fields',
      ).future,
    );

/// A provider for loading a [Field] from a file at [path], if it's valid.
@riverpod
FutureOr<Field?> loadFieldFromFile(
  LoadFieldFromFileRef ref,
  String path,
) async {
  final file = File(path);
  if (file.existsSync()) {
    try {
      final json = jsonDecode(await file.readAsString());
      return Field.fromJson(Map<String, dynamic>.from(json as Map));
    } catch (error, stackTrace) {
      Logger.instance.w(
        'Failed to load field from: $path.',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
  return null;
}

/// A provider for importing a field from a file and applying
/// [ActiveField] provider.
@riverpod
FutureOr<Field?> importField(
  ImportFieldRef ref,
) async {
  ref.keepAlive();
  Timer(
    const Duration(seconds: 5),
    ref.invalidateSelf,
  );
  final pickedFiles = await FilePicker.platform.pickFiles(
    allowedExtensions: ['json'],
    type: FileType.custom,
    dialogTitle: 'Choose field file',
  );

  Field? field;
  if (Device.isWeb) {
    final data = pickedFiles?.files.first.bytes;
    if (data != null) {
      try {
        final json = jsonDecode(String.fromCharCodes(data));
        field = Field.fromJson(Map<String, dynamic>.from(json as Map));
      } catch (error, stackTrace) {
        Logger.instance.w(
          'Failed to import field.',
          error: error,
          stackTrace: stackTrace,
        );
      }
    } else {
      Logger.instance.w(
        'Failed to import field, data is null.',
      );
    }
  } else {
    final filePath = pickedFiles?.paths.first;
    if (filePath != null) {
      field = await ref.watch(loadFieldFromFileProvider(filePath).future);
    } else {
      Logger.instance.w('Failed to import field: $filePath.');
    }
  }
  if (field != null) {
    Logger.instance.i(
      'Imported field: ${field.name}.',
    );
    field.lastUsed = DateTime.now();
    ref.read(activeFieldProvider.notifier).update(field);
    await ref.watch(saveFieldProvider(field).future);
  }

  return field;
}
