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

import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// An icon with extendable menu for showing the status of the GNSS fix quality.
///
/// A detailed overlay can be toggled by pressing/tapping the icon.
class GnssQualityStatusIcon extends ConsumerStatefulWidget {
  /// An icon with extendable menu for showing the status of the GNSS fix
  /// quality.
  ///
  /// A detailed overlay can be toggled on and off by pressing/tapping the icon.
  ///
  /// [size] if the size of the icon.
  const GnssQualityStatusIcon({super.key, this.size});

  /// The size of the icon.
  final double? size;

  @override
  ConsumerState<GnssQualityStatusIcon> createState() =>
      _GnssQualityStatusIconState();
}

class _GnssQualityStatusIconState extends ConsumerState<GnssQualityStatusIcon> {
  Geoid? geoid;

  final OverlayPortalController portalController = OverlayPortalController();

  String get message {
    final nmea = ref.watch(gnssCurrentSentenceProvider);

    final textLines = <String>[];
    if (nmea?.posMode != null) {
      textLines.add(
        '''${nmea?.fixQuality?.name ?? GnssFixQuality.notAvailable.name} | ${nmea?.posMode}''',
      );
    } else if (nmea?.ubxNavStatus != null) {
      textLines.add(
        '''${nmea?.fixQuality?.name ?? GnssFixQuality.notAvailable.name} | ${nmea?.ubxNavStatus}''',
      );
    } else {
      textLines.add(nmea?.fixQuality?.name ?? GnssFixQuality.notAvailable.name);
    }

    final latitude = nmea?.latitude;
    if (latitude != null) {
      textLines.add('Lat: ${latitude.toStringAsFixed(9)}');
    }
    final longitude = nmea?.longitude;
    if (longitude != null) {
      textLines.add('Lon: ${longitude.toStringAsFixed(9)}');
    }
    final hdop = nmea?.hdop;
    if (hdop != null) {
      textLines.add('HDOP: $hdop');
    }
    final vdop = nmea?.vdop;
    if (vdop != null) {
      textLines.add('VDOP: $vdop');
    }
    final tdop = nmea?.tdop;
    if (tdop != null) {
      textLines.add('TDOP: $tdop');
    }
    final horizontalAccuracy = nmea?.horizontalAccuracy;
    if (horizontalAccuracy != null) {
      textLines.add('Pos. Acc: $horizontalAccuracy m');
    }
    final verticalAccuracy = nmea?.verticalAccuracy;
    if (verticalAccuracy != null) {
      textLines.add('Alt. Acc: $verticalAccuracy m');
    }
    final altitude = nmea?.altitudeMSL;
    final geoidSep = nmea?.geoidSeparation;
    if (altitude != null) {
      if (geoidSep != null) {
        if (geoid != null && latitude != null && longitude != null) {
          textLines.add(
            '''Altitude MSL: ${(altitude + geoidSep - geoid!.height(lat: latitude, lon: longitude)).toStringAsFixed(1)} m''',
          );
        } else {
          Geoid.egm96_5().then((value) => geoid = value);
          textLines.add('Altitude MSL: ${altitude.toStringAsFixed(1)} m');
        }
      } else {
        textLines.add('Altitude MSL: ${altitude.toStringAsFixed(1)} m');
      }
    }
    final altitudeRef = nmea?.altitudeRef;
    if (altitudeRef != null &&
        nmea?.latitude != null &&
        nmea?.longitude != null) {
      textLines.add('Altitude HAE: ${altitudeRef.toStringAsFixed(1)} m');

      if (geoid != null && latitude != null && longitude != null) {
        textLines.add(
          '''Altitude MSL: ${(altitudeRef - geoid!.height(lat: latitude, lon: longitude)).toStringAsFixed(1)} m''',
        );
      } else {
        Geoid.egm96_5().then((value) => geoid = value);
      }
    }

    final age = nmea?.ageOfDifferentialData;
    if (age != null) {
      textLines.add('Diff age: ${age.toStringAsFixed(1)} s');
    }
    textLines.add(
      '${ref.watch(gnssCurrentFrequencyProvider)?.toStringAsFixed(1)} Hz',
    );

    final update = ref.watch(gnssLastUpdateTimeProvider);
    if (update != null) {
      final sinceLast = DateTime.now().difference(update.device).inMilliseconds;

      final delay = update.delay?.inMilliseconds;
      textLines.add('Last: $sinceLast ms');
      if (delay != null) {
        textLines.add('Delay: $delay ms');
      }
    }
    return textLines.join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => switch (portalController.isShowing) {
        true => portalController.hide(),
        false => portalController.show(),
      },
      child: OverlayPortal(
        controller: portalController,
        overlayChildBuilder: (context) {
          // The render box of the InkWell/icon widget. Use this to position
          // the tooltip.
          final box = this.context.findRenderObject()! as RenderBox;
          final target = box.localToGlobal(box.size.center(Offset.zero));
          return Positioned(
            top: target.dy + box.size.height / 2 + 8,
            right: 0,
            child: DecoratedBox(
              decoration: Theme.of(context).tooltipTheme.decoration ??
                  const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          );
        },
        child: Consumer(
          builder: (context, ref, child) {
            final nmea = ref.watch(gnssCurrentSentenceProvider);
            final fixQuality = nmea?.fixQuality ?? GnssFixQuality.notAvailable;
            final numSatellites = nmea?.numSatellites ?? 0;
            return Stack(
              children: [
                Align(
                  child: Icon(
                    Icons.satellite_alt,
                    size: widget.size,
                    color: switch (fixQuality) {
                      GnssFixQuality.rtk => Colors.green,
                      GnssFixQuality.floatRTK ||
                      GnssFixQuality.ppsFix =>
                        Colors.lime,
                      GnssFixQuality.differentialFix => Colors.yellow,
                      GnssFixQuality.fix => Colors.orange,
                      GnssFixQuality.notAvailable => Colors.red,
                      GnssFixQuality.manualInput => Colors.purple,
                      GnssFixQuality.simulation => Colors.blue,
                      GnssFixQuality.estimated => Colors.blueGrey,
                    },
                    shadows: const [
                      Shadow(offset: Offset(1, 0)),
                      Shadow(offset: Offset(0, 1)),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Card(
                    margin: EdgeInsets.zero,
                    child: Text('$numSatellites'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
