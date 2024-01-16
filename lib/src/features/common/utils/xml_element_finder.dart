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
