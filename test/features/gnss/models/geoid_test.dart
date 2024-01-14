import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final geoid = await Geoid.egm96_5();

  test('Load geoid egm96_5 from assets.', () => expect(geoid != null, true));
  group('Geoid height', () {
    if (geoid != null) {
      final lat = List.generate(6, (index) => -80 + index * 160 / 5);
      final lon = List.generate(6, (index) => -160 + index * 320 / 5);

      group('Cubic', () {
        final heights = [
          -52.415775,
          -6.432450000000003,
          -7.577887500000003,
          3.059212500000015,
          -46.6918875,
          0.6332249999999959,
        ];
        for (var i = 0; i < 6; i++) {
          test(
            'Lat: ${lat[i]}, Lon: ${lon[i]} -> Height: ${heights[i]}',
            () => expect(geoid.height(lat: lat[i], lon: lon[i]), heights[i]),
          );
        }
      });

      group('Non-cubuc', () {
        final heights = [
          -52.416,
          -6.432000000000002,
          -7.578000000000003,
          3.0600000000000023,
          -46.692,
          0.6329999999999956,
        ];
        for (var i = 0; i < 6; i++) {
          test(
            'Lat: ${lat[i]}, Lon: ${lon[i]} -> Height: ${heights[i]}',
            () => expect(
              geoid.height(
                lat: lat[i],
                lon: lon[i],
                cubicInterpolation: false,
              ),
              heights[i],
            ),
          );
        }
      });
    }
  });
}
