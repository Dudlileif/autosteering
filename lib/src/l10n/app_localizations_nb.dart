// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get area => 'Areal';

  @override
  String get length => 'Lengde';

  @override
  String get locale => 'Språk';

  @override
  String localeOption(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': 'Engelsk',
        'nb': 'Norsk',
        'other': 'Språk',
      },
    );
    return '$_temp0';
  }

  @override
  String get units => 'Enheter';

  @override
  String unitAreaDisplay(String arg) {
    String _temp0 = intl.Intl.selectLogic(
      arg,
      {
        'other': 'Arealenhet',
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
        'other': 'Arealenhet',
        'm2': 'Kvadratmeter',
        'ac': 'Acre',
        'ha': 'Hektar',
        'daa': 'Dekar',
      },
    );
    return '$_temp0';
  }

  @override
  String unitLengthDisplay(String arg) {
    String _temp0 = intl.Intl.selectLogic(
      arg,
      {
        'other': 'Lengdeenhet',
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
        'other': 'Lengdeenhet',
        'm': 'Meter',
        'ft': 'Fot',
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
        'other': 'Hastighetsenhet',
        'mps': 'm/s',
        'kph': 'km/t',
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
        'other': 'Hastighetsenhet',
        'mps': 'Meter per sekund',
        'kph': 'Kilometer i timen',
        'mph': 'Miles per hour',
      },
    );
    return '$_temp0';
  }

  @override
  String get velocity => 'Hastighet';
}
