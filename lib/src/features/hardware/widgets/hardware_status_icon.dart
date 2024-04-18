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

import 'package:autosteering/src/features/hardware/hardware.dart';
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
