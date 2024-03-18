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

import 'package:xml/xml.dart';

/// A class with a method for recursively finding an [XmlElement] with a
/// chosen value for an attribute.
class XmlElementFinder {
  /// A function that recursively looks for a child [XmlElement] of [element],
  /// or itself, that has [value] as the value for [attribute].
  static XmlElement? recursive(
    String attribute,
    String value,
    XmlElement element,
  ) {
    if (element.getAttribute(attribute) == value) {
      return element;
    }
    XmlElement? childElement;
    for (final element in element.childElements) {
      childElement = recursive(attribute, value, element);
      if (childElement != null) {
        return childElement;
      }
    }
    return childElement;
  }
}
