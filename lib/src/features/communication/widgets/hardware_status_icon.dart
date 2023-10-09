import 'package:agopengps_flutter/src/features/communication/communication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// An icon for showing the connection status to the hardware.
class HardwareStatusIcon extends StatelessWidget {
  /// An icon for showing the connection status to the hardware.
  ///
  /// [size] is the size of the icon.
  const HardwareStatusIcon({super.key, this.size});

  /// The size of the icon.
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Tooltip(
        message: ref.watch(hardwareAliveProvider)
            ? 'HW connected'
            : 'HW not connected',
        child: Icon(
          Icons.router,
          size: size,
          color: ref.watch(hardwareAliveProvider) ? Colors.green : Colors.red,
          shadows: const [
            Shadow(offset: Offset(0, 1)),
          ],
        ),
      ),
    );
  }
}
