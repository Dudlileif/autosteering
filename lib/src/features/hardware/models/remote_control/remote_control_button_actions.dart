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

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

/// An enumerator for remote control button actions.
enum RemoteControlButtonAction {
  /// Toggle the equipment sections.
  toggleEquipmentSections(Symbols.handyman),

  /// Toggle autosteering.
  toggleAutosteering(Symbols.search_hands_free),

  /// Toggle AB tracking snap to closest line.
  toggleABSnap(
    Symbols.format_letter_spacing,
  ),

  /// Reset nudge distance to 0.
  resetNudgeDistance(Symbols.exposure_zero);

  const RemoteControlButtonAction(this.icon);

  /// An icon that represents this.
  final IconData icon;
}
