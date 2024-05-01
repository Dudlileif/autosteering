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
  toggleEquipmentSections('Toggle equipment sections', Symbols.handyman),

  /// Toggle autosteering.
  toggleAutosteering('Toggle autosteering', Symbols.search_hands_free),

  /// Toggle AB tracking snap to closest line.
  toggleABSnap(
    'Toggle AB-line snap to closest line',
    Symbols.format_letter_spacing,
  );

  const RemoteControlButtonAction(this.description, [this.icon]);

  /// A short description of this.
  final String description;

  /// An icon that represents this.
  final IconData? icon;
}
