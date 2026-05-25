// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

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
}
