import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'path_recording_providers.g.dart';

const calculator = Distance(roundResult: false);

@Riverpod(keepAlive: true)
class EnablePathRecorder extends _$EnablePathRecorder {
  @override
  bool build() => false;

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state != state);
}

@Riverpod(keepAlive: true)
class PathRecordingList extends _$PathRecordingList {
  @override
  List<LatLng> build() {
    final points = <LatLng>[];

    ref.listen(enablePathRecorderProvider, (prevDoRecord, doRecord) async {
      if (doRecord) {
        ref.listen(mainVehicleProvider.select((vehicle) => vehicle.position),
            (prevPosition, position) async {
          if (prevPosition != position) {
            if (points.isNotEmpty) {
              final distance = calculator.distance(points.last, position);
              if (distance > 20) {
                await add(position);
              } else if (distance > 1 && points.length >= 2) {
                final prevHeading =
                    calculator.bearing(points[points.length - 2], points.last);
                final heading = calculator.bearing(points.last, position);

                final headingDiff = (prevHeading - heading).abs();

                if (headingDiff > 1) {
                  await add(position);
                }
              } else if (points.length < 2 && distance > 1) {
                await add(position);
              }
            } else {
              await add(position);
            }
          }
        });
      } else if (prevDoRecord != null) {
        if (prevDoRecord && !doRecord) {
          if (state.isNotEmpty) {
            final position = ref.read(
              mainVehicleProvider.select((vehicle) => vehicle.position),
            );
            if (state.last != position) {
              await add(position);
            }
            ref.read(finishedPathRecordingListProvider.notifier).update(points);
            ref.read(showFinishedPathProvider.notifier).update(value: true);
          }
          ref.invalidateSelf();
        }
      }
    });

    return points;
  }

  Future<void> add(LatLng point) => Future(() => state.add(point));

  void clear() => Future(() => state.clear());
}

@Riverpod(keepAlive: true)
class FinishedPathRecordingList extends _$FinishedPathRecordingList {
  @override
  List<LatLng>? build() => null;

  void update(List<LatLng> points) => Future(() => state = points);
  void movePoint(int index, LatLng point) => Future(
        () => state = state
          ?..insert(index, point)
          ..removeAt(index + 1),
      );
  void clear() => Future(() => state = null);

  @override
  bool updateShouldNotify(List<LatLng>? previous, List<LatLng>? next) => true;
}

@Riverpod(keepAlive: true)
class ShowFinishedPath extends _$ShowFinishedPath {
  @override
  bool build() => false;

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state != state);
}

@Riverpod(keepAlive: true)
class ShowFinishedPolygon extends _$ShowFinishedPolygon {
  @override
  bool build() => false;

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state != state);
}

@Riverpod(keepAlive: true)
class EditFinishedPath extends _$EditFinishedPath {
  @override
  bool build() => false;

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state != state);
}
