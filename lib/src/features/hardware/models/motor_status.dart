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

/// An enumerator for different motor statuses.
enum MotorStatus {
  /// The motor is disabled.
  disabled('Motor disabled'),

  /// The motor is in freewheeling mode.
  freeWheeling('Motor freewheeling'),

  /// The motor is running.
  running('Motor running'),

  /// The motor has stopped after stalling.
  stalled('Motor stalled'),

  /// The motor has stopped, too long since last command update.
  noCommand('Motor stopped, too long since last command'),

  /// The motor is disabled, but will be enabled automatically, usually used
  /// when stationary but with autosteer engaged, which will then enable the
  /// motor when moving again.
  standby('Motor is disabled, but will be enabled automatically');

  const MotorStatus(this.text);

  /// A describing text for the status.
  final String text;
}
