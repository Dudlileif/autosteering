// Copyright (C) 2026 Gaute Hagen
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

import 'package:flutter/widgets.dart';

/// A common record type to create navigation destinations for tab bars and
/// navigation rails.
class NavDest {
  /// A common record type to create navigation destinations for tab bars and
  /// navigation rails
  const NavDest({required this.icon, required this.label});

  /// The icon widget to use.
  final Widget icon;

  /// The label text to use.
  final String label;
}
