import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_nb.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('nb'),
  ];

  /// No description provided for @abTurningRadius.
  ///
  /// In en, this message translates to:
  /// **'AB turning radius'**
  String get abTurningRadius;

  /// No description provided for @abCurve.
  ///
  /// In en, this message translates to:
  /// **'AB curve'**
  String get abCurve;

  /// No description provided for @abSpacing.
  ///
  /// In en, this message translates to:
  /// **'AB spacing/width'**
  String get abSpacing;

  /// No description provided for @abTracking.
  ///
  /// In en, this message translates to:
  /// **'AB tracking'**
  String get abTracking;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @acceleration.
  ///
  /// In en, this message translates to:
  /// **'Acceleration'**
  String get acceleration;

  /// No description provided for @ackermannPercentage.
  ///
  /// In en, this message translates to:
  /// **'Ackermann percentage'**
  String get ackermannPercentage;

  /// No description provided for @activateAll.
  ///
  /// In en, this message translates to:
  /// **'Activate all'**
  String get activateAll;

  /// No description provided for @activeCenter.
  ///
  /// In en, this message translates to:
  /// **'Active center'**
  String get activeCenter;

  /// No description provided for @actualRpm.
  ///
  /// In en, this message translates to:
  /// **'Actual RPM: {value}'**
  String actualRpm(num value);

  /// No description provided for @addButton.
  ///
  /// In en, this message translates to:
  /// **'Add button'**
  String get addButton;

  /// No description provided for @addConnector.
  ///
  /// In en, this message translates to:
  /// **'Add connector'**
  String get addConnector;

  /// No description provided for @addInteriorBoundary.
  ///
  /// In en, this message translates to:
  /// **'Add interior boundary'**
  String get addInteriorBoundary;

  /// No description provided for @addPoint.
  ///
  /// In en, this message translates to:
  /// **'Add point'**
  String get addPoint;

  /// No description provided for @allowDownload.
  ///
  /// In en, this message translates to:
  /// **'Allow download'**
  String get allowDownload;

  /// No description provided for @allowLongBreaks.
  ///
  /// In en, this message translates to:
  /// **'Allow long breaks'**
  String get allowLongBreaks;

  /// No description provided for @allowSimInterpolation.
  ///
  /// In en, this message translates to:
  /// **'Allow sim interpolation'**
  String get allowSimInterpolation;

  /// No description provided for @alwaysPointMapNorth.
  ///
  /// In en, this message translates to:
  /// **'Always point map north'**
  String get alwaysPointMapNorth;

  /// No description provided for @antenna.
  ///
  /// In en, this message translates to:
  /// **'Antenna'**
  String get antenna;

  /// No description provided for @antennaHeight.
  ///
  /// In en, this message translates to:
  /// **'Antenna height'**
  String get antennaHeight;

  /// No description provided for @antennaLateralOffset.
  ///
  /// In en, this message translates to:
  /// **'Antenna lateral offset (-left / +right)'**
  String get antennaLateralOffset;

  /// No description provided for @antennaPosition.
  ///
  /// In en, this message translates to:
  /// **'Antenna position'**
  String get antennaPosition;

  /// No description provided for @apHost.
  ///
  /// In en, this message translates to:
  /// **'AP host'**
  String get apHost;

  /// No description provided for @aPlusLine.
  ///
  /// In en, this message translates to:
  /// **'A+ line'**
  String get aPlusLine;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @applyAndUse.
  ///
  /// In en, this message translates to:
  /// **'Apply and use'**
  String get applyAndUse;

  /// No description provided for @applyConfiguration.
  ///
  /// In en, this message translates to:
  /// **'Apply configuration'**
  String get applyConfiguration;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @asymmetricRollGain.
  ///
  /// In en, this message translates to:
  /// **'Asymmetric roll gain'**
  String get asymmetricRollGain;

  /// No description provided for @attach.
  ///
  /// In en, this message translates to:
  /// **'Attach'**
  String get attach;

  /// No description provided for @attachValue.
  ///
  /// In en, this message translates to:
  /// **'Attach {value}'**
  String attachValue(String value);

  /// No description provided for @audioLevels.
  ///
  /// In en, this message translates to:
  /// **'Audio levels'**
  String get audioLevels;

  /// No description provided for @audioLevelAutosteeringDisabled.
  ///
  /// In en, this message translates to:
  /// **'Autosteering disabled'**
  String get audioLevelAutosteeringDisabled;

  /// No description provided for @audioLevelAutosteeringEnabled.
  ///
  /// In en, this message translates to:
  /// **'Autosteering enabled'**
  String get audioLevelAutosteeringEnabled;

  /// No description provided for @audioLevelAutosteeringStandby.
  ///
  /// In en, this message translates to:
  /// **'Autosteering standby'**
  String get audioLevelAutosteeringStandby;

  /// No description provided for @audioLevelRtkLostAlarm.
  ///
  /// In en, this message translates to:
  /// **'RTK lost alarm'**
  String get audioLevelRtkLostAlarm;

  /// No description provided for @autoCenterSteering.
  ///
  /// In en, this message translates to:
  /// **'Auto center styring'**
  String get autoCenterSteering;

  /// No description provided for @automatic.
  ///
  /// In en, this message translates to:
  /// **'Automatic'**
  String get automatic;

  /// No description provided for @autoSlowDown.
  ///
  /// In en, this message translates to:
  /// **'Auto slow down'**
  String get autoSlowDown;

  /// No description provided for @autosteeringAngularVelocityDescription.
  ///
  /// In en, this message translates to:
  /// **'Autosteering limits steering to stay below this.'**
  String get autosteeringAngularVelocityDescription;

  /// No description provided for @autosteeringDisabledAboveThreshold.
  ///
  /// In en, this message translates to:
  /// **'Autosteering disabled above threshold'**
  String get autosteeringDisabledAboveThreshold;

  /// No description provided for @autosteeringDisabledBelowThreshold.
  ///
  /// In en, this message translates to:
  /// **'Autosteering disabled below threshold'**
  String get autosteeringDisabledBelowThreshold;

  /// No description provided for @autosteeringParameters.
  ///
  /// In en, this message translates to:
  /// **'Autosteering parameters'**
  String get autosteeringParameters;

  /// No description provided for @autosteeringStateOptionShort.
  ///
  /// In en, this message translates to:
  /// **'{option,select, other{Unknown} disabled{Off} enabled{On} standby{Stby}}'**
  String autosteeringStateOptionShort(String option);

  /// No description provided for @barWidth.
  ///
  /// In en, this message translates to:
  /// **'Bar width'**
  String get barWidth;

  /// No description provided for @baudRate.
  ///
  /// In en, this message translates to:
  /// **'Baud rate'**
  String get baudRate;

  /// No description provided for @bearing.
  ///
  /// In en, this message translates to:
  /// **'Bearing'**
  String get bearing;

  /// No description provided for @bits.
  ///
  /// In en, this message translates to:
  /// **'Bits'**
  String get bits;

  /// No description provided for @border.
  ///
  /// In en, this message translates to:
  /// **'Border'**
  String get border;

  /// No description provided for @borderPoints.
  ///
  /// In en, this message translates to:
  /// **'Border points'**
  String get borderPoints;

  /// No description provided for @boundingBox.
  ///
  /// In en, this message translates to:
  /// **'Bounding box'**
  String get boundingBox;

  /// No description provided for @bufferedBoundingBox.
  ///
  /// In en, this message translates to:
  /// **'Buffered bounding box'**
  String get bufferedBoundingBox;

  /// No description provided for @bufferDistance.
  ///
  /// In en, this message translates to:
  /// **'Buffer distance'**
  String get bufferDistance;

  /// No description provided for @bufferedField.
  ///
  /// In en, this message translates to:
  /// **'Buffered field'**
  String get bufferedField;

  /// No description provided for @bufferJoinMode.
  ///
  /// In en, this message translates to:
  /// **'Buffer join mode'**
  String get bufferJoinMode;

  /// No description provided for @button.
  ///
  /// In en, this message translates to:
  /// **'Button'**
  String get button;

  /// No description provided for @buttonColor.
  ///
  /// In en, this message translates to:
  /// **'Button color'**
  String get buttonColor;

  /// No description provided for @cache.
  ///
  /// In en, this message translates to:
  /// **'Cache'**
  String get cache;

  /// No description provided for @calibrateMotor.
  ///
  /// In en, this message translates to:
  /// **'Calibrate motor'**
  String get calibrateMotor;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @center.
  ///
  /// In en, this message translates to:
  /// **'Center'**
  String get center;

  /// No description provided for @centerLeds.
  ///
  /// In en, this message translates to:
  /// **'Center LEDs'**
  String get centerLeds;

  /// No description provided for @childHitches.
  ///
  /// In en, this message translates to:
  /// **'Child hitches'**
  String get childHitches;

  /// No description provided for @chooseLog.
  ///
  /// In en, this message translates to:
  /// **'Choose log'**
  String get chooseLog;

  /// No description provided for @clearPoints.
  ///
  /// In en, this message translates to:
  /// **'Clear points'**
  String get clearPoints;

  /// No description provided for @clearRecordedPath.
  ///
  /// In en, this message translates to:
  /// **'Clear recorded path'**
  String get clearRecordedPath;

  /// No description provided for @clearUnused.
  ///
  /// In en, this message translates to:
  /// **'Clear unused'**
  String get clearUnused;

  /// No description provided for @clearWorkedArea.
  ///
  /// In en, this message translates to:
  /// **'Clear worked area'**
  String get clearWorkedArea;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @closeActive.
  ///
  /// In en, this message translates to:
  /// **'Close active'**
  String get closeActive;

  /// No description provided for @closeActiveValue.
  ///
  /// In en, this message translates to:
  /// **'Close active {value}?'**
  String closeActiveValue(String value);

  /// No description provided for @closeValue.
  ///
  /// In en, this message translates to:
  /// **'Close {value}'**
  String closeValue(String value);

  /// No description provided for @colorTheme.
  ///
  /// In en, this message translates to:
  /// **'Color theme'**
  String get colorTheme;

  /// No description provided for @combined.
  ///
  /// In en, this message translates to:
  /// **'Combined'**
  String get combined;

  /// No description provided for @configure.
  ///
  /// In en, this message translates to:
  /// **'Configure'**
  String get configure;

  /// No description provided for @configureValue.
  ///
  /// In en, this message translates to:
  /// **'Configure {value}'**
  String configureValue(String value);

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @connectorRelation.
  ///
  /// In en, this message translates to:
  /// **'{type, select, other{Relation} child{Child} parent{Parent}}'**
  String connectorRelation(String type);

  /// No description provided for @connectors.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{Connectors} zero{Connectors} one{Connector} two{Connectors} few{Connectors} many{Connectors}}'**
  String connectors(int count);

  /// No description provided for @connectorType.
  ///
  /// In en, this message translates to:
  /// **'{type, select, other{Connector} fixed{Three-point/Fixed} drawbar{Drawbar}}'**
  String connectorType(String type);

  /// No description provided for @coolStepMinRpm.
  ///
  /// In en, this message translates to:
  /// **'{option, select, disabled{CoolStep min: Disabled} other{CoolStep min: {rpm} RPM}}'**
  String coolStepMinRpm(String option, num rpm);

  /// No description provided for @copernicusId.
  ///
  /// In en, this message translates to:
  /// **'Copernicus ID'**
  String get copernicusId;

  /// No description provided for @copyFromValue.
  ///
  /// In en, this message translates to:
  /// **'Copy from {value}'**
  String copyFromValue(String value);

  /// No description provided for @copyWorkSessionDescription.
  ///
  /// In en, this message translates to:
  /// **'Copy field, implement and guidance from this.'**
  String get copyWorkSessionDescription;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @created.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get created;

  /// No description provided for @createFieldFromPathTracking.
  ///
  /// In en, this message translates to:
  /// **'Create field from path tracking'**
  String get createFieldFromPathTracking;

  /// No description provided for @createFieldFromRecording.
  ///
  /// In en, this message translates to:
  /// **'Create field from recording'**
  String get createFieldFromRecording;

  /// No description provided for @createNew.
  ///
  /// In en, this message translates to:
  /// **'Create new'**
  String get createNew;

  /// No description provided for @createPathTrackingFromBufferedFieldExterior.
  ///
  /// In en, this message translates to:
  /// **'Create path tracking from buffered field exterior'**
  String get createPathTrackingFromBufferedFieldExterior;

  /// No description provided for @createValue.
  ///
  /// In en, this message translates to:
  /// **'Create {value}'**
  String createValue(String value);

  /// No description provided for @crossDistanceGain.
  ///
  /// In en, this message translates to:
  /// **'Cross distance gain: {value}'**
  String crossDistanceGain(num value);

  /// No description provided for @current.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get current;

  /// No description provided for @curve.
  ///
  /// In en, this message translates to:
  /// **'Curve'**
  String get curve;

  /// No description provided for @cycleLightSystemDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Cycle light/system/dark mode'**
  String get cycleLightSystemDarkMode;

  /// No description provided for @dadMode.
  ///
  /// In en, this message translates to:
  /// **'Dad mode'**
  String get dadMode;

  /// No description provided for @dataUsageMonth.
  ///
  /// In en, this message translates to:
  /// **'Data usage (month):'**
  String get dataUsageMonth;

  /// No description provided for @dataUsageSession.
  ///
  /// In en, this message translates to:
  /// **'Data usage (session):'**
  String get dataUsageSession;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{Days} zero{Days} one{Day} two{Days} few{Days} many{Days}}'**
  String days(int count);

  /// No description provided for @dcStepMinRpm.
  ///
  /// In en, this message translates to:
  /// **'{option, select, disabled{DcStep min: Disabled} other{DcStep min: {rpm} RPM}}'**
  String dcStepMinRpm(String option, num rpm);

  /// No description provided for @deactivateAll.
  ///
  /// In en, this message translates to:
  /// **'Deactivate all'**
  String get deactivateAll;

  /// No description provided for @debug.
  ///
  /// In en, this message translates to:
  /// **'Debug'**
  String get debug;

  /// No description provided for @debugging.
  ///
  /// In en, this message translates to:
  /// **'Debugging'**
  String get debugging;

  /// No description provided for @debugMode.
  ///
  /// In en, this message translates to:
  /// **'Debug mode'**
  String get debugMode;

  /// No description provided for @defaultOption.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultOption;

  /// No description provided for @delayValueMs.
  ///
  /// In en, this message translates to:
  /// **'Delay: {value} ms'**
  String delayValueMs(int value);

  /// No description provided for @delayReadings.
  ///
  /// In en, this message translates to:
  /// **'Delay readings: {value} ms'**
  String delayReadings(num value);

  /// No description provided for @deleteValue.
  ///
  /// In en, this message translates to:
  /// **'Delete {value}'**
  String deleteValue(String value);

  /// No description provided for @detach.
  ///
  /// In en, this message translates to:
  /// **'Detach'**
  String get detach;

  /// No description provided for @detachAll.
  ///
  /// In en, this message translates to:
  /// **'Detach all'**
  String get detachAll;

  /// No description provided for @dimensions.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{Dimensions} zero{Dimensions} one{Dimension} two{Dimensions} few{Dimensions} many{Dimensions}}'**
  String dimensions(int count);

  /// No description provided for @disableAutosteering.
  ///
  /// In en, this message translates to:
  /// **'Disable autosteering'**
  String get disableAutosteering;

  /// No description provided for @discrete.
  ///
  /// In en, this message translates to:
  /// **'Discrete'**
  String get discrete;

  /// No description provided for @distancePerLed.
  ///
  /// In en, this message translates to:
  /// **'Distance / LED'**
  String get distancePerLed;

  /// No description provided for @doNotDisable.
  ///
  /// In en, this message translates to:
  /// **'Do not disable'**
  String get doNotDisable;

  /// No description provided for @drawValue.
  ///
  /// In en, this message translates to:
  /// **'Draw {value}'**
  String drawValue(String value);

  /// No description provided for @dualAntenna.
  ///
  /// In en, this message translates to:
  /// **'Dual antenna'**
  String get dualAntenna;

  /// No description provided for @dualAntennaAngle.
  ///
  /// In en, this message translates to:
  /// **'Dual angle, relative to forward'**
  String get dualAntennaAngle;

  /// No description provided for @dualAntennaBaseline.
  ///
  /// In en, this message translates to:
  /// **'Dual antenna baseline'**
  String get dualAntennaBaseline;

  /// No description provided for @dubinsPath.
  ///
  /// In en, this message translates to:
  /// **'Dubins path'**
  String get dubinsPath;

  /// No description provided for @editNote.
  ///
  /// In en, this message translates to:
  /// **'Edit note'**
  String get editNote;

  /// No description provided for @editValue.
  ///
  /// In en, this message translates to:
  /// **'Edit {value}'**
  String editValue(String value);

  /// No description provided for @editRecordedPath.
  ///
  /// In en, this message translates to:
  /// **'Edit recorded path'**
  String get editRecordedPath;

  /// No description provided for @effectiveOnRestart.
  ///
  /// In en, this message translates to:
  /// **'Effective on restart'**
  String get effectiveOnRestart;

  /// No description provided for @enable.
  ///
  /// In en, this message translates to:
  /// **'Enable'**
  String get enable;

  /// No description provided for @enable3d.
  ///
  /// In en, this message translates to:
  /// **'Enable 3D'**
  String get enable3d;

  /// No description provided for @enableAutosteering.
  ///
  /// In en, this message translates to:
  /// **'Enable autosteering'**
  String get enableAutosteering;

  /// No description provided for @enabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// No description provided for @end.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get end;

  /// No description provided for @endLeds.
  ///
  /// In en, this message translates to:
  /// **'End LEDs'**
  String get endLeds;

  /// No description provided for @enteredIdMustBeAValidUuid.
  ///
  /// In en, this message translates to:
  /// **'The entered ID must be a valid UUID.'**
  String get enteredIdMustBeAValidUuid;

  /// No description provided for @enterValue.
  ///
  /// In en, this message translates to:
  /// **'Enter {value}'**
  String enterValue(String value);

  /// No description provided for @equalWidths.
  ///
  /// In en, this message translates to:
  /// **'Equal widths'**
  String get equalWidths;

  /// No description provided for @implement.
  ///
  /// In en, this message translates to:
  /// **'Implement'**
  String get implement;

  /// No description provided for @implementDetermined.
  ///
  /// In en, this message translates to:
  /// **'Implement'**
  String get implementDetermined;

  /// No description provided for @implementDrawbarLength.
  ///
  /// In en, this message translates to:
  /// **'Implement drawbar length'**
  String get implementDrawbarLength;

  /// No description provided for @equipmentSetup.
  ///
  /// In en, this message translates to:
  /// **'Equipment setup'**
  String get equipmentSetup;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @errorOverTime.
  ///
  /// In en, this message translates to:
  /// **'Error over time'**
  String get errorOverTime;

  /// No description provided for @errorRateOfChange.
  ///
  /// In en, this message translates to:
  /// **'Error rate of change'**
  String get errorRateOfChange;

  /// No description provided for @ethernet.
  ///
  /// In en, this message translates to:
  /// **'Ethernet'**
  String get ethernet;

  /// No description provided for @everything.
  ///
  /// In en, this message translates to:
  /// **'Everything'**
  String get everything;

  /// No description provided for @exportAction.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get exportAction;

  /// No description provided for @exportAll.
  ///
  /// In en, this message translates to:
  /// **'Export all'**
  String get exportAll;

  /// No description provided for @exportValue.
  ///
  /// In en, this message translates to:
  /// **'Export {value}'**
  String exportValue(String value);

  /// No description provided for @exterior.
  ///
  /// In en, this message translates to:
  /// **'Exterior'**
  String get exterior;

  /// No description provided for @exteriorBoundary.
  ///
  /// In en, this message translates to:
  /// **'Exterior boundary'**
  String get exteriorBoundary;

  /// No description provided for @field.
  ///
  /// In en, this message translates to:
  /// **'Field'**
  String get field;

  /// No description provided for @fieldBuffer.
  ///
  /// In en, this message translates to:
  /// **'Field buffer'**
  String get fieldBuffer;

  /// No description provided for @finishEditing.
  ///
  /// In en, this message translates to:
  /// **'Finish editing'**
  String get finishEditing;

  /// No description provided for @finishRecording.
  ///
  /// In en, this message translates to:
  /// **'Finish recording'**
  String get finishRecording;

  /// No description provided for @front.
  ///
  /// In en, this message translates to:
  /// **'Front'**
  String get front;

  /// No description provided for @frontAxle.
  ///
  /// In en, this message translates to:
  /// **'Front axle'**
  String get frontAxle;

  /// No description provided for @frontAxleToAntenna.
  ///
  /// In en, this message translates to:
  /// **'Front axle to antenna'**
  String get frontAxleToAntenna;

  /// No description provided for @frontAxleToFrontHitchDistance.
  ///
  /// In en, this message translates to:
  /// **'Front axle to front hitch distance'**
  String get frontAxleToFrontHitchDistance;

  /// No description provided for @frontAxleToRearDrawbarDistance.
  ///
  /// In en, this message translates to:
  /// **'Front axle to rear drawbar distance'**
  String get frontAxleToRearDrawbarDistance;

  /// No description provided for @frontAxleToRearHitchDistance.
  ///
  /// In en, this message translates to:
  /// **'Front axle to rear hitch distance'**
  String get frontAxleToRearHitchDistance;

  /// No description provided for @frontWheels.
  ///
  /// In en, this message translates to:
  /// **'Front wheels'**
  String get frontWheels;

  /// No description provided for @fullstep.
  ///
  /// In en, this message translates to:
  /// **'Fullstep'**
  String get fullstep;

  /// No description provided for @gain.
  ///
  /// In en, this message translates to:
  /// **'Gain'**
  String get gain;

  /// No description provided for @gaugeAverageCount.
  ///
  /// In en, this message translates to:
  /// **'Gauge average count'**
  String get gaugeAverageCount;

  /// No description provided for @getHardwareConfig.
  ///
  /// In en, this message translates to:
  /// **'Get hardware config'**
  String get getHardwareConfig;

  /// No description provided for @gnss.
  ///
  /// In en, this message translates to:
  /// **'GNSS'**
  String get gnss;

  /// No description provided for @graph.
  ///
  /// In en, this message translates to:
  /// **'Graph'**
  String get graph;

  /// No description provided for @grid.
  ///
  /// In en, this message translates to:
  /// **'Grid'**
  String get grid;

  /// No description provided for @guidance.
  ///
  /// In en, this message translates to:
  /// **'Guidance'**
  String get guidance;

  /// No description provided for @hardware.
  ///
  /// In en, this message translates to:
  /// **'Hardware'**
  String get hardware;

  /// No description provided for @hardwareConnected.
  ///
  /// In en, this message translates to:
  /// **'Hardware connected'**
  String get hardwareConnected;

  /// No description provided for @hardwareNotConnected.
  ///
  /// In en, this message translates to:
  /// **'Hardware not connected'**
  String get hardwareNotConnected;

  /// No description provided for @heading.
  ///
  /// In en, this message translates to:
  /// **'Heading'**
  String get heading;

  /// No description provided for @hideUnlitLeds.
  ///
  /// In en, this message translates to:
  /// **'Hide unlit LEDs'**
  String get hideUnlitLeds;

  /// No description provided for @highVelocityMinRpm.
  ///
  /// In en, this message translates to:
  /// **'{option,select,disabled{High velocity min: Disabled} other{High velocity min: {rpm} RPM}}'**
  String highVelocityMinRpm(String option, num rpm);

  /// No description provided for @hitchOption.
  ///
  /// In en, this message translates to:
  /// **'{option, select, other{Hitch} fixed{Fixed} drawbar{Drawbar}}'**
  String hitchOption(String option);

  /// No description provided for @hitchToFrontFixedHitchDistance.
  ///
  /// In en, this message translates to:
  /// **'Hitch to front fixed hitch distance'**
  String get hitchToFrontFixedHitchDistance;

  /// No description provided for @hitchToRearFixedHitchDistance.
  ///
  /// In en, this message translates to:
  /// **'Hitch to rear fixed hitch distance'**
  String get hitchToRearFixedHitchDistance;

  /// No description provided for @hitchToRearDrawbarDistance.
  ///
  /// In en, this message translates to:
  /// **'Hitch to rear drawbar distance'**
  String get hitchToRearDrawbarDistance;

  /// hitches
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{Hitches} zero{Hitches} one{Hitch} two{Hitches} few{Hitches} many{Hitches}}'**
  String hitches(int count);

  /// No description provided for @holdToReset.
  ///
  /// In en, this message translates to:
  /// **'Hold to reset'**
  String get holdToReset;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @homeEnterPosition.
  ///
  /// In en, this message translates to:
  /// **'Enter home position'**
  String get homeEnterPosition;

  /// No description provided for @homeSetToScreenCenter.
  ///
  /// In en, this message translates to:
  /// **'Set to screen center'**
  String get homeSetToScreenCenter;

  /// No description provided for @homeUseEnteredPosition.
  ///
  /// In en, this message translates to:
  /// **'Use entered position'**
  String get homeUseEnteredPosition;

  /// No description provided for @importAction.
  ///
  /// In en, this message translates to:
  /// **'Import'**
  String get importAction;

  /// No description provided for @importExport.
  ///
  /// In en, this message translates to:
  /// **'Import/Export'**
  String get importExport;

  /// No description provided for @importValue.
  ///
  /// In en, this message translates to:
  /// **'Import {value}'**
  String importValue(String value);

  /// No description provided for @imu.
  ///
  /// In en, this message translates to:
  /// **'IMU'**
  String get imu;

  /// No description provided for @imuConfigurator.
  ///
  /// In en, this message translates to:
  /// **'IMU configurator'**
  String get imuConfigurator;

  /// No description provided for @inheritColorsFromVehicle.
  ///
  /// In en, this message translates to:
  /// **'Inherit colors from vehicle'**
  String get inheritColorsFromVehicle;

  /// No description provided for @inner.
  ///
  /// In en, this message translates to:
  /// **'Inner'**
  String get inner;

  /// No description provided for @interior.
  ///
  /// In en, this message translates to:
  /// **'Interior'**
  String get interior;

  /// No description provided for @interiorBorderBufferDistance.
  ///
  /// In en, this message translates to:
  /// **'Interior border (holes) buffer distance'**
  String get interiorBorderBufferDistance;

  /// No description provided for @intermediateLeds.
  ///
  /// In en, this message translates to:
  /// **'Intermediate LEDs'**
  String get intermediateLeds;

  /// No description provided for @interpolationDescription.
  ///
  /// In en, this message translates to:
  /// **'Interpolation between GNSS updates'**
  String get interpolationDescription;

  /// No description provided for @interpolationDistance.
  ///
  /// In en, this message translates to:
  /// **'Interpolation distance: {value} m'**
  String interpolationDistance(num value);

  /// No description provided for @interval.
  ///
  /// In en, this message translates to:
  /// **'Interval'**
  String get interval;

  /// No description provided for @invalidValue.
  ///
  /// In en, this message translates to:
  /// **'Invalid {value}'**
  String invalidValue(String value);

  /// No description provided for @invertLedBar.
  ///
  /// In en, this message translates to:
  /// **'Invert light bar'**
  String get invertLedBar;

  /// No description provided for @invertPitch.
  ///
  /// In en, this message translates to:
  /// **'Invert pitch'**
  String get invertPitch;

  /// No description provided for @invertRoll.
  ///
  /// In en, this message translates to:
  /// **'Invert roll'**
  String get invertRoll;

  /// No description provided for @invertSensorInput.
  ///
  /// In en, this message translates to:
  /// **'Invert sensor input'**
  String get invertSensorInput;

  /// No description provided for @keepLogsForValue.
  ///
  /// In en, this message translates to:
  /// **'Keep logs for {value} '**
  String keepLogsForValue(String value);

  /// No description provided for @sinceLastValueMs.
  ///
  /// In en, this message translates to:
  /// **'Since last: {value} ms'**
  String sinceLastValueMs(int value);

  /// No description provided for @lateralOffset.
  ///
  /// In en, this message translates to:
  /// **'Lateral offset'**
  String get lateralOffset;

  /// No description provided for @latitudeNS.
  ///
  /// In en, this message translates to:
  /// **'Latitude (N/S)'**
  String get latitudeNS;

  /// No description provided for @latitudeShort.
  ///
  /// In en, this message translates to:
  /// **'Lat'**
  String get latitudeShort;

  /// No description provided for @ledSize.
  ///
  /// In en, this message translates to:
  /// **'LED Size'**
  String get ledSize;

  /// No description provided for @left.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get left;

  /// No description provided for @length.
  ///
  /// In en, this message translates to:
  /// **'Length'**
  String get length;

  /// No description provided for @limitMode.
  ///
  /// In en, this message translates to:
  /// **'Limit mode'**
  String get limitMode;

  /// No description provided for @line.
  ///
  /// In en, this message translates to:
  /// **'Line'**
  String get line;

  /// No description provided for @load.
  ///
  /// In en, this message translates to:
  /// **'Load'**
  String get load;

  /// No description provided for @loadValue.
  ///
  /// In en, this message translates to:
  /// **'Load {value}'**
  String loadValue(String value);

  /// Name on menu entry for selecting app locale.
  ///
  /// In en, this message translates to:
  /// **'Locale'**
  String get locale;

  /// Locale name, e.g. English, Norwegian etc.
  ///
  /// In en, this message translates to:
  /// **'{locale, select, en{English} nb{Norwegian} other{Language}}'**
  String localeOption(String locale);

  /// No description provided for @lockMapToVehicle.
  ///
  /// In en, this message translates to:
  /// **'Lock map to vehicle'**
  String get lockMapToVehicle;

  /// No description provided for @lockToField.
  ///
  /// In en, this message translates to:
  /// **'Lock to field'**
  String get lockToField;

  /// No description provided for @logging.
  ///
  /// In en, this message translates to:
  /// **'Logging'**
  String get logging;

  /// No description provided for @logReplay.
  ///
  /// In en, this message translates to:
  /// **'Log replay'**
  String get logReplay;

  /// No description provided for @logs.
  ///
  /// In en, this message translates to:
  /// **'Logs'**
  String get logs;

  /// No description provided for @longitudeEW.
  ///
  /// In en, this message translates to:
  /// **'Longitude (E/W)'**
  String get longitudeEW;

  /// No description provided for @longitudinalOffset.
  ///
  /// In en, this message translates to:
  /// **'Longitudinal offset'**
  String get longitudinalOffset;

  /// No description provided for @longitudeShort.
  ///
  /// In en, this message translates to:
  /// **'Lon'**
  String get longitudeShort;

  /// No description provided for @lookAheadMinDistance.
  ///
  /// In en, this message translates to:
  /// **'Look ahead min distance: {value} m'**
  String lookAheadMinDistance(num value);

  /// No description provided for @lookAheadTime.
  ///
  /// In en, this message translates to:
  /// **'Look ahead time: {value} s'**
  String lookAheadTime(num value);

  /// No description provided for @loop.
  ///
  /// In en, this message translates to:
  /// **'Loop'**
  String get loop;

  /// No description provided for @lowerThreshold.
  ///
  /// In en, this message translates to:
  /// **'Lower threshold'**
  String get lowerThreshold;

  /// No description provided for @manual.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get manual;

  /// No description provided for @manualSimulationMode.
  ///
  /// In en, this message translates to:
  /// **'Manual simulation mode'**
  String get manualSimulationMode;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @max.
  ///
  /// In en, this message translates to:
  /// **'Max'**
  String get max;

  /// No description provided for @maxAccelerationRpms.
  ///
  /// In en, this message translates to:
  /// **'Max acceleration: {value} RPM/s'**
  String maxAccelerationRpms(int value);

  /// No description provided for @maxAngularVelocity.
  ///
  /// In en, this message translates to:
  /// **'Max angular velocity: {value} °/s'**
  String maxAngularVelocity(int value);

  /// No description provided for @maxDecelerationRpms.
  ///
  /// In en, this message translates to:
  /// **'Max deceleration: {value} RPM/s'**
  String maxDecelerationRpms(int value);

  /// No description provided for @maxDistance.
  ///
  /// In en, this message translates to:
  /// **'Max distance'**
  String get maxDistance;

  /// No description provided for @maxReversingVelocity.
  ///
  /// In en, this message translates to:
  /// **'Max reversing velocity: {value} {unit}'**
  String maxReversingVelocity(num value, String unit);

  /// No description provided for @maxSteeringAngle.
  ///
  /// In en, this message translates to:
  /// **'Max steering angle (inner wheel)'**
  String get maxSteeringAngle;

  /// No description provided for @maxVelocityRpm.
  ///
  /// In en, this message translates to:
  /// **'Max velocity: {value} RPM'**
  String maxVelocityRpm(int value);

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @microsteps.
  ///
  /// In en, this message translates to:
  /// **'Microsteps'**
  String get microsteps;

  /// Minimum short form
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get min;

  /// No description provided for @minDistance.
  ///
  /// In en, this message translates to:
  /// **'Min distance'**
  String get minDistance;

  /// No description provided for @miniMap.
  ///
  /// In en, this message translates to:
  /// **'Mini map'**
  String get miniMap;

  /// No description provided for @minimumTurningRadius.
  ///
  /// In en, this message translates to:
  /// **'Minimum turning radius'**
  String get minimumTurningRadius;

  /// No description provided for @minOffsetSkips.
  ///
  /// In en, this message translates to:
  /// **'Min offset skips'**
  String get minOffsetSkips;

  /// No description provided for @motor.
  ///
  /// In en, this message translates to:
  /// **'Motor'**
  String get motor;

  /// No description provided for @motorStatusOption.
  ///
  /// In en, this message translates to:
  /// **'{option, select, other{Unknown motor status} disabled{Motor disabled} freeWheeling{Motor freewheeling} running{Motor running} stalled{Motor stalled} noCommand{Motor stopped, too long since last command} standby{Motor is disabled, but will be enabled automatically}}'**
  String motorStatusOption(String option);

  /// No description provided for @motorTargetOverride.
  ///
  /// In en, this message translates to:
  /// **'Motor target override'**
  String get motorTargetOverride;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @nameAlreadyInUse.
  ///
  /// In en, this message translates to:
  /// **'Name already in use'**
  String get nameAlreadyInUse;

  /// No description provided for @nameTheValue.
  ///
  /// In en, this message translates to:
  /// **'Name the {value}'**
  String nameTheValue(String value);

  /// No description provided for @network.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get network;

  /// No description provided for @noAction.
  ///
  /// In en, this message translates to:
  /// **'No action'**
  String get noAction;

  /// No description provided for @noName.
  ///
  /// In en, this message translates to:
  /// **'No name'**
  String get noName;

  /// No description provided for @noNameEnteredValue.
  ///
  /// In en, this message translates to:
  /// **'No name entered! Please enter a name so that the {value} can be saved!'**
  String noNameEnteredValue(String value);

  /// No description provided for @normalized.
  ///
  /// In en, this message translates to:
  /// **'Normalized'**
  String get normalized;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @notReceivingSensorReadings.
  ///
  /// In en, this message translates to:
  /// **'Not receiving {sensor} readings'**
  String notReceivingSensorReadings(String sensor);

  /// No description provided for @ntripActiveProfile.
  ///
  /// In en, this message translates to:
  /// **'Active profile: {profile}'**
  String ntripActiveProfile(String profile);

  /// No description provided for @ntripAddProfile.
  ///
  /// In en, this message translates to:
  /// **'Add profile'**
  String get ntripAddProfile;

  /// No description provided for @ntripCasterSourcetable.
  ///
  /// In en, this message translates to:
  /// **'NTRIP caster sourcetable'**
  String get ntripCasterSourcetable;

  /// No description provided for @ntripCreateProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Create NTRIP profile'**
  String get ntripCreateProfileTitle;

  /// No description provided for @ntripEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get ntripEditProfile;

  /// No description provided for @ntripEditProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit NTRIP profile'**
  String get ntripEditProfileTitle;

  /// No description provided for @ntripFindClosestBaseStation.
  ///
  /// In en, this message translates to:
  /// **'Find closest base station'**
  String get ntripFindClosestBaseStation;

  /// No description provided for @ntripGgaSendingInterval.
  ///
  /// In en, this message translates to:
  /// **'GGA sending interval (s)'**
  String get ntripGgaSendingInterval;

  /// No description provided for @ntripHostAddress.
  ///
  /// In en, this message translates to:
  /// **'Host address'**
  String get ntripHostAddress;

  /// No description provided for @ntripHostPort.
  ///
  /// In en, this message translates to:
  /// **'Host port'**
  String get ntripHostPort;

  /// No description provided for @ntripInputWholeSeconds.
  ///
  /// In en, this message translates to:
  /// **'Input whole seconds from 1 or empty'**
  String get ntripInputWholeSeconds;

  /// No description provided for @ntripLoadProfile.
  ///
  /// In en, this message translates to:
  /// **'Load profile'**
  String get ntripLoadProfile;

  /// No description provided for @ntripMountPointBaseStation.
  ///
  /// In en, this message translates to:
  /// **'Mount point / base station'**
  String get ntripMountPointBaseStation;

  /// No description provided for @ntripNoProfileSelected.
  ///
  /// In en, this message translates to:
  /// **'No profile selected'**
  String get ntripNoProfileSelected;

  /// No description provided for @ntripRtk.
  ///
  /// In en, this message translates to:
  /// **'NTRIP (RTK)'**
  String get ntripRtk;

  /// No description provided for @nudgeControls.
  ///
  /// In en, this message translates to:
  /// **'Nudge controls'**
  String get nudgeControls;

  /// No description provided for @numberOfSections.
  ///
  /// In en, this message translates to:
  /// **'Number of sections'**
  String get numberOfSections;

  /// No description provided for @numberOfWheelsDescription.
  ///
  /// In en, this message translates to:
  /// **'Number of wheels,\ni.e. does your vehicle have twin\nor triple wheels'**
  String get numberOfWheelsDescription;

  /// No description provided for @off.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get off;

  /// No description provided for @offsetFromBaseLine.
  ///
  /// In en, this message translates to:
  /// **'Offset from base line'**
  String get offsetFromBaseLine;

  /// No description provided for @offsetLeftRight.
  ///
  /// In en, this message translates to:
  /// **'Offset (-left / +right)'**
  String get offsetLeftRight;

  /// No description provided for @on.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get on;

  /// No description provided for @onlyUseGnssSyncedReadings.
  ///
  /// In en, this message translates to:
  /// **'Only use GNSS synced readings'**
  String get onlyUseGnssSyncedReadings;

  /// No description provided for @opacity.
  ///
  /// In en, this message translates to:
  /// **'Opacity'**
  String get opacity;

  /// No description provided for @outer.
  ///
  /// In en, this message translates to:
  /// **'Outer'**
  String get outer;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @path.
  ///
  /// In en, this message translates to:
  /// **'Path'**
  String get path;

  /// No description provided for @pathColor.
  ///
  /// In en, this message translates to:
  /// **'Path color'**
  String get pathColor;

  /// No description provided for @pathRecording.
  ///
  /// In en, this message translates to:
  /// **'Path recording'**
  String get pathRecording;

  /// No description provided for @pathTracking.
  ///
  /// In en, this message translates to:
  /// **'Path tracking'**
  String get pathTracking;

  /// No description provided for @pathType.
  ///
  /// In en, this message translates to:
  /// **'Path type'**
  String get pathType;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @perspective.
  ///
  /// In en, this message translates to:
  /// **'Perspective'**
  String get perspective;

  /// No description provided for @pid.
  ///
  /// In en, this message translates to:
  /// **'PID'**
  String get pid;

  /// No description provided for @pitch.
  ///
  /// In en, this message translates to:
  /// **'Pitch'**
  String get pitch;

  /// No description provided for @pitchGain.
  ///
  /// In en, this message translates to:
  /// **'Pitch gain'**
  String get pitchGain;

  /// No description provided for @pivotAntennaWarning.
  ///
  /// In en, this message translates to:
  /// **'Antenna MUST be on the front body of the vehicle!'**
  String get pivotAntennaWarning;

  /// No description provided for @pivotCenterToValue.
  ///
  /// In en, this message translates to:
  /// **'Pivot center to {value}'**
  String pivotCenterToValue(String value);

  /// No description provided for @pivotToAntenna.
  ///
  /// In en, this message translates to:
  /// **'Pivot to antenna'**
  String get pivotToAntenna;

  /// No description provided for @points.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{Points} zero{Points} one{Point} two{Points} few{Points} many{Points}}'**
  String points(int count);

  /// No description provided for @pointsAhead.
  ///
  /// In en, this message translates to:
  /// **'Points ahead'**
  String get pointsAhead;

  /// No description provided for @pointsBehind.
  ///
  /// In en, this message translates to:
  /// **'Points behind'**
  String get pointsBehind;

  /// No description provided for @polygons.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{Polygons} zero{Polygons} one{Polygon} two{Polygons} few{Polygons} many{Polygons}}'**
  String polygons(int count);

  /// No description provided for @portNetwork.
  ///
  /// In en, this message translates to:
  /// **'Port'**
  String get portNetwork;

  /// No description provided for @position.
  ///
  /// In en, this message translates to:
  /// **'Position'**
  String get position;

  /// No description provided for @preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  /// No description provided for @primaryColor.
  ///
  /// In en, this message translates to:
  /// **'{option, select, other{Color} red{Red} pink{Pink} purple{Purple} deepPurple{Deep purple} indigo{Indigo} blue{Blue} lightBlue{Light blue} cyan{Cyan} teal{Teal} green{Green} lightGreen{Light green} lime{Lime} yellow{Yellow} amber{Amber} orange{Orange} deepOrange{Deep orange} brown{Brown} blueGrey{Blue grey}}'**
  String primaryColor(String option);

  /// No description provided for @rawBufferPoints.
  ///
  /// In en, this message translates to:
  /// **'Raw buffer points'**
  String get rawBufferPoints;

  /// No description provided for @rawSensorReading.
  ///
  /// In en, this message translates to:
  /// **'Raw {sensor} reading'**
  String rawSensorReading(String sensor);

  /// No description provided for @rear.
  ///
  /// In en, this message translates to:
  /// **'Rear'**
  String get rear;

  /// No description provided for @rearAxle.
  ///
  /// In en, this message translates to:
  /// **'Rear axle'**
  String get rearAxle;

  /// No description provided for @rearAxleToAntenna.
  ///
  /// In en, this message translates to:
  /// **'Rear axle to antenna'**
  String get rearAxleToAntenna;

  /// No description provided for @rearAxleToFrontHitchDistance.
  ///
  /// In en, this message translates to:
  /// **'Rear axle to front hitch distance'**
  String get rearAxleToFrontHitchDistance;

  /// No description provided for @rearAxleToRearDrawbarDistance.
  ///
  /// In en, this message translates to:
  /// **'Rear axle to rear drawbar distance'**
  String get rearAxleToRearDrawbarDistance;

  /// No description provided for @rearAxleToRearHitchDistance.
  ///
  /// In en, this message translates to:
  /// **'Rear axle to rear hitch distance'**
  String get rearAxleToRearHitchDistance;

  /// No description provided for @rearWheels.
  ///
  /// In en, this message translates to:
  /// **'Rear wheels'**
  String get rearWheels;

  /// No description provided for @receivePort.
  ///
  /// In en, this message translates to:
  /// **'Receive port'**
  String get receivePort;

  /// No description provided for @receiverConfiguration.
  ///
  /// In en, this message translates to:
  /// **'Receiver configuration'**
  String get receiverConfiguration;

  /// No description provided for @record.
  ///
  /// In en, this message translates to:
  /// **'Record'**
  String get record;

  /// No description provided for @recording.
  ///
  /// In en, this message translates to:
  /// **'Recording'**
  String get recording;

  /// No description provided for @recordingPosition.
  ///
  /// In en, this message translates to:
  /// **'Recording position'**
  String get recordingPosition;

  /// No description provided for @recordingPositionFromWorkingAreaStart.
  ///
  /// In en, this message translates to:
  /// **'Recording position from working area start'**
  String get recordingPositionFromWorkingAreaStart;

  /// No description provided for @recordingTapToPause.
  ///
  /// In en, this message translates to:
  /// **'Recording, tap to pause'**
  String get recordingTapToPause;

  /// No description provided for @remoteControl.
  ///
  /// In en, this message translates to:
  /// **'Remote control'**
  String get remoteControl;

  /// No description provided for @remoteControlAction.
  ///
  /// In en, this message translates to:
  /// **'{option, select, other{No action} toggleImplementSections{Toggle implement sections} toggleAutosteering{Toggle autosteering} toggleABSnap{Toggle AB-line snap to closest line} resetNudgeDistance{Reset nudge distance to 0}}'**
  String remoteControlAction(String option);

  /// No description provided for @remoteControlConfigurator.
  ///
  /// In en, this message translates to:
  /// **'Remove control configurator'**
  String get remoteControlConfigurator;

  /// No description provided for @remoteControlHardwareAddress.
  ///
  /// In en, this message translates to:
  /// **'Remove control hardware address'**
  String get remoteControlHardwareAddress;

  /// No description provided for @removeValue.
  ///
  /// In en, this message translates to:
  /// **'Remove {value}?'**
  String removeValue(String value);

  /// No description provided for @removeSensitiveData.
  ///
  /// In en, this message translates to:
  /// **'Remove sensitive data'**
  String get removeSensitiveData;

  /// No description provided for @removeSensitiveDataDescription.
  ///
  /// In en, this message translates to:
  /// **'Removes NTRIP profiles (username, password), Copernicus ID and home position'**
  String get removeSensitiveDataDescription;

  /// No description provided for @rename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// No description provided for @renameAndSave.
  ///
  /// In en, this message translates to:
  /// **'Rename and save'**
  String get renameAndSave;

  /// No description provided for @renameValue.
  ///
  /// In en, this message translates to:
  /// **'Rename {value}'**
  String renameValue(String value);

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @resetFinishedLines.
  ///
  /// In en, this message translates to:
  /// **'Reset finished lines'**
  String get resetFinishedLines;

  /// No description provided for @resetValue.
  ///
  /// In en, this message translates to:
  /// **'Reset {value}'**
  String resetValue(String value);

  /// No description provided for @restart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get restart;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @reverseMotorDirection.
  ///
  /// In en, this message translates to:
  /// **'Reverse motor direction'**
  String get reverseMotorDirection;

  /// No description provided for @right.
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get right;

  /// No description provided for @rmsCurrent.
  ///
  /// In en, this message translates to:
  /// **'RMS current: {value} mA'**
  String rmsCurrent(int value);

  /// No description provided for @roll.
  ///
  /// In en, this message translates to:
  /// **'Roll'**
  String get roll;

  /// No description provided for @rollGain.
  ///
  /// In en, this message translates to:
  /// **'Roll gain'**
  String get rollGain;

  /// No description provided for @rotatePoints.
  ///
  /// In en, this message translates to:
  /// **'Rotate points'**
  String get rotatePoints;

  /// No description provided for @rotation.
  ///
  /// In en, this message translates to:
  /// **'Rotation'**
  String get rotation;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @saveEquipmentSetup.
  ///
  /// In en, this message translates to:
  /// **'Save equipment setup'**
  String get saveEquipmentSetup;

  /// No description provided for @saveSetup.
  ///
  /// In en, this message translates to:
  /// **'Save setup'**
  String get saveSetup;

  /// No description provided for @saveValue.
  ///
  /// In en, this message translates to:
  /// **'Save {value}'**
  String saveValue(String value);

  /// No description provided for @sections.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{Sections} zero{Sections} one{Section} two{Sections} few{Sections} many{Sections}}'**
  String sections(int count);

  /// No description provided for @sectionWidth.
  ///
  /// In en, this message translates to:
  /// **'Section width'**
  String get sectionWidth;

  /// No description provided for @selectExportFolder.
  ///
  /// In en, this message translates to:
  /// **'Select export folder'**
  String get selectExportFolder;

  /// No description provided for @selectValueFile.
  ///
  /// In en, this message translates to:
  /// **'Select {value} file'**
  String selectValueFile(String value);

  /// No description provided for @selectWorkSessionFile.
  ///
  /// In en, this message translates to:
  /// **'Select work session file'**
  String get selectWorkSessionFile;

  /// No description provided for @selectZipFileToImport.
  ///
  /// In en, this message translates to:
  /// **'Select Zip file to import'**
  String get selectZipFileToImport;

  /// No description provided for @sendGnssConfig.
  ///
  /// In en, this message translates to:
  /// **'Send GNSS config'**
  String get sendGnssConfig;

  /// No description provided for @sendHardwareConfig.
  ///
  /// In en, this message translates to:
  /// **'Send hardware config'**
  String get sendHardwareConfig;

  /// No description provided for @sendOverProtocol.
  ///
  /// In en, this message translates to:
  /// **'Send over {protocol}'**
  String sendOverProtocol(String protocol);

  /// No description provided for @sendPort.
  ///
  /// In en, this message translates to:
  /// **'Send port'**
  String get sendPort;

  /// No description provided for @serialPort.
  ///
  /// In en, this message translates to:
  /// **'Serial port'**
  String get serialPort;

  /// No description provided for @setDate.
  ///
  /// In en, this message translates to:
  /// **'Set date'**
  String get setDate;

  /// No description provided for @setTimeOfDay.
  ///
  /// In en, this message translates to:
  /// **'Set time of day'**
  String get setTimeOfDay;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @setToImplementWidth.
  ///
  /// In en, this message translates to:
  /// **'Set to implement width'**
  String get setToImplementWidth;

  /// No description provided for @setToValueXVehicleTurningRadius.
  ///
  /// In en, this message translates to:
  /// **'Set to {value}x vehicle turnung radius'**
  String setToValueXVehicleTurningRadius(num value);

  /// No description provided for @setToLiveReading.
  ///
  /// In en, this message translates to:
  /// **'Set to live reading'**
  String get setToLiveReading;

  /// No description provided for @setToZeroToDisableInReverse.
  ///
  /// In en, this message translates to:
  /// **'Set to 0 to completely disable in reverse.'**
  String get setToZeroToDisableInReverse;

  /// No description provided for @setup.
  ///
  /// In en, this message translates to:
  /// **'Setup'**
  String get setup;

  /// No description provided for @setValue.
  ///
  /// In en, this message translates to:
  /// **'Set {value}'**
  String setValue(String value);

  /// No description provided for @show.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get show;

  /// No description provided for @showAllLines.
  ///
  /// In en, this message translates to:
  /// **'Show all lines'**
  String get showAllLines;

  /// No description provided for @showLastRecordedPath.
  ///
  /// In en, this message translates to:
  /// **'Show last recorded path'**
  String get showLastRecordedPath;

  /// No description provided for @showMotorTargetOverride.
  ///
  /// In en, this message translates to:
  /// **'Show motor target override'**
  String get showMotorTargetOverride;

  /// No description provided for @showValue.
  ///
  /// In en, this message translates to:
  /// **'Show {value}'**
  String showValue(String value);

  /// No description provided for @sidewaysOffsetLeftRight.
  ///
  /// In en, this message translates to:
  /// **'Sideways offset (-left / +right)'**
  String get sidewaysOffsetLeftRight;

  /// No description provided for @sidewaysOffsetValue.
  ///
  /// In en, this message translates to:
  /// **'Sideways offset: {value} m'**
  String sidewaysOffsetValue(num value);

  /// No description provided for @simCore.
  ///
  /// In en, this message translates to:
  /// **'Sim core'**
  String get simCore;

  /// No description provided for @simulationFrequency.
  ///
  /// In en, this message translates to:
  /// **'Simulation frequency: {value} Hz'**
  String simulationFrequency(int value);

  /// No description provided for @size.
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// No description provided for @sizeIndicator.
  ///
  /// In en, this message translates to:
  /// **'Size indicator'**
  String get sizeIndicator;

  /// No description provided for @snap.
  ///
  /// In en, this message translates to:
  /// **'Snap'**
  String get snap;

  /// No description provided for @softeningGain.
  ///
  /// In en, this message translates to:
  /// **'Softening gain: {value}'**
  String softeningGain(num value);

  /// No description provided for @spacing.
  ///
  /// In en, this message translates to:
  /// **'Spacing'**
  String get spacing;

  /// No description provided for @stallGuardThreshold.
  ///
  /// In en, this message translates to:
  /// **'StallGuard threshold: {value}'**
  String stallGuardThreshold(int value);

  /// No description provided for @stallingSensitivity.
  ///
  /// In en, this message translates to:
  /// **'Stalling sensitivity'**
  String get stallingSensitivity;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @stealthChopMaxRpm.
  ///
  /// In en, this message translates to:
  /// **'{option,select,disabled{StealthChop max: Disabled} other{StealthChop max: {rpm} RPM}}'**
  String stealthChopMaxRpm(String option, num rpm);

  /// No description provided for @steering.
  ///
  /// In en, this message translates to:
  /// **'Steering'**
  String get steering;

  /// No description provided for @steeringActual.
  ///
  /// In en, this message translates to:
  /// **'Steering actual: {value}°'**
  String steeringActual(num value);

  /// No description provided for @steeringDelta.
  ///
  /// In en, this message translates to:
  /// **'Steering Δ: {value}°'**
  String steeringDelta(num value);

  /// No description provided for @steeringTarget.
  ///
  /// In en, this message translates to:
  /// **'Steering target: {value}°'**
  String steeringTarget(num value);

  /// No description provided for @steeringConfigurator.
  ///
  /// In en, this message translates to:
  /// **'Steering configurator'**
  String get steeringConfigurator;

  /// No description provided for @steeringHardwareAddress.
  ///
  /// In en, this message translates to:
  /// **'Steering hardware address'**
  String get steeringHardwareAddress;

  /// No description provided for @stepsIncrement.
  ///
  /// In en, this message translates to:
  /// **'Steps / increment'**
  String get stepsIncrement;

  /// No description provided for @stepsCenterMax.
  ///
  /// In en, this message translates to:
  /// **'Center-Max: {value}'**
  String stepsCenterMax(num value);

  /// No description provided for @stepsMinCenter.
  ///
  /// In en, this message translates to:
  /// **'Min-Center: {value}'**
  String stepsMinCenter(num value);

  /// No description provided for @stepsPerRotation.
  ///
  /// In en, this message translates to:
  /// **'Steps per rotation: {value}'**
  String stepsPerRotation(int value);

  /// No description provided for @stepSize.
  ///
  /// In en, this message translates to:
  /// **'Step size'**
  String get stepSize;

  /// No description provided for @stopButtonText.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stopButtonText;

  /// No description provided for @stopTheVehicle.
  ///
  /// In en, this message translates to:
  /// **'Stop the vehicle'**
  String get stopTheVehicle;

  /// No description provided for @swapPitchAndRollAxes.
  ///
  /// In en, this message translates to:
  /// **'Swap pitch and roll'**
  String get swapPitchAndRollAxes;

  /// No description provided for @swaths.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{Swaths} zero{Swaths} one{Swath} two{Swaths} few{Swaths} many{Swaths}}'**
  String swaths(int count);

  /// No description provided for @target.
  ///
  /// In en, this message translates to:
  /// **'Target'**
  String get target;

  /// No description provided for @test.
  ///
  /// In en, this message translates to:
  /// **'Test'**
  String get test;

  /// No description provided for @testDistance.
  ///
  /// In en, this message translates to:
  /// **'Test distance'**
  String get testDistance;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeAutoMode.
  ///
  /// In en, this message translates to:
  /// **'Auto mode'**
  String get themeAutoMode;

  /// No description provided for @themeDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get themeDarkMode;

  /// No description provided for @themeLightMode.
  ///
  /// In en, this message translates to:
  /// **'Light mode'**
  String get themeLightMode;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme mode'**
  String get themeMode;

  /// No description provided for @theoretical.
  ///
  /// In en, this message translates to:
  /// **'Theoretical'**
  String get theoretical;

  /// No description provided for @thisDeviceValue.
  ///
  /// In en, this message translates to:
  /// **'This device {value}'**
  String thisDeviceValue(String value);

  /// No description provided for @thresholdVelocities.
  ///
  /// In en, this message translates to:
  /// **'Threshold velocities'**
  String get thresholdVelocities;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @toLine.
  ///
  /// In en, this message translates to:
  /// **'To line'**
  String get toLine;

  /// No description provided for @totalWidth.
  ///
  /// In en, this message translates to:
  /// **'Total width: {value} m'**
  String totalWidth(num value);

  /// No description provided for @tracking.
  ///
  /// In en, this message translates to:
  /// **'Tracking'**
  String get tracking;

  /// No description provided for @trackingMode.
  ///
  /// In en, this message translates to:
  /// **'Tracking mode'**
  String get trackingMode;

  /// No description provided for @trackingModePurePursuit.
  ///
  /// In en, this message translates to:
  /// **'Pure pursuit'**
  String get trackingModePurePursuit;

  /// No description provided for @trackingModeStanley.
  ///
  /// In en, this message translates to:
  /// **'Stanley'**
  String get trackingModeStanley;

  /// No description provided for @trackWidth.
  ///
  /// In en, this message translates to:
  /// **'Track width, between centers of the {value}'**
  String trackWidth(String value);

  /// No description provided for @trajectory.
  ///
  /// In en, this message translates to:
  /// **'Trajectory'**
  String get trajectory;

  /// No description provided for @travelledPath.
  ///
  /// In en, this message translates to:
  /// **'Travelled path'**
  String get travelledPath;

  /// No description provided for @turningCircles.
  ///
  /// In en, this message translates to:
  /// **'Turning circles'**
  String get turningCircles;

  /// No description provided for @turningRadius.
  ///
  /// In en, this message translates to:
  /// **'Turning radius'**
  String get turningRadius;

  /// No description provided for @turnTriggerAngle.
  ///
  /// In en, this message translates to:
  /// **'Turn trigger angle'**
  String get turnTriggerAngle;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// Display (e.g. in gauges) for area unit enum
  ///
  /// In en, this message translates to:
  /// **'{arg, select, other{Area unit} m2{m²} ac{ac} ha{haa} daa{daa}}'**
  String unitAreaDisplay(String arg);

  /// Name for area unit enum.
  ///
  /// In en, this message translates to:
  /// **'{arg, select, other{Area unit} m2{Square meters} ac{Acre} ha{Hectare} daa{Decare}}'**
  String unitAreaName(String arg);

  /// Display (e.g. in gauges) for length unit enum
  ///
  /// In en, this message translates to:
  /// **'{arg, select, other{Length unit} m{m} ft{ft} yd{yd}}'**
  String unitLengthDisplay(String arg);

  /// Name for length unit enum.
  ///
  /// In en, this message translates to:
  /// **'{arg, select, other{Length unit} m{Meters} ft{Feet} yd{Yard}}'**
  String unitLengthName(String arg);

  /// Display (e.g. in gauges) for velocity unit enum
  ///
  /// In en, this message translates to:
  /// **'{arg, select, other{Velocity unit} mps{m/s} kph{km/h} mph{mph}}'**
  String unitVelocityDisplay(String arg);

  /// Name for velocity unit enum.
  ///
  /// In en, this message translates to:
  /// **'{arg, select, other{Velocity unit} mps{Meters per second} kph{Kilometers per hour} mph{Miles per hour}}'**
  String unitVelocityName(String arg);

  /// No description provided for @units.
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get units;

  /// No description provided for @unknownLocale.
  ///
  /// In en, this message translates to:
  /// **'Unknown locale'**
  String get unknownLocale;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @updateFrequency.
  ///
  /// In en, this message translates to:
  /// **'Update frequency: {value} Hz'**
  String updateFrequency(num value);

  /// No description provided for @upperThreshold.
  ///
  /// In en, this message translates to:
  /// **'Upper threshold'**
  String get upperThreshold;

  /// No description provided for @useDevicePosition.
  ///
  /// In en, this message translates to:
  /// **'Use device position'**
  String get useDevicePosition;

  /// No description provided for @useAsValue.
  ///
  /// In en, this message translates to:
  /// **'Use as {value}'**
  String useAsValue(String value);

  /// No description provided for @usbSerial.
  ///
  /// In en, this message translates to:
  /// **'USB / serial'**
  String get usbSerial;

  /// No description provided for @useValue.
  ///
  /// In en, this message translates to:
  /// **'Use {value}'**
  String useValue(String value);

  /// No description provided for @useImuValue.
  ///
  /// In en, this message translates to:
  /// **'Use IMU {value}'**
  String useImuValue(String value);

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @validValue.
  ///
  /// In en, this message translates to:
  /// **'Valid {value}'**
  String validValue(String value);

  /// No description provided for @value.
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// No description provided for @vehicle.
  ///
  /// In en, this message translates to:
  /// **'Vehicle'**
  String get vehicle;

  /// No description provided for @vehicleBodyLength.
  ///
  /// In en, this message translates to:
  /// **'Vehicle body length, excluding wheels'**
  String get vehicleBodyLength;

  /// No description provided for @vehicleBodyWidth.
  ///
  /// In en, this message translates to:
  /// **'Vehicle body width, excluding wheels'**
  String get vehicleBodyWidth;

  /// No description provided for @vehicleDetermined.
  ///
  /// In en, this message translates to:
  /// **'Vehicle'**
  String get vehicleDetermined;

  /// No description provided for @vehicleImage.
  ///
  /// In en, this message translates to:
  /// **'Vehicle image'**
  String get vehicleImage;

  /// No description provided for @vehicleType.
  ///
  /// In en, this message translates to:
  /// **'{option, select, other{Vehicle} Tractor{Tractor} Harvester{Harvester} ArticulatedTractor{Articulated tractor}}'**
  String vehicleType(String option);

  /// No description provided for @velocity.
  ///
  /// In en, this message translates to:
  /// **'Velocity'**
  String get velocity;

  /// No description provided for @velocityGain.
  ///
  /// In en, this message translates to:
  /// **'Velocity gain: {value}'**
  String velocityGain(num value);

  /// No description provided for @virtualLedBar.
  ///
  /// In en, this message translates to:
  /// **'Virtual LED bar'**
  String get virtualLedBar;

  /// No description provided for @was.
  ///
  /// In en, this message translates to:
  /// **'WAS'**
  String get was;

  /// No description provided for @wasMotorConfigurator.
  ///
  /// In en, this message translates to:
  /// **'WAS & motor configurator'**
  String get wasMotorConfigurator;

  /// No description provided for @wasReading.
  ///
  /// In en, this message translates to:
  /// **'WAS reading: {value}'**
  String wasReading(int value);

  /// No description provided for @wasTarget.
  ///
  /// In en, this message translates to:
  /// **'WAS target: {value}'**
  String wasTarget(int value);

  /// No description provided for @wheelbase.
  ///
  /// In en, this message translates to:
  /// **'Wheelbase'**
  String get wheelbase;

  /// No description provided for @wheelDiameter.
  ///
  /// In en, this message translates to:
  /// **'Wheel diameter'**
  String get wheelDiameter;

  /// No description provided for @wheelDiameterFront.
  ///
  /// In en, this message translates to:
  /// **'Front wheel diameter'**
  String get wheelDiameterFront;

  /// No description provided for @wheelDiameterRear.
  ///
  /// In en, this message translates to:
  /// **'Rear wheel diameter'**
  String get wheelDiameterRear;

  /// No description provided for @wheelSpacing.
  ///
  /// In en, this message translates to:
  /// **'Wheel spacing'**
  String get wheelSpacing;

  /// No description provided for @wheelWidth.
  ///
  /// In en, this message translates to:
  /// **'Wheel width'**
  String get wheelWidth;

  /// No description provided for @wheelWidthFront.
  ///
  /// In en, this message translates to:
  /// **'Front wheel width'**
  String get wheelWidthFront;

  /// No description provided for @wheelWidthRear.
  ///
  /// In en, this message translates to:
  /// **'Rear wheel width'**
  String get wheelWidthRear;

  /// No description provided for @wheels.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, other{Wheels} zero{Wheels} one{Wheel} two{Wheels} few{Wheels} many{Wheels}}'**
  String wheels(int count);

  /// No description provided for @width.
  ///
  /// In en, this message translates to:
  /// **'Width'**
  String get width;

  /// No description provided for @wifi.
  ///
  /// In en, this message translates to:
  /// **'WiFi'**
  String get wifi;

  /// No description provided for @workingAreaLength.
  ///
  /// In en, this message translates to:
  /// **'Working area length'**
  String get workingAreaLength;

  /// No description provided for @workSession.
  ///
  /// In en, this message translates to:
  /// **'Work session'**
  String get workSession;

  /// No description provided for @yaw.
  ///
  /// In en, this message translates to:
  /// **'Yaw'**
  String get yaw;

  /// No description provided for @yawFromStartup.
  ///
  /// In en, this message translates to:
  /// **'Yaw from startup'**
  String get yawFromStartup;

  /// No description provided for @zeroBearingToGnssBearing.
  ///
  /// In en, this message translates to:
  /// **'Zero bearing to GNSS bearing'**
  String get zeroBearingToGnssBearing;

  /// No description provided for @zeroBearingToNorth.
  ///
  /// In en, this message translates to:
  /// **'Zero bearing to north'**
  String get zeroBearingToNorth;

  /// No description provided for @zeroImuDescription.
  ///
  /// In en, this message translates to:
  /// **'Ensure that you are on a flat and horizontal surface, preferably concrete or asphalt.'**
  String get zeroImuDescription;

  /// No description provided for @zeroImuPitchAndRoll.
  ///
  /// In en, this message translates to:
  /// **'Zero IMU pitch and roll'**
  String get zeroImuPitchAndRoll;

  /// No description provided for @zoomIn.
  ///
  /// In en, this message translates to:
  /// **'Zoom in'**
  String get zoomIn;

  /// No description provided for @zoomOut.
  ///
  /// In en, this message translates to:
  /// **'Zoom out'**
  String get zoomOut;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'nb'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'nb':
      return AppLocalizationsNb();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
