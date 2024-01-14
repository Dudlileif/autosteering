/// Partial port of the GeographicLib Geoid height
/// For more information, see https://geographiclib.sourceforge.io/,
/// https://github.com/geographiclib/geographiclib/blob/main/include/GeographicLib/Geoid.hpp
/// and https://github.com/geographiclib/geographiclib/blob/main/src/Geoid.cpp
library geoid;

import 'package:autosteering/src/features/common/common.dart';
import 'package:flutter/services.dart';

/// A geoid object used for calculation the height of the geoid above the
/// WGS84 ellipsoid by interpolating values from an earth gravity model.
///
/// Partial port of the GeographicLib Geoid object
/// https://github.com/geographiclib/geographiclib/blob/main/src/Geoid.cpp#L201
class Geoid {
  /// Private empty constructor to use with a future function for delivering
  /// an already loaded object.
  Geoid._();

  /// Loads and returns a ready to use [Geoid] object if it successfully
  /// loads the data file for EGM96-5 minute grid.
  static Future<Geoid?> egm96_5() async {
    final geoid = Geoid._();
    if (await geoid._loadData()) {
      return geoid;
    }
    return null;
  }

  ByteData? _data;
  var _headerLength = 0;
  var _dataWidth = 0;
  var _dataHeight = 0;
  var _offset = 0;
  var _scale = 0.0;
  var _levels = 0;
  var _latRes = 0.0;
  var _lonRes = 0.0;

  int? _prevImageX;
  int? _prevImageY;

  var _v = <int>[];
  final _t = <double>[];

  /// Attempts to load the EGM96-5 data file for the geoid object.
  Future<bool> _loadData() async {
    Logger.instance
        .i('Attempting to load egm data file: assets/egm/egm96-5.pgm');
    try {
      _data = await rootBundle.load('assets/egm/egm96-5.pgm');
      if (_data != null) {
        final headerLines =
            String.fromCharCodes(Uint8List.sublistView(_data!), 0, 1000)
                .split('\n');

        if (headerLines.first.isEmpty) {
          throw Exception('No PGM header');
        }
        // Add +1 to account for the removed '\n' character
        _headerLength = headerLines.first.length + 1;
        headerLines.removeAt(0);

        for (final line in headerLines) {
          if (line.isEmpty) {
            throw Exception('File header end not found.');
          }
          _headerLength += line.length + 1;
          if (line.startsWith('# Offset ')) {
            _offset = int.parse(line.substring(9));
          } else if (line.startsWith('# Scale ')) {
            _scale = double.parse(line.substring(8));
          } else if (!line.startsWith('#')) {
            final split = line.split(' ');
            if (split.length > 1) {
              _dataWidth = int.parse(split.first);
              _dataHeight = int.parse(split.last);
            } else if (split.length == 1) {
              _levels = int.parse(split.first);
              break;
            }
          }
        }

        if (_levels != 65535) {
          throw Exception(
            'PGM file must have 65535 gray levels, $_levels found.',
          );
        }

        if (_dataWidth < 2 || _dataHeight < 2) {
          throw Exception(
            'PGM file raster size too small, $_dataWidth x $_dataHeight.',
          );
        }
        final fileSize = _data!.lengthInBytes;
        final calculatedSize = 2 * _dataWidth * _dataHeight + _headerLength;
        if (fileSize != calculatedSize) {
          throw Exception(
            '''PGM file has the wrong size, expected: $fileSize bytes, found: $calculatedSize bytes''',
          );
        }
        _lonRes = _dataWidth / 360;
        _latRes = (_dataHeight - 1) / 180;

        Logger.instance.i('Loaded egm data: assets/egm/egm96-5-pgm');
        return true;
      }
    } catch (error, stackTrace) {
      Logger.instance.e(
        'Failed loading egm data: assets/egm/egm96-5.pgm',
        stackTrace: stackTrace,
        error: error,
      );
    }

    return false;
  }

  static const _c0 = 240;
  static const _c3 = [
    [9, -18, -88, 0, 96, 90, 0, 0, -60, -20],
    [-9, 18, 8, 0, -96, 30, 0, 0, 60, -20],
    [9, -88, -18, 90, 96, 0, -20, -60, 0, 0],
    [186, -42, -42, -150, -96, -150, 60, 60, 60, 60],
    [54, 162, -78, 30, -24, -90, -60, 60, -60, 60],
    [-9, -32, 18, 30, 24, 0, 20, -60, 0, 0],
    [-9, 8, 18, 30, -96, 0, -20, 60, 0, 0],
    [54, -78, 162, -90, -24, 30, 60, -60, 60, -60],
    [-54, 78, 78, 90, 144, 90, -60, -60, -60, -60],
    [9, -8, -18, -30, -24, 0, 20, 60, 0, 0],
    [-9, 18, -32, 0, 24, 30, 0, 0, -60, 20],
    [9, -18, -8, 0, -24, -30, 0, 0, 60, 20],
  ];

  static const _c0n = 372;
  static const _c3n = [
    [0, 0, -131, 0, 138, 144, 0, 0, -102, -31],
    [0, 0, 7, 0, -138, 42, 0, 0, 102, -31],
    [62, 0, -31, 0, 0, -62, 0, 0, 0, 31],
    [124, 0, -62, 0, 0, -124, 0, 0, 0, 62],
    [124, 0, -62, 0, 0, -124, 0, 0, 0, 62],
    [62, 0, -31, 0, 0, -62, 0, 0, 0, 31],
    [0, 0, 45, 0, -183, -9, 0, 93, 18, 0],
    [0, 0, 216, 0, 33, 87, 0, -93, 12, -93],
    [0, 0, 156, 0, 153, 99, 0, -93, -12, -93],
    [0, 0, -45, 0, -3, 9, 0, 93, -18, 0],
    [0, 0, -55, 0, 48, 42, 0, 0, -84, 31],
    [0, 0, -7, 0, -48, -42, 0, 0, 84, 31],
  ];

  static const _c0s = 372;
  static const _c3s = [
    [18, -36, -122, 0, 120, 135, 0, 0, -84, -31],
    [-18, 36, -2, 0, -120, 51, 0, 0, 84, -31],
    [36, -165, -27, 93, 147, -9, 0, -93, 18, 0],
    [210, 45, -111, -93, -57, -192, 0, 93, 12, 93],
    [162, 141, -75, -93, -129, -180, 0, 93, -12, 93],
    [-36, -21, 27, 93, 39, 9, 0, -93, -18, 0],
    [0, 0, 62, 0, 0, 31, 0, 0, 0, -31],
    [0, 0, 124, 0, 0, 62, 0, 0, 0, -62],
    [0, 0, 124, 0, 0, 62, 0, 0, 0, -62],
    [0, 0, 62, 0, 0, 31, 0, 0, 0, -31],
    [-18, 36, -64, 0, 66, 51, 0, 0, -102, 31],
    [18, -36, 2, 0, -66, -51, 0, 0, 102, 31],
  ];

  /// Finds the raw pixel value of the data image at coordinates
  /// [imageX], [imageY].
  ///
  /// https://github.com/geographiclib/geographiclib/blob/main/include/GeographicLib/Geoid.hpp#L127
  int _rawValue(int imageX, int imageY) {
    var ix = imageX;
    var iy = imageY;

    if (ix < 0) {
      ix += _dataWidth;
    } else if (ix >= _dataWidth) {
      ix -= _dataWidth;
    }

    if (iy < 0) {
      iy = iy;
      ix += _dataWidth ~/ 2;
    } else if (iy > _dataHeight) {
      iy = 2 * (_dataHeight - 1) - iy;
      ix += _dataWidth ~/ 2;
    }

    return _data != null
        ? _data!.getUint16(
            2 * (iy * _dataWidth + ix) + _headerLength,
          )
        : 0;
  }

  /// Finds the height of the geoid at the location with latitude [lat] and
  /// longitude [lon].
  ///
  /// [cubicInterpolation] is set to use cubic interpolation of 12 data points
  /// to get a better estimate. Otherwise linear interpolation between four
  /// points is used.
  ///
  /// Port of the GeographicLib function:
  /// https://github.com/geographiclib/geographiclib/blob/main/src/Geoid.cpp#L306
  double height({
    required double lat,
    required double lon,
    bool cubicInterpolation = true,
  }) {
    if (_data == null) {
      return 0;
    }

    // https://github.com/vandry/geoidheight/blob/master/geoid.py
    var lon0 = lon;
    if (lon < 0) {
      lon0 += 360;
    }
    var fy = (90 - lat) * _latRes;
    var fx = lon0 * _lonRes;
    var imageY = fy.toInt();
    final imageX = fx.toInt();
    fy -= imageY;
    fx -= imageX;

    if (imageY == (_dataHeight - 1)) {
      imageY -= 1;
    }

    if (imageX != _prevImageX || imageY != _prevImageY) {
      _prevImageX = imageX;
      _prevImageY = imageY;

      if (!cubicInterpolation) {
        _v = [
          _rawValue(imageX, imageY),
          _rawValue(imageX + 1, imageY),
          _rawValue(imageX, imageY + 1),
          _rawValue(imageX + 1, imageY + 1),
        ];
      } else {
        _v = [
          _rawValue(imageX, imageY - 1),
          _rawValue(imageX + 1, imageY - 1),
          _rawValue(imageX - 1, imageY),
          _rawValue(imageX, imageY),
          _rawValue(imageX + 1, imageY),
          _rawValue(imageX + 2, imageY),
          _rawValue(imageX - 1, imageY + 1),
          _rawValue(imageX, imageY + 1),
          _rawValue(imageX + 1, imageY + 1),
          _rawValue(imageX + 2, imageY + 1),
          _rawValue(imageX, imageY + 2),
          _rawValue(imageX + 1, imageY + 2),
        ];

        late final List<List<int>> c3x;
        late final int c0x;
        if (imageY == 0) {
          c3x = _c3n;
          c0x = _c0n;
        } else if (imageY == (_dataHeight - 2)) {
          c3x = _c3s;
          c0x = _c0s;
        } else {
          c3x = _c3;
          c0x = _c0;
        }

        for (var i = 0; i < 10; i++) {
          if (_t.length < i + 1) {
            _t.add(0);
          }
          _t[i] = 0;
          for (var j = 0; j < 12; j++) {
            _t[i] += _v[j] * c3x[j][i];
          }
          _t[i] /= c0x;
        }
      }
    }

    late final double h;
    if (!cubicInterpolation) {
      final a = (1 - fx) * _v[0] + fx * _v[1];
      final b = (1 - fx) * _v[2] + fx * _v[3];
      h = (1 - fy) * a + fy * b;
    } else {
      h = _t[0] +
          fx * (_t[1] + fx * (_t[3] + fx * _t[6])) +
          fy *
              (_t[2] +
                  fx * (_t[4] + fx * _t[7]) +
                  fy * (_t[5] + fx * _t[8] + fy * _t[9]));
    }

    return _offset + _scale * h;
  }
}
