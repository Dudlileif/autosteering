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

/// An enumerator for remote control button actions.
enum RemoteControlButtonAction {
  /// Toggle the equipment sections.
  toggleEquipmentSections('Toggle equipment sections'),

  /// Toggle autosteering.
  toggleAutosteering('Toggle autosteering'),

  /// Toggle AB tracking snap to closest line.
  toggleABSnap('Toggle AB-line snap to closest line');

  const RemoteControlButtonAction(this.description);

  /// A short description of this.
  final String description;
}
