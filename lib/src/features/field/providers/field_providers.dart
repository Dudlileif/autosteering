import 'dart:convert';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:geobase/geobase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'field_providers.g.dart';

/// A provider for whether the test field should be shown.
@Riverpod(keepAlive: true)
class ShowTestField extends _$ShowTestField {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for a test field.
@Riverpod(keepAlive: true)
class TestField extends _$TestField {
  @override
  Field? build() {
    if (!Device.isWeb) {
      final dir = ref.watch(fileDirectoryProvider).requireValue;
      final file = File([dir.path, '/fields/test.json'].join());
      if (file.existsSync()) {
        final decoded = jsonDecode(file.readAsStringSync());
        if (decoded is Map) {
          return Field.fromJson(Map<String, dynamic>.from(decoded));
        }
      }
    }
    return null;
  }

  /// Update the [state] to [field].
  void update(Field field) => Future(() => state = field);
}

/// A provider for whether bounding box of the test field should be shown.
@Riverpod(keepAlive: true)
class ShowTestFieldBoundingBox extends _$ShowTestFieldBoundingBox {
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
class TestFieldExteriorBufferJoin extends _$TestFieldExteriorBufferJoin {
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
class TestFieldInteriorBufferJoin extends _$TestFieldInteriorBufferJoin {
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
class TestFieldExteriorBufferDistance
    extends _$TestFieldExteriorBufferDistance {
  @override
  double build() => 5;

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the distance that the test [Field.polygon] interior should
/// be buffered.
@Riverpod(keepAlive: true)
class TestFieldInteriorBufferDistance
    extends _$TestFieldInteriorBufferDistance {
  @override
  double build() => 5;

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for whether the buffered test field should be shown.
@Riverpod(keepAlive: true)
class ShowBufferedTestField extends _$ShowBufferedTestField {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for creating and updating the buffered test field.
@riverpod
Field? bufferedTestField(BufferedTestFieldRef ref) {
  final field = ref.watch(testFieldProvider);
  if (field != null) {
    final bufferedPolygon = field.polygon.bufferedPolygon(
      exteriorDistance: ref.watch(testFieldExteriorBufferDistanceProvider),
      interiorDistance: ref.watch(testFieldInteriorBufferDistanceProvider),
      exteriorJoinType: ref.watch(testFieldExteriorBufferJoinProvider),
      interiorJoinType: ref.watch(testFieldInteriorBufferJoinProvider),
      getRawPoints: ref.watch(testFieldBufferGetRawPointsProvider),
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
class ShowBufferedTestFieldBoundingBox
    extends _$ShowBufferedTestFieldBoundingBox {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state = !state);
}

/// A provider for whether bounding box of the test field should be shown.
@Riverpod(keepAlive: true)
class TestFieldBufferGetRawPoints extends _$TestFieldBufferGetRawPoints {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current state.
  void toggle() => Future(() => state = !state);
}
