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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A page for configuring the antenna's position on the vehicle.
class VehicleGnssPage extends ConsumerWidget {
  /// A page for configuring the antenna's position on the vehicle.
  const VehicleGnssPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final numberFormatter = NumberFormat.decimalPatternDigits(
      locale: strings.localeName,
      decimalDigits: 2,
    ).format;

    final numberFormatterOneDecimal = NumberFormat.decimalPatternDigits(
      locale: strings.localeName,
      decimalDigits: 1,
    ).format;

    final vehicle = ref.watch(configuredVehicleProvider);

    final children = [
      Center(
        child: Text(strings.gnss, style: theme.textTheme.titleLarge),
      ),
      TextFormField(
        decoration: InputDecoration(
          icon: const RotatedBox(quarterTurns: 1, child: Icon(Icons.expand)),
          labelText: strings.antennaLateralOffset,
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(
          decimal: true,
          signed: true,
        ),
        textAlign: .right,
        initialValue: ref.read(
          configuredVehicleProvider.select(
            (value) => numberFormatter(value.gnssAntennaConfig.lateralOffset),
          ),
        ),
        onChanged: (value) {
          final offset = double.tryParse(value.numberInput);
          if (offset != null) {
            ref
                .read(configuredVehicleProvider.notifier)
                .update(
                  vehicle.copyWith(
                    gnssAntennaConfig: vehicle.gnssAntennaConfig.copyWith(
                      lateralOffset: offset,
                    ),
                  ),
                );
          }
        },
      ),
      TextFormField(
        decoration: InputDecoration(
          icon: const Icon(Icons.expand),
          labelText: strings.antennaHeight,
          suffixText: 'm',
        ),
        textAlign: .right,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredVehicleProvider.select(
            (value) => numberFormatter(value.gnssAntennaConfig.height),
          ),
        ),
        onChanged: (value) {
          final height = double.tryParse(value.numberInput);
          if (height != null) {
            ref
                .read(configuredVehicleProvider.notifier)
                .update(
                  vehicle.copyWith(
                    gnssAntennaConfig: vehicle.gnssAntennaConfig.copyWith(
                      height: height.abs(),
                    ),
                  ),
                );
          }
        },
      ),
      switch (vehicle) {
        AxleSteeredVehicle() => TextFormField(
          decoration: InputDecoration(
            icon: const Icon(Icons.expand),
            labelText: switch (vehicle) {
              Tractor() => strings.rearAxleToAntenna,
              Harvester() => strings.frontAxleToAntenna,
            },
            suffixText: 'm',
          ),
          textAlign: .right,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: true,
          ),
          initialValue: ref.read(
            configuredVehicleProvider.select(
              (value) =>
                  numberFormatter(value.gnssAntennaConfig.longitudinalOffset),
            ),
          ),
          onChanged: (value) {
            final distance = double.tryParse(value.numberInput);

            if (distance != null) {
              ref
                  .read(configuredVehicleProvider.notifier)
                  .update(
                    vehicle.copyWith(
                      gnssAntennaConfig: vehicle.gnssAntennaConfig.copyWith(
                        longitudinalOffset: distance,
                      ),
                    ),
                  );
            }
          },
        ),
        ArticulatedTractor() => TextFormField(
          decoration: InputDecoration(
            icon: const Icon(Icons.expand),
            labelText: strings.pivotToAntenna,
            suffixText: 'm',
            helperText: strings.pivotAntennaWarning,
          ),
          textAlign: .right,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: true,
          ),
          initialValue: ref.read(
            configuredVehicleProvider.select(
              (value) =>
                  numberFormatter(value.gnssAntennaConfig.longitudinalOffset),
            ),
          ),
          onChanged: (value) {
            final distance = double.tryParse(value.numberInput);
            if (distance != null) {
              ref
                  .read(configuredVehicleProvider.notifier)
                  .update(
                    vehicle.copyWith(
                      gnssAntennaConfig: vehicle.gnssAntennaConfig.copyWith(
                        longitudinalOffset: distance,
                      ),
                    ),
                  );
            }
          },
        ),
      },

      ExpansionTile(
        initiallyExpanded:
            vehicle.gnssAntennaConfig.useDualHeading ||
            vehicle.gnssAntennaConfig.useDualRoll,
        leading: const Icon(Icons.hdr_weak),
        title: Text(strings.dualAntenna),
        childrenPadding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          Column(
            spacing: 16,
            children: [
              CheckboxListTile(
                secondary: const Icon(Icons.navigation_outlined),
                title: Text(
                  [
                    strings.dualAntenna,
                    strings.heading.toLowerCase(),
                  ].join(' '),
                ),
                value: vehicle.gnssAntennaConfig.useDualHeading,
                onChanged: (value) {
                  if (value != null) {
                    ref
                        .read(configuredVehicleProvider.notifier)
                        .update(
                          vehicle.copyWith(
                            gnssAntennaConfig: vehicle.gnssAntennaConfig
                                .copyWith(
                                  useDualHeading: value,
                                ),
                          ),
                        );
                  }
                },
              ),
              CheckboxListTile(
                secondary: RotatedBox(
                  quarterTurns: 1,
                  child: Stack(
                    children: [
                      Transform.scale(
                        scaleY: -1,
                        child: const Icon(Symbols.switch_access_shortcut),
                      ),
                      const Icon(Symbols.switch_access_shortcut),
                    ],
                  ),
                ),
                title: Text(
                  [strings.dualAntenna, strings.roll.toLowerCase()].join(' '),
                ),
                value: vehicle.gnssAntennaConfig.useDualRoll,
                onChanged: (value) {
                  if (value != null) {
                    ref
                        .read(configuredVehicleProvider.notifier)
                        .update(
                          vehicle.copyWith(
                            gnssAntennaConfig: vehicle.gnssAntennaConfig
                                .copyWith(
                                  useDualRoll: value,
                                ),
                          ),
                        );
                  }
                },
              ),
              AnimatedSize(
                duration: Durations.medium2,
                curve: Easing.standard,
                alignment: Alignment.topCenter,
                child:
                    vehicle.gnssAntennaConfig.useDualHeading ||
                        vehicle.gnssAntennaConfig.useDualRoll
                    ? Column(
                        spacing: 16,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              icon: const RotatedBox(
                                quarterTurns: 1,
                                child: Icon(Icons.expand),
                              ),
                              labelText: strings.dualAntennaBaseline,
                              suffixText: 'm',
                            ),
                            textAlign: .right,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            initialValue: ref.read(
                              configuredVehicleProvider.select(
                                (value) => numberFormatter(
                                  value.gnssAntennaConfig.dualBaseline,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              final baseline = double.tryParse(
                                value.numberInput,
                              );
                              if (baseline != null) {
                                ref
                                    .read(configuredVehicleProvider.notifier)
                                    .update(
                                      vehicle.copyWith(
                                        gnssAntennaConfig: vehicle
                                            .gnssAntennaConfig
                                            .copyWith(
                                              dualBaseline: baseline.abs(),
                                            ),
                                      ),
                                    );
                              }
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              icon: const Icon(Icons.signal_cellular_0_bar),
                              labelText: strings.dualAntennaAngle,
                              suffixText: '°',
                            ),
                            textAlign: .right,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                              signed: true,
                            ),
                            initialValue: ref.read(
                              configuredVehicleProvider.select(
                                (value) => numberFormatterOneDecimal(
                                  value.gnssAntennaConfig.dualRelativeAngle,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              if (double.tryParse(value.numberInput)
                                  case final angle?) {
                                ref
                                    .read(configuredVehicleProvider.notifier)
                                    .update(
                                      vehicle.copyWith(
                                        gnssAntennaConfig: vehicle
                                            .gnssAntennaConfig
                                            .copyWith(
                                              dualRelativeAngle: angle,
                                            ),
                                      ),
                                    );
                              }
                            },
                          ),
                          if (vehicle.gnssAntennaConfig.useDualRoll) ...[
                            CheckboxListTile(
                              value: vehicle.gnssAntennaConfig.invertDualRoll,
                              title: Text(strings.invertRoll),
                              secondary: const Icon(
                                Symbols.compare_arrows_rounded,
                              ),
                              onChanged: (value) {
                                if (value != null) {
                                  ref
                                      .read(
                                        configuredVehicleProvider.notifier,
                                      )
                                      .update(
                                        vehicle.copyWith(
                                          gnssAntennaConfig: vehicle
                                              .gnssAntennaConfig
                                              .copyWith(
                                                invertDualRoll: value,
                                              ),
                                        ),
                                      );
                                }
                              },
                            ),
                            Builder(
                              builder: (context) {
                                var gain =
                                    vehicle.gnssAntennaConfig.dualRollGain;
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          leading: const Icon(
                                            Icons.show_chart_rounded,
                                          ),
                                          title: Text(
                                            '''${strings.roll} ${strings.gain.toLowerCase()}: ${numberFormatterOneDecimal(gain)}''',
                                            style: theme.textTheme.bodyLarge,
                                          ),
                                          trailing: IconButton(
                                            onPressed: () => ref
                                                .read(
                                                  configuredVehicleProvider
                                                      .notifier,
                                                )
                                                .update(
                                                  vehicle.copyWith(
                                                    gnssAntennaConfig: vehicle
                                                        .gnssAntennaConfig
                                                        .copyWith(
                                                          dualRollGain: 1,
                                                        ),
                                                  ),
                                                ),
                                            icon: const Icon(Icons.refresh),
                                          ),
                                        ),
                                        Slider(
                                          value: gain,
                                          min: 0.1,
                                          max: 2,
                                          divisions: 19,
                                          onChanged: (value) {
                                            setState(() => gain = value);
                                          },
                                          onChangeEnd: (value) {
                                            ref
                                                .read(
                                                  configuredVehicleProvider
                                                      .notifier,
                                                )
                                                .update(
                                                  vehicle.copyWith(
                                                    gnssAntennaConfig: vehicle
                                                        .gnssAntennaConfig
                                                        .copyWith(
                                                          dualRollGain: value,
                                                        ),
                                                  ),
                                                );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ],
                      )
                    : const SizedBox(
                        width: double.maxFinite,
                      ),
              ),
            ],
          ),
        ],
      ),
      TextFormField(
        decoration: InputDecoration(
          icon: const Icon(Symbols.settings),
          labelText: strings.receiverConfiguration,
        ),
        minLines: 5,
        maxLines: 20,
        initialValue: ref.read(
          configuredVehicleProvider.select(
            (value) => value.gnssAntennaConfig.receiverConfigs?.join('\n'),
          ),
        ),
        onChanged: (value) {
          final configs = value.split('\n');
          ref
              .read(configuredVehicleProvider.notifier)
              .update(
                vehicle.copyWith(
                  gnssAntennaConfig: vehicle.gnssAntennaConfig.copyWith(
                    receiverConfigs: configs,
                  ),
                ),
              );
        },
      ),
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 16),
        child: Align(
          alignment: Alignment.topCenter,
          child: Center(
            child: SizedBox(
              width: 400,
              child: Column(spacing: 16, children: children),
            ),
          ),
        ),
      ),
    );
  }
}
