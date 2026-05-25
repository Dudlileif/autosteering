// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get area => 'Area';

  @override
  String get length => 'Length';

  @override
  String get locale => 'Locale';

  @override
  String localeOption(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': 'English',
        'nb': 'Norwegian',
        'other': 'Language',
      },
    );
    return '$_temp0';
  }

  @override
  String get units => 'Units';

  @override
  String unitAreaDisplay(String arg) {
    String _temp0 = intl.Intl.selectLogic(
      arg,
      {
        'other': 'Area unit',
        'm2': 'm²',
        'ac': 'ac',
        'ha': 'haa',
        'daa': 'daa',
      },
    );
    return '$_temp0';
  }

  @override
  String unitAreaName(String arg) {
    String _temp0 = intl.Intl.selectLogic(
      arg,
      {
        'other': 'Area unit',
        'm2': 'Square meters',
        'ac': 'Acre',
        'ha': 'Hectare',
        'daa': 'Decare',
      },
    );
    return '$_temp0';
  }

  @override
  String unitLengthDisplay(String arg) {
    String _temp0 = intl.Intl.selectLogic(
      arg,
      {
        'other': 'Length unit',
        'm': 'm',
        'ft': 'ft',
        'yd': 'yd',
      },
    );
    return '$_temp0';
  }

  @override
  String unitLengthName(String arg) {
    String _temp0 = intl.Intl.selectLogic(
      arg,
      {
        'other': 'Length unit',
        'm': 'Meters',
        'ft': 'Feet',
        'yd': 'Yard',
      },
    );
    return '$_temp0';
  }

  @override
  String unitVelocityDisplay(String arg) {
    String _temp0 = intl.Intl.selectLogic(
      arg,
      {
        'other': 'Velocity unit',
        'mps': 'm/s',
        'kph': 'km/h',
        'mph': 'mph',
      },
    );
    return '$_temp0';
  }

  @override
  String unitVelocityName(String arg) {
    String _temp0 = intl.Intl.selectLogic(
      arg,
      {
        'other': 'Velocity unit',
        'mps': 'Meters per second',
        'kph': 'Kilometers per hour',
        'mph': 'Miles per hour',
      },
    );
    return '$_temp0';
  }

  @override
  String get velocity => 'Velocity';
}
