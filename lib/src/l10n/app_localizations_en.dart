// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get abTurningRadius => 'AB turning radius';

  @override
  String get abCurve => 'AB curve';

  @override
  String get abSpacing => 'AB spacing/width';

  @override
  String get abTracking => 'AB tracking';

  @override
  String get about => 'About';

  @override
  String get acceleration => 'Acceleration';

  @override
  String get ackermannPercentage => 'Ackermann percentage';

  @override
  String get activateAll => 'Activate all';

  @override
  String get activeCenter => 'Active center';

  @override
  String actualRpm(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Actual RPM: $valueString';
  }

  @override
  String get addButton => 'Add button';

  @override
  String get addConnector => 'Add connector';

  @override
  String get addInteriorBoundary => 'Add interior boundary';

  @override
  String get addPoint => 'Add point';

  @override
  String get allowDownload => 'Allow download';

  @override
  String get allowLongBreaks => 'Allow long breaks';

  @override
  String get allowSimInterpolation => 'Allow sim interpolation';

  @override
  String get alwaysPointMapNorth => 'Always point map north';

  @override
  String get antenna => 'Antenna';

  @override
  String get antennaHeight => 'Antenna height';

  @override
  String get antennaLateralOffset => 'Antenna lateral offset (-left / +right)';

  @override
  String get antennaPosition => 'Antenna position';

  @override
  String get apHost => 'AP host';

  @override
  String get aPlusLine => 'A+ line';

  @override
  String get apply => 'Apply';

  @override
  String get applyAndUse => 'Apply and use';

  @override
  String get applyConfiguration => 'Apply configuration';

  @override
  String get area => 'Area';

  @override
  String get asymmetricRollGain => 'Asymmetric roll gain';

  @override
  String get attach => 'Attach';

  @override
  String attachValue(String value) {
    return 'Attach $value';
  }

  @override
  String get audioLevels => 'Audio levels';

  @override
  String get audioLevelAutosteeringDisabled => 'Autosteering disabled';

  @override
  String get audioLevelAutosteeringEnabled => 'Autosteering enabled';

  @override
  String get audioLevelAutosteeringStandby => 'Autosteering standby';

  @override
  String get audioLevelRtkLostAlarm => 'RTK lost alarm';

  @override
  String get autoCenterSteering => 'Auto center styring';

  @override
  String get automatic => 'Automatic';

  @override
  String get autoSlowDown => 'Auto slow down';

  @override
  String get autosteeringAngularVelocityDescription =>
      'Autosteering limits steering to stay below this.';

  @override
  String get autosteeringDisabledAboveThreshold =>
      'Autosteering disabled above threshold';

  @override
  String get autosteeringDisabledBelowThreshold =>
      'Autosteering disabled below threshold';

  @override
  String get autosteeringParameters => 'Autosteering parameters';

  @override
  String autosteeringStateOptionShort(String option) {
    String _temp0 = intl.Intl.selectLogic(
      option,
      {
        'other': 'Unknown',
        'disabled': 'Off',
        'enabled': 'On',
        'standby': 'Stby',
      },
    );
    return '$_temp0';
  }

  @override
  String get barWidth => 'Bar width';

  @override
  String get baudRate => 'Baud rate';

  @override
  String get bearing => 'Bearing';

  @override
  String get bits => 'Bits';

  @override
  String get border => 'Border';

  @override
  String get borderPoints => 'Border points';

  @override
  String get boundingBox => 'Bounding box';

  @override
  String get bufferedBoundingBox => 'Buffered bounding box';

  @override
  String get bufferDistance => 'Buffer distance';

  @override
  String get bufferedField => 'Buffered field';

  @override
  String get bufferJoinMode => 'Buffer join mode';

  @override
  String get button => 'Button';

  @override
  String get buttonColor => 'Button color';

  @override
  String get cache => 'Cache';

  @override
  String get calibrateMotor => 'Calibrate motor';

  @override
  String get cancel => 'Cancel';

  @override
  String get center => 'Center';

  @override
  String get centerLeds => 'Center LEDs';

  @override
  String get childHitches => 'Child hitches';

  @override
  String get chooseLog => 'Choose log';

  @override
  String get clearPoints => 'Clear points';

  @override
  String get clearRecordedPath => 'Clear recorded path';

  @override
  String get clearUnused => 'Clear unused';

  @override
  String get clearWorkedArea => 'Clear worked area';

  @override
  String get close => 'Close';

  @override
  String get closeActive => 'Close active';

  @override
  String closeActiveValue(String value) {
    return 'Close active $value?';
  }

  @override
  String closeValue(String value) {
    return 'Close $value';
  }

  @override
  String get colorTheme => 'Color theme';

  @override
  String get combined => 'Combined';

  @override
  String get configure => 'Configure';

  @override
  String configureValue(String value) {
    return 'Configure $value';
  }

  @override
  String get confirm => 'Confirm';

  @override
  String connectorRelation(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'other': 'Relation',
        'child': 'Child',
        'parent': 'Parent',
      },
    );
    return '$_temp0';
  }

  @override
  String connectors(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Connectors',
      few: 'Connectors',
      two: 'Connectors',
      one: 'Connector',
      zero: 'Connectors',
      other: 'Connectors',
    );
    return '$_temp0';
  }

  @override
  String connectorType(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'other': 'Connector',
        'fixed': 'Three-point/Fixed',
        'drawbar': 'Drawbar',
      },
    );
    return '$_temp0';
  }

  @override
  String coolStepMinRpm(String option, num rpm) {
    final intl.NumberFormat rpmNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String rpmString = rpmNumberFormat.format(rpm);

    String _temp0 = intl.Intl.selectLogic(
      option,
      {
        'disabled': 'CoolStep min: Disabled',
        'other': 'CoolStep min: $rpmString RPM',
      },
    );
    return '$_temp0';
  }

  @override
  String get copernicusId => 'Copernicus ID';

  @override
  String copyFromValue(String value) {
    return 'Copy from $value';
  }

  @override
  String get copyWorkSessionDescription =>
      'Copy field, implement and guidance from this.';

  @override
  String get create => 'Create';

  @override
  String get created => 'Created';

  @override
  String get createFieldFromPathTracking => 'Create field from path tracking';

  @override
  String get createFieldFromRecording => 'Create field from recording';

  @override
  String get createNew => 'Create new';

  @override
  String get createPathTrackingFromBufferedFieldExterior =>
      'Create path tracking from buffered field exterior';

  @override
  String createValue(String value) {
    return 'Create $value';
  }

  @override
  String crossDistanceGain(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Cross distance gain: $valueString';
  }

  @override
  String get current => 'Current';

  @override
  String get curve => 'Curve';

  @override
  String get cycleLightSystemDarkMode => 'Cycle light/system/dark mode';

  @override
  String get dadMode => 'Dad mode';

  @override
  String get dataUsageMonth => 'Data usage (month):';

  @override
  String get dataUsageSession => 'Data usage (session):';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Days',
      few: 'Days',
      two: 'Days',
      one: 'Day',
      zero: 'Days',
      other: 'Days',
    );
    return '$_temp0';
  }

  @override
  String dcStepMinRpm(String option, num rpm) {
    final intl.NumberFormat rpmNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String rpmString = rpmNumberFormat.format(rpm);

    String _temp0 = intl.Intl.selectLogic(
      option,
      {
        'disabled': 'DcStep min: Disabled',
        'other': 'DcStep min: $rpmString RPM',
      },
    );
    return '$_temp0';
  }

  @override
  String get deactivateAll => 'Deactivate all';

  @override
  String get debug => 'Debug';

  @override
  String get debugging => 'Debugging';

  @override
  String get debugMode => 'Debug mode';

  @override
  String get defaultOption => 'Default';

  @override
  String delayValueMs(int value) {
    return 'Delay: $value ms';
  }

  @override
  String delayReadings(num value) {
    return 'Delay readings: $value ms';
  }

  @override
  String deleteValue(String value) {
    return 'Delete $value';
  }

  @override
  String get detach => 'Detach';

  @override
  String get detachAll => 'Detach all';

  @override
  String dimensions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Dimensions',
      few: 'Dimensions',
      two: 'Dimensions',
      one: 'Dimension',
      zero: 'Dimensions',
      other: 'Dimensions',
    );
    return '$_temp0';
  }

  @override
  String get disableAutosteering => 'Disable autosteering';

  @override
  String get discrete => 'Discrete';

  @override
  String get distancePerLed => 'Distance / LED';

  @override
  String get doNotDisable => 'Do not disable';

  @override
  String drawValue(String value) {
    return 'Draw $value';
  }

  @override
  String get dualAntenna => 'Dual antenna';

  @override
  String get dualAntennaAngle => 'Dual angle, relative to forward';

  @override
  String get dualAntennaBaseline => 'Dual antenna baseline';

  @override
  String get dubinsPath => 'Dubins path';

  @override
  String get editNote => 'Edit note';

  @override
  String editValue(String value) {
    return 'Edit $value';
  }

  @override
  String get editRecordedPath => 'Edit recorded path';

  @override
  String get effectiveOnRestart => 'Effective on restart';

  @override
  String get enable => 'Enable';

  @override
  String get enable3d => 'Enable 3D';

  @override
  String get enableAutosteering => 'Enable autosteering';

  @override
  String get enabled => 'Enabled';

  @override
  String get end => 'End';

  @override
  String get endLeds => 'End LEDs';

  @override
  String get enteredIdMustBeAValidUuid =>
      'The entered ID must be a valid UUID.';

  @override
  String enterValue(String value) {
    return 'Enter $value';
  }

  @override
  String get equalWidths => 'Equal widths';

  @override
  String get implement => 'Implement';

  @override
  String get implementDetermined => 'Implement';

  @override
  String get implementDrawbarLength => 'Implement drawbar length';

  @override
  String get equipmentSetup => 'Equipment setup';

  @override
  String get error => 'Error';

  @override
  String get errorOverTime => 'Error over time';

  @override
  String get errorRateOfChange => 'Error rate of change';

  @override
  String get ethernet => 'Ethernet';

  @override
  String get everything => 'Everything';

  @override
  String get exportAction => 'Export';

  @override
  String get exportAll => 'Export all';

  @override
  String exportValue(String value) {
    return 'Export $value';
  }

  @override
  String get exterior => 'Exterior';

  @override
  String get exteriorBoundary => 'Exterior boundary';

  @override
  String get field => 'Field';

  @override
  String get fieldBuffer => 'Field buffer';

  @override
  String get finishEditing => 'Finish editing';

  @override
  String get finishRecording => 'Finish recording';

  @override
  String get front => 'Front';

  @override
  String get frontAxle => 'Front axle';

  @override
  String get frontAxleToFrontHitchDistance =>
      'Front axle to front hitch distance';

  @override
  String get frontAxleToRearDrawbarDistance =>
      'Front axle to rear drawbar distance';

  @override
  String get frontAxleToRearHitchDistance =>
      'Front axle to rear hitch distance';

  @override
  String get frontWheels => 'Front wheels';

  @override
  String get fullstep => 'Fullstep';

  @override
  String get gain => 'Gain';

  @override
  String get gaugeAverageCount => 'Gauge average count';

  @override
  String get getHardwareConfig => 'Get hardware config';

  @override
  String get gnss => 'GNSS';

  @override
  String get graph => 'Graph';

  @override
  String get grid => 'Grid';

  @override
  String get guidance => 'Guidance';

  @override
  String get hardware => 'Hardware';

  @override
  String get hardwareConnected => 'Hardware connected';

  @override
  String get hardwareNotConnected => 'Hardware not connected';

  @override
  String get heading => 'Heading';

  @override
  String get hideUnlitLeds => 'Hide unlit LEDs';

  @override
  String highVelocityMinRpm(String option, num rpm) {
    final intl.NumberFormat rpmNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String rpmString = rpmNumberFormat.format(rpm);

    String _temp0 = intl.Intl.selectLogic(
      option,
      {
        'disabled': 'High velocity min: Disabled',
        'other': 'High velocity min: $rpmString RPM',
      },
    );
    return '$_temp0';
  }

  @override
  String hitchOption(String option) {
    String _temp0 = intl.Intl.selectLogic(
      option,
      {
        'other': 'Hitch',
        'fixed': 'Fixed',
        'drawbar': 'Drawbar',
      },
    );
    return '$_temp0';
  }

  @override
  String get hitchToFrontFixedHitchDistance =>
      'Hitch to front fixed hitch distance';

  @override
  String get hitchToRearFixedHitchDistance =>
      'Hitch to rear fixed hitch distance';

  @override
  String get hitchToRearDrawbarDistance => 'Hitch to rear drawbar distance';

  @override
  String hitches(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Hitches',
      few: 'Hitches',
      two: 'Hitches',
      one: 'Hitch',
      zero: 'Hitches',
      other: 'Hitches',
    );
    return '$_temp0';
  }

  @override
  String get holdToReset => 'Hold to reset';

  @override
  String get home => 'Home';

  @override
  String get homeEnterPosition => 'Enter home position';

  @override
  String get homeSetToScreenCenter => 'Set to screen center';

  @override
  String get homeUseEnteredPosition => 'Use entered position';

  @override
  String get importAction => 'Import';

  @override
  String get importExport => 'Import/Export';

  @override
  String importValue(String value) {
    return 'Import $value';
  }

  @override
  String get imu => 'IMU';

  @override
  String get imuConfigurator => 'IMU configurator';

  @override
  String get inheritColorsFromVehicle => 'Inherit colors from vehicle';

  @override
  String get inner => 'Inner';

  @override
  String get interior => 'Interior';

  @override
  String get interiorBorderBufferDistance =>
      'Interior border (holes) buffer distance';

  @override
  String get intermediateLeds => 'Intermediate LEDs';

  @override
  String get interpolationDescription => 'Interpolation between GNSS updates';

  @override
  String interpolationDistance(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Interpolation distance: $valueString m';
  }

  @override
  String get interval => 'Interval';

  @override
  String invalidValue(String value) {
    return 'Invalid $value';
  }

  @override
  String get invertLedBar => 'Invert light bar';

  @override
  String get invertPitch => 'Invert pitch';

  @override
  String get invertRoll => 'Invert roll';

  @override
  String get invertSensorInput => 'Invert sensor input';

  @override
  String keepLogsForValue(String value) {
    return 'Keep logs for $value ';
  }

  @override
  String sinceLastValueMs(int value) {
    return 'Since last: $value ms';
  }

  @override
  String get lateralOffset => 'Lateral offset';

  @override
  String get latitudeNS => 'Latitude (N/S)';

  @override
  String get latitudeShort => 'Lat';

  @override
  String get ledSize => 'LED Size';

  @override
  String get left => 'Left';

  @override
  String get length => 'Length';

  @override
  String get limitMode => 'Limit mode';

  @override
  String get line => 'Line';

  @override
  String get load => 'Load';

  @override
  String loadValue(String value) {
    return 'Load $value';
  }

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
  String get lockMapToVehicle => 'Lock map to vehicle';

  @override
  String get lockToField => 'Lock to field';

  @override
  String get logging => 'Logging';

  @override
  String get logReplay => 'Log replay';

  @override
  String get logs => 'Logs';

  @override
  String get longitudeEW => 'Longitude (E/W)';

  @override
  String get longitudinalOffset => 'Longitudinal offset';

  @override
  String get longitudeShort => 'Lon';

  @override
  String lookAheadMinDistance(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Look ahead min distance: $valueString m';
  }

  @override
  String lookAheadTime(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Look ahead time: $valueString s';
  }

  @override
  String get loop => 'Loop';

  @override
  String get lowerThreshold => 'Lower threshold';

  @override
  String get manual => 'Manual';

  @override
  String get manualSimulationMode => 'Manual simulation mode';

  @override
  String get map => 'Map';

  @override
  String get max => 'Max';

  @override
  String maxAccelerationRpms(int value) {
    return 'Max acceleration: $value RPM/s';
  }

  @override
  String maxAngularVelocity(int value) {
    return 'Max angular velocity: $value °/s';
  }

  @override
  String maxDecelerationRpms(int value) {
    return 'Max deceleration: $value RPM/s';
  }

  @override
  String get maxDistance => 'Max distance';

  @override
  String maxReversingVelocity(num value, String unit) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Max reversing velocity: $valueString $unit';
  }

  @override
  String get maxSteeringAngle => 'Max steering angle (inner wheel)';

  @override
  String maxVelocityRpm(int value) {
    return 'Max velocity: $value RPM';
  }

  @override
  String get menu => 'Menu';

  @override
  String get microsteps => 'Microsteps';

  @override
  String get min => 'Min';

  @override
  String get minDistance => 'Min distance';

  @override
  String get miniMap => 'Mini map';

  @override
  String get minimumTurningRadius => 'Minimum turning radius';

  @override
  String get minOffsetSkips => 'Min offset skips';

  @override
  String get motor => 'Motor';

  @override
  String motorStatusOption(String option) {
    String _temp0 = intl.Intl.selectLogic(
      option,
      {
        'other': 'Unknown motor status',
        'disabled': 'Motor disabled',
        'freeWheeling': 'Motor freewheeling',
        'running': 'Motor running',
        'stalled': 'Motor stalled',
        'noCommand': 'Motor stopped, too long since last command',
        'standby': 'Motor is disabled, but will be enabled automatically',
      },
    );
    return '$_temp0';
  }

  @override
  String get motorTargetOverride => 'Motor target override';

  @override
  String get name => 'Name';

  @override
  String get nameAlreadyInUse => 'Name already in use';

  @override
  String nameTheValue(String value) {
    return 'Name the $value';
  }

  @override
  String get network => 'Network';

  @override
  String get noAction => 'No action';

  @override
  String get noName => 'No name';

  @override
  String noNameEnteredValue(String value) {
    return 'No name entered! Please enter a name so that the $value can be saved!';
  }

  @override
  String get normalized => 'Normalized';

  @override
  String get note => 'Note';

  @override
  String notReceivingSensorReadings(String sensor) {
    return 'Not receiving $sensor readings';
  }

  @override
  String ntripActiveProfile(String profile) {
    return 'Active profile: $profile';
  }

  @override
  String get ntripAddProfile => 'Add profile';

  @override
  String get ntripCasterSourcetable => 'NTRIP caster sourcetable';

  @override
  String get ntripCreateProfileTitle => 'Create NTRIP profile';

  @override
  String get ntripEditProfile => 'Edit profile';

  @override
  String get ntripEditProfileTitle => 'Edit NTRIP profile';

  @override
  String get ntripFindClosestBaseStation => 'Find closest base station';

  @override
  String get ntripGgaSendingInterval => 'GGA sending interval (s)';

  @override
  String get ntripHostAddress => 'Host address';

  @override
  String get ntripHostPort => 'Host port';

  @override
  String get ntripInputWholeSeconds => 'Input whole seconds from 1 or empty';

  @override
  String get ntripLoadProfile => 'Load profile';

  @override
  String get ntripMountPointBaseStation => 'Mount point / base station';

  @override
  String get ntripNoProfileSelected => 'No profile selected';

  @override
  String get ntripRtk => 'NTRIP (RTK)';

  @override
  String get nudgeControls => 'Nudge controls';

  @override
  String get numberOfSections => 'Number of sections';

  @override
  String get numberOfWheelsDescription =>
      'Number of wheels,\ni.e. does your vehicle have twin\nor triple wheels';

  @override
  String get off => 'Off';

  @override
  String get offsetFromBaseLine => 'Offset from base line';

  @override
  String get offsetLeftRight => 'Offset (-left / +right)';

  @override
  String get on => 'On';

  @override
  String get onlyUseGnssSyncedReadings => 'Only use GNSS synced readings';

  @override
  String get opacity => 'Opacity';

  @override
  String get outer => 'Outer';

  @override
  String get password => 'Password';

  @override
  String get path => 'Path';

  @override
  String get pathColor => 'Path color';

  @override
  String get pathRecording => 'Path recording';

  @override
  String get pathTracking => 'Path tracking';

  @override
  String get pathType => 'Path type';

  @override
  String get pause => 'Pause';

  @override
  String get perspective => 'Perspective';

  @override
  String get pid => 'PID';

  @override
  String get pitch => 'Pitch';

  @override
  String get pitchGain => 'Pitch gain';

  @override
  String get pivotAntennaWarning =>
      'Antenna MUST be on the front body of the vehicle!';

  @override
  String pivotCenterToValue(String value) {
    return 'Pivot center to $value';
  }

  @override
  String get pivotToAntenna => 'Pivot to antenna';

  @override
  String points(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Points',
      few: 'Points',
      two: 'Points',
      one: 'Point',
      zero: 'Points',
      other: 'Points',
    );
    return '$_temp0';
  }

  @override
  String get pointsAhead => 'Points ahead';

  @override
  String get pointsBehind => 'Points behind';

  @override
  String polygons(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Polygons',
      few: 'Polygons',
      two: 'Polygons',
      one: 'Polygon',
      zero: 'Polygons',
      other: 'Polygons',
    );
    return '$_temp0';
  }

  @override
  String get portNetwork => 'Port';

  @override
  String get position => 'Position';

  @override
  String get preview => 'Preview';

  @override
  String primaryColor(String option) {
    String _temp0 = intl.Intl.selectLogic(
      option,
      {
        'other': 'Color',
        'red': 'Red',
        'pink': 'Pink',
        'purple': 'Purple',
        'deepPurple': 'Deep purple',
        'indigo': 'Indigo',
        'blue': 'Blue',
        'lightBlue': 'Light blue',
        'cyan': 'Cyan',
        'teal': 'Teal',
        'green': 'Green',
        'lightGreen': 'Light green',
        'lime': 'Lime',
        'yellow': 'Yellow',
        'amber': 'Amber',
        'orange': 'Orange',
        'deepOrange': 'Deep orange',
        'brown': 'Brown',
        'blueGrey': 'Blue grey',
      },
    );
    return '$_temp0';
  }

  @override
  String get rawBufferPoints => 'Raw buffer points';

  @override
  String rawSensorReading(String sensor) {
    return 'Raw $sensor reading';
  }

  @override
  String get rear => 'Rear';

  @override
  String get rearAxle => 'Rear axle';

  @override
  String get rearAxleToFrontHitchDistance =>
      'Rear axle to front hitch distance';

  @override
  String get rearAxleToRearDrawbarDistance =>
      'Rear axle to rear drawbar distance';

  @override
  String get rearAxleToRearHitchDistance => 'Rear axle to rear hitch distance';

  @override
  String get rearWheels => 'Rear wheels';

  @override
  String get receivePort => 'Receive port';

  @override
  String get receiverConfiguration => 'Receiver configuration';

  @override
  String get record => 'Record';

  @override
  String get recording => 'Recording';

  @override
  String get recordingPosition => 'Recording position';

  @override
  String get recordingPositionFromWorkingAreaStart =>
      'Recording position from working area start';

  @override
  String get recordingTapToPause => 'Recording, tap to pause';

  @override
  String get remoteControl => 'Remote control';

  @override
  String remoteControlAction(String option) {
    String _temp0 = intl.Intl.selectLogic(
      option,
      {
        'other': 'No action',
        'toggleImplementSections': 'Toggle implement sections',
        'toggleAutosteering': 'Toggle autosteering',
        'toggleABSnap': 'Toggle AB-line snap to closest line',
        'resetNudgeDistance': 'Reset nudge distance to 0',
      },
    );
    return '$_temp0';
  }

  @override
  String get remoteControlConfigurator => 'Remove control configurator';

  @override
  String get remoteControlHardwareAddress => 'Remove control hardware address';

  @override
  String removeValue(String value) {
    return 'Remove $value?';
  }

  @override
  String get removeSensitiveData => 'Remove sensitive data';

  @override
  String get removeSensitiveDataDescription =>
      'Removes NTRIP profiles (username, password), Copernicus ID and home position';

  @override
  String get rename => 'Rename';

  @override
  String get renameAndSave => 'Rename and save';

  @override
  String renameValue(String value) {
    return 'Rename $value';
  }

  @override
  String get reset => 'Reset';

  @override
  String get resetFinishedLines => 'Reset finished lines';

  @override
  String resetValue(String value) {
    return 'Reset $value';
  }

  @override
  String get restart => 'Restart';

  @override
  String get resume => 'Resume';

  @override
  String get reverseMotorDirection => 'Reverse motor direction';

  @override
  String get right => 'Right';

  @override
  String rmsCurrent(int value) {
    return 'RMS current: $value mA';
  }

  @override
  String get roll => 'Roll';

  @override
  String get rollGain => 'Roll gain';

  @override
  String get rotatePoints => 'Rotate points';

  @override
  String get rotation => 'Rotation';

  @override
  String get save => 'Save';

  @override
  String get saveEquipmentSetup => 'Save equipment setup';

  @override
  String get saveSetup => 'Save setup';

  @override
  String saveValue(String value) {
    return 'Save $value';
  }

  @override
  String sections(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Sections',
      few: 'Sections',
      two: 'Sections',
      one: 'Section',
      zero: 'Sections',
      other: 'Sections',
    );
    return '$_temp0';
  }

  @override
  String get sectionWidth => 'Section width';

  @override
  String get selectExportFolder => 'Select export folder';

  @override
  String selectValueFile(String value) {
    return 'Select $value file';
  }

  @override
  String get selectWorkSessionFile => 'Select work session file';

  @override
  String get selectZipFileToImport => 'Select Zip file to import';

  @override
  String get sendGnssConfig => 'Send GNSS config';

  @override
  String get sendHardwareConfig => 'Send hardware config';

  @override
  String sendOverProtocol(String protocol) {
    return 'Send over $protocol';
  }

  @override
  String get sendPort => 'Send port';

  @override
  String get serialPort => 'Serial port';

  @override
  String get setDate => 'Set date';

  @override
  String get setTimeOfDay => 'Set time of day';

  @override
  String get settings => 'Settings';

  @override
  String get setToImplementWidth => 'Set to implement width';

  @override
  String setToValueXVehicleTurningRadius(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 2,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Set to ${valueString}x vehicle turnung radius';
  }

  @override
  String get setToLiveReading => 'Set to live reading';

  @override
  String get setToZeroToDisableInReverse =>
      'Set to 0 to completely disable in reverse.';

  @override
  String get setup => 'Setup';

  @override
  String setValue(String value) {
    return 'Set $value';
  }

  @override
  String get show => 'Show';

  @override
  String get showAllLines => 'Show all lines';

  @override
  String get showLastRecordedPath => 'Show last recorded path';

  @override
  String get showMotorTargetOverride => 'Show motor target override';

  @override
  String showValue(String value) {
    return 'Show $value';
  }

  @override
  String get sidewaysOffsetLeftRight => 'Sideways offset (-left / +right)';

  @override
  String sidewaysOffsetValue(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Sideways offset: $valueString m';
  }

  @override
  String get simCore => 'Sim core';

  @override
  String simulationFrequency(int value) {
    return 'Simulation frequency: $value Hz';
  }

  @override
  String get size => 'Size';

  @override
  String get sizeIndicator => 'Size indicator';

  @override
  String get snap => 'Snap';

  @override
  String softeningGain(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Softening gain: $valueString';
  }

  @override
  String get spacing => 'Spacing';

  @override
  String stallGuardThreshold(int value) {
    return 'StallGuard threshold: $value';
  }

  @override
  String get stallingSensitivity => 'Stalling sensitivity';

  @override
  String get start => 'Start';

  @override
  String stealthChopMaxRpm(String option, num rpm) {
    final intl.NumberFormat rpmNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String rpmString = rpmNumberFormat.format(rpm);

    String _temp0 = intl.Intl.selectLogic(
      option,
      {
        'disabled': 'StealthChop max: Disabled',
        'other': 'StealthChop max: $rpmString RPM',
      },
    );
    return '$_temp0';
  }

  @override
  String get steering => 'Steering';

  @override
  String steeringActual(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Steering actual: $valueString°';
  }

  @override
  String steeringDelta(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Steering Δ: $valueString°';
  }

  @override
  String steeringTarget(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Steering target: $valueString°';
  }

  @override
  String get steeringConfigurator => 'Steering configurator';

  @override
  String get steeringHardwareAddress => 'Steering hardware address';

  @override
  String get stepsIncrement => 'Steps / increment';

  @override
  String stepsCenterMax(num value) {
    return 'Center-Max: $value';
  }

  @override
  String stepsMinCenter(num value) {
    return 'Min-Center: $value';
  }

  @override
  String stepsPerRotation(int value) {
    return 'Steps per rotation: $value';
  }

  @override
  String get stepSize => 'Step size';

  @override
  String get stopButtonText => 'Stop';

  @override
  String get stopTheVehicle => 'Stop the vehicle';

  @override
  String get swapPitchAndRollAxes => 'Swap pitch and roll';

  @override
  String swaths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Swaths',
      few: 'Swaths',
      two: 'Swaths',
      one: 'Swath',
      zero: 'Swaths',
      other: 'Swaths',
    );
    return '$_temp0';
  }

  @override
  String get target => 'Target';

  @override
  String get test => 'Test';

  @override
  String get testDistance => 'Test distance';

  @override
  String get theme => 'Theme';

  @override
  String get themeAutoMode => 'Auto mode';

  @override
  String get themeDarkMode => 'Dark mode';

  @override
  String get themeLightMode => 'Light mode';

  @override
  String get themeMode => 'Theme mode';

  @override
  String get theoretical => 'Theoretical';

  @override
  String thisDeviceValue(String value) {
    return 'This device $value';
  }

  @override
  String get thresholdVelocities => 'Threshold velocities';

  @override
  String get time => 'Time';

  @override
  String get toLine => 'To line';

  @override
  String totalWidth(num value) {
    return 'Total width: $value m';
  }

  @override
  String get tracking => 'Tracking';

  @override
  String get trackingMode => 'Tracking mode';

  @override
  String get trackingModePurePursuit => 'Pure pursuit';

  @override
  String get trackingModeStanley => 'Stanley';

  @override
  String trackWidth(String value) {
    return 'Track width, between centers of the $value';
  }

  @override
  String get trajectory => 'Trajectory';

  @override
  String get travelledPath => 'Travelled path';

  @override
  String get turningCircles => 'Turning circles';

  @override
  String get turningRadius => 'Turning radius';

  @override
  String get turnTriggerAngle => 'Turn trigger angle';

  @override
  String get type => 'Type';

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
  String get units => 'Units';

  @override
  String get unknownLocale => 'Unknown locale';

  @override
  String get update => 'Update';

  @override
  String updateFrequency(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Update frequency: $valueString Hz';
  }

  @override
  String get upperThreshold => 'Upper threshold';

  @override
  String get useDevicePosition => 'Use device position';

  @override
  String useAsValue(String value) {
    return 'Use as $value';
  }

  @override
  String get usbSerial => 'USB / serial';

  @override
  String useValue(String value) {
    return 'Use $value';
  }

  @override
  String useImuValue(String value) {
    return 'Use IMU $value';
  }

  @override
  String get username => 'Username';

  @override
  String validValue(String value) {
    return 'Valid $value';
  }

  @override
  String get value => 'Value';

  @override
  String get vehicle => 'Vehicle';

  @override
  String get vehicleBodyLength => 'Vehicle body length, excluding wheels';

  @override
  String get vehicleBodyWidth => 'Vehicle body width, excluding wheels';

  @override
  String get vehicleDetermined => 'Vehicle';

  @override
  String get vehicleImage => 'Vehicle image';

  @override
  String vehicleType(String option) {
    String _temp0 = intl.Intl.selectLogic(
      option,
      {
        'other': 'Vehicle',
        'Tractor': 'Tractor',
        'Harvester': 'Harvester',
        'ArticulatedTractor': 'Articulated tractor',
      },
    );
    return '$_temp0';
  }

  @override
  String get velocity => 'Velocity';

  @override
  String velocityGain(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Velocity gain: $valueString';
  }

  @override
  String get virtualLedBar => 'Virtual LED bar';

  @override
  String get was => 'WAS';

  @override
  String get wasMotorConfigurator => 'WAS & motor configurator';

  @override
  String wasReading(int value) {
    return 'WAS reading: $value';
  }

  @override
  String wasTarget(int value) {
    return 'WAS target: $value';
  }

  @override
  String get wheelbase => 'Wheelbase';

  @override
  String get wheelDiameter => 'Wheel diameter';

  @override
  String get wheelSpacing => 'Wheel spacing';

  @override
  String get wheelWidth => 'Wheel width';

  @override
  String wheels(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Wheels',
      few: 'Wheels',
      two: 'Wheels',
      one: 'Wheel',
      zero: 'Wheels',
      other: 'Wheels',
    );
    return '$_temp0';
  }

  @override
  String get width => 'Width';

  @override
  String get wifi => 'WiFi';

  @override
  String get workingAreaLength => 'Working area length';

  @override
  String get workSession => 'Work session';

  @override
  String get yaw => 'Yaw';

  @override
  String get yawFromStartup => 'Yaw from startup';

  @override
  String get zeroBearingToGnssBearing => 'Zero bearing to GNSS bearing';

  @override
  String get zeroBearingToNorth => 'Zero bearing to north';

  @override
  String get zeroImuDescription =>
      'Ensure that you are on a flat and horizontal surface, preferably concrete or asphalt.';

  @override
  String get zeroImuPitchAndRoll => 'Zero IMU pitch and roll';

  @override
  String get zoomIn => 'Zoom in';

  @override
  String get zoomOut => 'Zoom out';
}
