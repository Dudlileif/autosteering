import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:geobase/geobase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'field_providers.g.dart';

/// A provider for whether the active field should be shown.
@Riverpod(keepAlive: true)
class ShowField extends _$ShowField {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for the active field.
@Riverpod(keepAlive: true)
class ActiveField extends _$ActiveField {
  @override
  Field? build() => null;

  /// Update the [state] to [field].
  void update(Field field) => Future(() => state = field);
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

/// A provider for the distance that the test [Field.polygon] exterior should
/// be buffered.
@Riverpod(keepAlive: true)
class FieldExteriorBufferDistance extends _$FieldExteriorBufferDistance {
  @override
  double build() => 5;

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the distance that the test [Field.polygon] interior should
/// be buffered.
@Riverpod(keepAlive: true)
class FieldInteriorBufferDistance extends _$FieldInteriorBufferDistance {
  @override
  double build() => 5;

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for whether the buffered test field should be shown.
@Riverpod(keepAlive: true)
class ShowBufferedField extends _$ShowBufferedField {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for creating and updating the buffered test field.
@riverpod
Field? bufferedField(BufferedFieldRef ref) {
  final field = ref.watch(activeFieldProvider);
  if (field != null) {
    final bufferedPolygon = field.polygon.bufferedPolygon(
      exteriorDistance: ref.watch(fieldExteriorBufferDistanceProvider),
      interiorDistance: ref.watch(fieldInteriorBufferDistanceProvider),
      exteriorJoinType: ref.watch(fieldExteriorBufferJoinProvider),
      interiorJoinType: ref.watch(fieldInteriorBufferJoinProvider),
      getRawPoints: ref.watch(fieldBufferGetRawPointsProvider),
    );

    return field.copyWith(
      polygon: bufferedPolygon,
      boundingBox: bufferedPolygon.exterior != null &&
              (bufferedPolygon.exterior?.isNotEmpty ?? false)
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

/// A provider for whether bounding box of the test field should be shown.
@Riverpod(keepAlive: true)
class FieldBufferGetRawPoints extends _$FieldBufferGetRawPoints {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state = !state);
}

/// A provider for saving [field] to a file in the user file directory.
///
/// Override the file name with [overrideName].
@riverpod
AsyncValue<void> saveField(
  SaveFieldRef ref,
  Field field, {
  String? overrideName,
}) =>
    ref.watch(
      saveJsonToFileDirectoryProvider(
        object: field,
        fileName: overrideName ?? field.name,
        folder: 'fields',
      ),
    );

/// A provider for reading and holding all the saved [Field]s in the
/// user file directory.
@Riverpod(keepAlive: true)
AsyncValue<List<Field>> savedFields(SavedFieldsRef ref) => ref
    .watch(savedFilesProvider(fromJson: Field.fromJson, folder: 'fields'))
    .whenData((data) => data.cast());
