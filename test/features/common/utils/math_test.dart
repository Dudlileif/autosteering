import 'package:autosteering/src/features/common/common.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Bearing', () {
    group('absolute difference', () {
      test('0 -> 270 = 90', () => expect(bearingDifference(0, 270), 90));

      test(
        '500 -> -100 = 120',
        () => expect(bearingDifference(500, -100), 120.0),
      );

      final testValues = <(double, double, double)>[
        (20, 45, 25),
        (-45, 45, 90),
        (-85, 90, 175),
        (-95, 90, 175),
        (-45, 125, 170),
        (-45, 145, 170),
        (29.4803, -88.6381, 118.11840000000001),
        (-78.3251, -159.036, 80.71089999999998),
        (-70099.74233810938, 29840.67437876723, 139.58328312338563),
        (-165313.6666297357, 33693.9894517456, 72.34391851868713),
        (1174.8380510598456, -154146.66490124757, 161.50295230740448),
        (60175.77306795546, 42213.07192354373, 37.29885558826936),
      ];

      for (final values in testValues) {
        test(
          '${values.$1} -> ${values.$2} = ${values.$3}',
          () => expect(
            bearingDifference(values.$1, values.$2),
            values.$3,
          ),
        );
      }
    });

    group('signed difference', () {
      test(
        '0 -> 270 = -90',
        () => expect(signedBearingDifference(0, 270), -90),
      );

      test(
        '500 -> -100 = 120',
        () => expect(signedBearingDifference(500, -100), 120),
      );
      final testValues = <(double, double, double)>[
        (20, 45, 25),
        (-45, 45, 90),
        (-85, 90, 175),
        (-95, 90, -175),
        (-45, 125, 170),
        (-45, 145, -170),
        (29.4803, -88.6381, -118.11840000000001),
        (-78.3251, -159.036, -80.71089999999998),
        (-70099.74233810938, 29840.67437876723, -139.58328312338563),
        (-165313.6666297357, 33693.9894517456, -72.34391851868713),
        (1174.8380510598456, -154146.66490124757, -161.50295230740448),
        (60175.77306795546, 42213.07192354373, 37.29885558826936),
      ];

      for (final values in testValues) {
        test(
          '${values.$1} -> ${values.$2} = ${values.$3}',
          () => expect(
            signedBearingDifference(values.$1, values.$2),
            values.$3,
          ),
        );
      }
    });
  });
}
