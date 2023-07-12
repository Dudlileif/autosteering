import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  Field? build() => null;

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

/// A provider for the distance that the test [Field.border] should be buffered.
@Riverpod(keepAlive: true)
class TestFieldBufferDistance extends _$TestFieldBufferDistance {
  @override
  double build() => 5;

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the distance that the test [Field.holes] should be buffered.
@Riverpod(keepAlive: true)
class TestFieldHoleBufferDistance extends _$TestFieldHoleBufferDistance {
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
      distance: ref.watch(testFieldBufferDistanceProvider),
      holeDistance: ref.watch(testFieldHoleBufferDistanceProvider),
    );

    return field.copyWith(
      border: bufferedPolygon.points,
      holes: bufferedPolygon.holePointsList,
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
