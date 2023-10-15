import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
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
  final OverlayPortalController portalController = OverlayPortalController();

  String get message {
    final nmea = ref.watch(gnssCurrentSentenceProvider);

    final textLines = [GnssFixQuality.values[nmea?.quality ?? 0].name];

    final hdop = nmea?.hdop;
    if (hdop != null) {
      textLines.add('HDOP: $hdop');
    }
    final altitude = nmea?.altitudeGeoid;
    if (altitude != null) {
      textLines.add('Altitude: ${altitude.toStringAsFixed(1)} m');
    }
    final age = nmea?.timeSinceLastDGPSUpdate;
    if (age != null) {
      textLines.add('Age: ${age.toStringAsFixed(1)} s');
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
            final fixQuality = GnssFixQuality.values[ref.watch(
                  gnssCurrentSentenceProvider.select((value) => value?.quality),
                ) ??
                0];
            final numSatellites =
                ref.watch(
                  gnssCurrentSentenceProvider
                      .select((value) => value?.numSatellites),
                ) ??
                0;
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