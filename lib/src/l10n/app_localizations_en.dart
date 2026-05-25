// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

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
}
