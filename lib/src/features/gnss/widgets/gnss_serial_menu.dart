import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for configuring the connection to GNSS hardware over serial.
class GnssSerialMenu extends StatelessWidget {
  /// A menu for configuring the connection to GNSS hardware over serial.
  const GnssSerialMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuButtonWithChildren(
      text: 'GNSS Serial',
      iconOverrideWidget: Consumer(
        builder: (context, ref, child) => Icon(
          Icons.satellite_alt,
          color: ref.watch(gnssSerialProvider.select((value) => value != null))
              ? Colors.green
              : null,
        ),
      ),
      menuChildren: [
        Consumer(
          builder: (context, ref, child) {
            if (ref
                .watch(gnssSerialProvider.select((value) => value != null))) {
              return MenuItemButton(
                leadingIcon: const Icon(Icons.clear),
                onPressed: () => ref.invalidate(gnssSerialProvider),
                child: const Text('Close'),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        Consumer(
          builder: (context, ref, child) => MenuButtonWithChildren(
            icon: Icons.usb,
            text: 'Serial port',
            menuChildren: ref
                .watch(availableSerialPortsProvider)
                .map(
                  (port) => MenuItemButton(
                    onPressed: port.isOpen
                        ? null
                        : () =>
                            ref.read(gnssSerialProvider.notifier).update(port),
                    child: Text(port.name ?? '${port.address}'),
                  ),
                )
                .toList(),
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            final activeRate = ref.watch(gnssSerialBaudRateProvider);
            return MenuButtonWithChildren(
              icon: Icons.speed,
              text: 'Baud rate',
              menuChildren: GnssSerialBaudRate.rates
                  .map(
                    (rate) => MenuItemButton(
                      onPressed: activeRate == rate
                          ? null
                          : () => ref
                              .read(gnssSerialBaudRateProvider.notifier)
                              .update(rate),
                      child: Text('$rate'),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}
