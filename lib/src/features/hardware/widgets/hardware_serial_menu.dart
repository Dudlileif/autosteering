import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/theme/utils/menu_button_text_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for configuring the connection to hardware over serial.
class HardwareSerialMenu extends StatelessWidget {
  /// A menu for configuring the connection to hardware over serial.
  const HardwareSerialMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'USB / Serial',
      iconOverrideWidget: Consumer(
        builder: (context, ref, child) => Icon(
          Icons.usb,
          color: switch (ref
              .watch(hardwareSerialProvider.select((value) => value != null))) {
            true => switch (ref.watch(hardwareSerialAliveProvider)) {
                true => Colors.green,
                false => Colors.orange,
              },
            false => null
          },
        ),
      ),
      menuChildren: [
        Consumer(
          builder: (context, ref, child) {
            if (ref.watch(
              hardwareSerialProvider.select((value) => value != null),
            )) {
              return MenuItemButton(
                closeOnActivate: false,
                leadingIcon: const Icon(Icons.clear),
                onPressed: () => ref.invalidate(hardwareSerialProvider),
                child: Text(
                  'Close',
                  style: textStyle,
                ),
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
                    closeOnActivate: false,
                    onPressed: port.isOpen
                        ? null
                        : () => ref
                            .read(hardwareSerialProvider.notifier)
                            .update(port),
                    child: Text(
                      '${port.name ?? port.address}: ${port.manufacturer}',
                      style: textStyle,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Consumer(
          builder: (context, ref, child) {
            final activeBaudRate = ref.watch(hardwareSerialBaudRateProvider);
            
            return MenuButtonWithChildren(
              icon: Icons.speed,
              text: 'Baud rate',
              menuChildren: HardwareSerialBaudRate.rates
                  .map(
                    (baudRate) => MenuItemButton(
                      closeOnActivate: false,
                      onPressed: activeBaudRate == baudRate
                          ? null
                          : () => ref
                              .read(hardwareSerialBaudRateProvider.notifier)
                              .update(baudRate),
                      child: Text('$baudRate', style: textStyle),
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
