// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get abTurningRadius => 'AB svingradius';

  @override
  String get abCurve => 'AB-kurve';

  @override
  String get abSpacing => 'AB-avstand/bredde';

  @override
  String get abTracking => 'AB-sporing';

  @override
  String get about => 'Om';

  @override
  String get acceleration => 'Akselerasjon';

  @override
  String get ackermannPercentage => 'Ackermann-prosent';

  @override
  String get activateAll => 'Aktiver alle';

  @override
  String get activeCenter => 'Aktivt senter';

  @override
  String actualRpm(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Faktisk RPM: $valueString';
  }

  @override
  String get addButton => 'Legg til knapp';

  @override
  String get addConnector => 'Legg til kobling';

  @override
  String get addInteriorBoundary => 'Legg til indre grense';

  @override
  String get addPoint => 'Legg til punkt';

  @override
  String get allowDownload => 'Tillat nedlasting';

  @override
  String get allowLongBreaks => 'Tillat lange pauser';

  @override
  String get allowSimInterpolation => 'Tillat sim-interpolasjon';

  @override
  String get alwaysPointMapNorth => 'Alltid pek kart mot nord';

  @override
  String get antenna => 'Antenne';

  @override
  String get antennaHeight => 'Antennehøyde';

  @override
  String get antennaLateralOffset =>
      'Antenne sideveis foskyvning (-venstre / +høyre)';

  @override
  String get antennaPosition => 'Antenneposisjon';

  @override
  String get apHost => 'WiFi-sone';

  @override
  String get aPlusLine => 'A+ linje';

  @override
  String get apply => 'Bruk';

  @override
  String get applyAndUse => 'Ta i bruk';

  @override
  String get applyConfiguration => 'Bruk konfigurasjon';

  @override
  String get area => 'Areal';

  @override
  String get asymmetricRollGain => 'Asymmetrisk krengeforsterkning';

  @override
  String get attach => 'Koble til';

  @override
  String attachValue(String value) {
    return 'Koble til $value';
  }

  @override
  String get audioLevels => 'Lydnivå';

  @override
  String get audioLevelAutosteeringDisabled => 'Autostyring deaktivert';

  @override
  String get audioLevelAutosteeringEnabled => 'Autostyring aktivert';

  @override
  String get audioLevelAutosteeringStandby => 'Autostyring venter';

  @override
  String get audioLevelRtkLostAlarm => 'Alarm for tap av RTK';

  @override
  String get autoCenterSteering => 'Autosentrer styring';

  @override
  String get automatic => 'Automatisk';

  @override
  String get autoSlowDown => 'Autosakking av fart';

  @override
  String get autosteeringAngularVelocityDescription =>
      'Autostyring begrenser styringen til å holde seg under denne.';

  @override
  String get autosteeringDisabledAboveThreshold =>
      'Autostyring skrus av over grensen';

  @override
  String get autosteeringDisabledBelowThreshold =>
      'Autostyring skrus av under grensen';

  @override
  String get autosteeringParameters => 'Autostyringparametre';

  @override
  String autosteeringStateOptionShort(String option) {
    String _temp0 = intl.Intl.selectLogic(
      option,
      {
        'other': 'Ukjent',
        'disabled': 'Av',
        'enabled': 'På',
        'standby': 'Vent',
      },
    );
    return '$_temp0';
  }

  @override
  String get barWidth => 'LED-bar bredde';

  @override
  String get baudRate => 'Baudrate';

  @override
  String get bearing => 'Retning';

  @override
  String get bits => 'Bits';

  @override
  String get border => 'Grense';

  @override
  String get borderPoints => 'Grensepunkter';

  @override
  String get boundingBox => 'Avgrensningsboks';

  @override
  String get bufferedBoundingBox => 'Bufret avgrensningsboks';

  @override
  String get bufferDistance => 'Bufferavstand';

  @override
  String get bufferedField => 'Bufret skifte';

  @override
  String get bufferJoinMode => 'Buffer-hjørnemodus';

  @override
  String get button => 'Knapp';

  @override
  String get buttonColor => 'Knappfarge';

  @override
  String get cache => 'Mellomlager';

  @override
  String get calibrateMotor => 'Kalibrer motor';

  @override
  String get cancel => 'Avbryt';

  @override
  String get center => 'Midtpunkt';

  @override
  String get centerLeds => 'Senter LEDer';

  @override
  String get childHitches => 'Grenkoblinger';

  @override
  String get chooseLog => 'Velg logg';

  @override
  String get clearPoints => 'Fjern punkt';

  @override
  String get clearRecordedPath => 'Fjern stiopptak';

  @override
  String get clearUnused => 'Fjern ubrukte';

  @override
  String get clearWorkedArea => 'Fjern utført areal';

  @override
  String get close => 'Lukk';

  @override
  String get closeActive => 'Lukk aktiv';

  @override
  String closeActiveValue(String value) {
    return 'Lukk aktiv $value?';
  }

  @override
  String closeValue(String value) {
    return 'Lukk $value';
  }

  @override
  String get colorTheme => 'Fargetema';

  @override
  String get combined => 'Kombinert';

  @override
  String get configure => 'Konfigurer';

  @override
  String configureValue(String value) {
    return 'Konfigurer $value';
  }

  @override
  String get confirm => 'Bekreft';

  @override
  String connectorRelation(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'other': 'Relasjon',
        'child': 'Barn',
        'parent': 'Forelder',
      },
    );
    return '$_temp0';
  }

  @override
  String connectors(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Koblinger',
      few: 'Koblinger',
      two: 'Koblinger',
      one: 'Kobling',
      zero: 'Koblinger',
      other: 'Koblinger',
    );
    return '$_temp0';
  }

  @override
  String connectorType(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'other': 'Kobling',
        'fixed': 'Fast',
        'drawbar': 'Drag',
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
        'disabled': 'CoolStep min: Deaktivert',
        'other': 'CoolStep min: $rpmString RPM',
      },
    );
    return '$_temp0';
  }

  @override
  String get copernicusId => 'Copernicus ID';

  @override
  String copyFromValue(String value) {
    return 'Kopier fra $value';
  }

  @override
  String get copyWorkSessionDescription =>
      'Kopier skifte, redskap og navigasjon fra denne.';

  @override
  String get create => 'Opprett';

  @override
  String get created => 'Opprettet';

  @override
  String get createFieldFromPathTracking => 'Opprett skifte fra sporfølging';

  @override
  String get createFieldFromRecording => 'Opprett skifte fra opptak';

  @override
  String get createNew => 'Opprett ny';

  @override
  String get createPathTrackingFromBufferedFieldExterior =>
      'Opprett sporfølging fra bufret ytre skiftegrense';

  @override
  String createValue(String value) {
    return 'Opprett $value';
  }

  @override
  String crossDistanceGain(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Kryssavstand-forsterkning: $valueString';
  }

  @override
  String get current => 'Nåværende';

  @override
  String get curve => 'Kurve';

  @override
  String get cycleLightSystemDarkMode => 'Veksle mellom lys/system/mørk modus';

  @override
  String get dadMode => 'Pappamodus';

  @override
  String get dataUsageMonth => 'Dataforbruk (måned):';

  @override
  String get dataUsageSession => 'Dataforbruk (økt):';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Dager',
      few: 'Dager',
      two: 'Dager',
      one: 'Dag',
      zero: 'Dager',
      other: 'Dager',
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
        'disabled': 'DcStep min: Deaktivert',
        'other': 'DcStep min: $rpmString RPM',
      },
    );
    return '$_temp0';
  }

  @override
  String get deactivateAll => 'Deaktiver alle';

  @override
  String get debug => 'Feilsøk';

  @override
  String get debugging => 'Feilsøking';

  @override
  String get debugMode => 'Feilsøkingsmodus';

  @override
  String get decoration => 'Dekorasjon';

  @override
  String get decorationSidewaysOffset =>
      'Dekorasjon sideveis forskyvning (-venstre / +høyre)';

  @override
  String get defaultOption => 'Standard';

  @override
  String delayValueMs(int value) {
    return 'Forsinkelse: $value ms';
  }

  @override
  String delayReadings(num value) {
    return 'Forsink avlesninger: $value ms';
  }

  @override
  String deleteValue(String value) {
    return 'Slett $value';
  }

  @override
  String get detach => 'Koble fra';

  @override
  String get detachAll => 'Koble fra alt';

  @override
  String dimensions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Dimensjoner',
      few: 'Dimensjoner',
      two: 'Dimensjoner',
      one: 'Dimensjon',
      zero: 'Dimensjoner',
      other: 'Dimensjoner',
    );
    return '$_temp0';
  }

  @override
  String get disableAutosteering => 'Deaktiver autostyring';

  @override
  String get discrete => 'Diskret';

  @override
  String get distancePerLed => 'Avstand / LED';

  @override
  String get doNotDisable => 'Må ikke slås av';

  @override
  String drawValue(String value) {
    return 'Tegn $value';
  }

  @override
  String get dualAntenna => 'Doble antenner';

  @override
  String get dualAntennaAngle =>
      'Vinkel fra hoved til sekundær antenne, 0 er fremover (-venstre / +høyre)';

  @override
  String get dualAntennaBaseline => 'Avstand mellom antenner';

  @override
  String get dubinsPath => 'Dubins-sti';

  @override
  String get editNote => 'Rediger notat';

  @override
  String editValue(String value) {
    return 'Rediger $value';
  }

  @override
  String get editRecordedPath => 'Rediger stiopptak';

  @override
  String get effectiveOnRestart => 'Aktiveres ved omstart';

  @override
  String get enable => 'Aktiver';

  @override
  String get enable3d => 'Aktiver 3D';

  @override
  String get enableAutosteering => 'Aktiver autostyring';

  @override
  String get enabled => 'Aktivert';

  @override
  String get end => 'Slutt';

  @override
  String get endLeds => 'Ytre LEDer';

  @override
  String get enteredIdMustBeAValidUuid => 'IDen må være en gyldig UUID.';

  @override
  String enterValue(String value) {
    return 'Fyll inn $value';
  }

  @override
  String get equalWidths => 'Like bredder';

  @override
  String get equalWorkingWidths => 'Like arbeidsbredder';

  @override
  String get equipment => 'Redskap';

  @override
  String get equipmentDrawbarLength => 'Redskapets draglengde';

  @override
  String get equipmentSetup => 'Redskapsoppsett';

  @override
  String get error => 'Feil';

  @override
  String get errorOverTime => 'Feil over tid';

  @override
  String get errorRateOfChange => 'Feil-endringshastighet';

  @override
  String get ethernet => 'Ethernet';

  @override
  String get everything => 'Alt';

  @override
  String get exportAction => 'Eksporter';

  @override
  String get exportAll => 'Eksporter alt';

  @override
  String exportValue(String value) {
    return 'Eksporter $value';
  }

  @override
  String get exterior => 'Ytre';

  @override
  String get exteriorBoundary => 'Ytre grense';

  @override
  String get field => 'Skifte';

  @override
  String get fieldBuffer => 'Skiftebuffer';

  @override
  String get finishEditing => 'Fullfør redigering';

  @override
  String get finishRecording => 'Fullfør opptak';

  @override
  String get front => 'Front';

  @override
  String get frontAxle => 'Framaksling';

  @override
  String get frontAxleToFrontHitchDistance =>
      'Framaksling til frontkobling avstand';

  @override
  String get frontAxleToRearDrawbarDistance =>
      'Framaksling til dragkobling bak avstand';

  @override
  String get frontAxleToRearHitchDistance =>
      'Framaksling til bakkobling avstand';

  @override
  String get frontWheels => 'Framhjul';

  @override
  String get fullstep => 'Fullsteg';

  @override
  String get gain => 'Forsterkning';

  @override
  String get gaugeAverageCount => 'Målinger til instrumentgjennomsnitt';

  @override
  String get getHardwareConfig => 'Hent maskinvarekonfigurasjon';

  @override
  String get gnss => 'GNSS';

  @override
  String get graph => 'Graf';

  @override
  String get grid => 'Rutenett';

  @override
  String get guidance => 'Navigasjon';

  @override
  String get hardware => 'Maskinvare';

  @override
  String get hardwareConnected => 'Tilkoblet maskinvare';

  @override
  String get hardwareNotConnected => 'Ikke tilkoblet maskinvare';

  @override
  String get heading => 'Retning';

  @override
  String get hideUnlitLeds => 'Skjul inaktive LEDer';

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
        'disabled': 'High velocity min: Deaktivert',
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
        'other': 'Feste',
        'fixed': 'Trepunkt',
        'drawbar': 'Drag',
      },
    );
    return '$_temp0';
  }

  @override
  String get hitchToDecorationStart => 'Avstand fra kobling til dekorasjon';

  @override
  String get hitchToFrontFixedHitchDistance =>
      'Avstand fra kobling til fast kobling foran';

  @override
  String get hitchToRearFixedHitchDistance =>
      'Avstand fra kobling til fast kobling bak';

  @override
  String get hitchToRearDrawbarDistance => 'Avstand fra kobling til drag bak';

  @override
  String hitches(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Koblinger',
      few: 'Koblinger',
      two: 'Koblinger',
      one: 'Kobling',
      zero: 'Koblinger',
      other: 'Koblinger',
    );
    return '$_temp0';
  }

  @override
  String get holdToReset => 'Hold for å nullstille';

  @override
  String get home => 'Hjem';

  @override
  String get homeEnterPosition => 'Oppgi hjemposisjon';

  @override
  String get homeSetToScreenCenter => 'Sett til sentrum av skjermen';

  @override
  String get homeUseEnteredPosition => 'Bruk oppgitt position';

  @override
  String get importAction => 'Importer';

  @override
  String get importExport => 'Importer/Eksporter';

  @override
  String importValue(String value) {
    return 'Importer $value';
  }

  @override
  String get imu => 'IMU';

  @override
  String get imuConfigurator => 'IMU-konfigurator';

  @override
  String get inheritColorsFromVehicle => 'Bruk farger fra kjøretøy';

  @override
  String get inner => 'Indre';

  @override
  String get interior => 'Indre';

  @override
  String get interiorBorderBufferDistance =>
      'Indre grense (hull) bufferavstand';

  @override
  String get intermediateLeds => 'Mellom-LEDer';

  @override
  String get interpolationDescription =>
      'Interpolasjon mellom GNSS-oppdateringer';

  @override
  String interpolationDistance(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Interpolasjonslengde: $valueString m';
  }

  @override
  String get interval => 'Intervall';

  @override
  String invalidValue(String value) {
    return 'Ugyldig $value';
  }

  @override
  String get invertLedBar => 'Inverter LED-bar';

  @override
  String get invertPitch => 'Inverter høyderetning';

  @override
  String get invertRoll => 'Inverter krenging';

  @override
  String get invertSensorInput => 'Inverter sensoravlesning';

  @override
  String keepLogsForValue(String value) {
    return 'Bevar logger i $value';
  }

  @override
  String sinceLastValueMs(int value) {
    return 'Siden forrige: $value ms';
  }

  @override
  String get lateralOffset => 'Sideveis forskyvning';

  @override
  String get latitudeNS => 'Breddegrad (N/S)';

  @override
  String get latitudeShort => 'Lat';

  @override
  String get ledSize => 'LED-størrelse';

  @override
  String get left => 'Venstre';

  @override
  String get length => 'Lengde';

  @override
  String get limitMode => 'Endemodus';

  @override
  String get line => 'Linje';

  @override
  String get load => 'Last inn';

  @override
  String loadValue(String value) {
    return 'Last inn $value';
  }

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
  String get lockMapToVehicle => 'Lås kart til kjøretøy';

  @override
  String get lockToField => 'Lås til skifte';

  @override
  String get logging => 'Logging';

  @override
  String get logReplay => 'Loggreprise';

  @override
  String get logs => 'Logger';

  @override
  String get longitudeEW => 'Lengdegrad (Ø/V)';

  @override
  String get longitudinalOffset => 'Langsgående forskyvning';

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

    return 'Se fremover minsteavstand: $valueString m';
  }

  @override
  String lookAheadTime(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Se fremover tid : $valueString s';
  }

  @override
  String get loop => 'Gjenta';

  @override
  String get lowerThreshold => 'Nedre grense';

  @override
  String get manual => 'Manuell';

  @override
  String get manualSimulationMode => 'Manuell simulasjonsmodus';

  @override
  String get map => 'Kart';

  @override
  String get max => 'Maks';

  @override
  String maxAccelerationRpms(int value) {
    return 'Maks akselerasjon: $value RPM/s';
  }

  @override
  String maxAngularVelocity(int value) {
    return 'Maks vinkelhastighet: $value °/s';
  }

  @override
  String maxDecelerationRpms(int value) {
    return 'Maks nedbremsing: $value RPM/s';
  }

  @override
  String get maxDistance => 'Maks avstand';

  @override
  String maxReversingVelocity(num value, String unit) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Maks ryggehastighet: $valueString $unit';
  }

  @override
  String get maxSteeringAngle => 'Maks styrevinkel (indre hjul)';

  @override
  String maxVelocityRpm(int value) {
    return 'Maks hastighet: $value RPM';
  }

  @override
  String get menu => 'Meny';

  @override
  String get microsteps => 'Mikrosteg';

  @override
  String get min => 'Min';

  @override
  String get minDistance => 'Min. avstand';

  @override
  String get miniMap => 'Minikart';

  @override
  String get minimumTurningRadius => 'Minste svingradius';

  @override
  String get minOffsetSkips => 'Min linjehopp';

  @override
  String get motor => 'Motor';

  @override
  String motorStatusOption(String option) {
    String _temp0 = intl.Intl.selectLogic(
      option,
      {
        'other': 'Ukjent motortilstand',
        'disabled': 'Motor deaktivert',
        'freeWheeling': 'Motor er i fri',
        'running': 'Motor kjører',
        'stalled': 'Motor har steilet',
        'noCommand': 'Motoren har stoppet, for lenge siden siste melding',
        'standby': 'Motor er deaktivert, men vil bli aktivert automatisk',
      },
    );
    return '$_temp0';
  }

  @override
  String get motorTargetOverride => 'Overstyring av motor-målverdi';

  @override
  String get name => 'Navn';

  @override
  String get nameAlreadyInUse => 'Navn allerede i bruk';

  @override
  String nameTheValue(String value) {
    return 'Navngi $value';
  }

  @override
  String get network => 'Nettverk';

  @override
  String get noAction => 'Ingen funksjon';

  @override
  String get noName => 'Mangler navn';

  @override
  String noNameEnteredValue(String value) {
    return 'Mangler navn! Vennligst skriv et navn slik at $value kan lagres!';
  }

  @override
  String get normalized => 'Normalisert';

  @override
  String get note => 'Notat';

  @override
  String notReceivingSensorReadings(String sensor) {
    return 'Mottar ikke $sensor-avlesninger';
  }

  @override
  String ntripActiveProfile(String profile) {
    return 'Aktiv profil: $profile';
  }

  @override
  String get ntripAddProfile => 'Legg til profil';

  @override
  String get ntripCasterSourcetable => 'NTRIP-sender kildetabell';

  @override
  String get ntripCreateProfileTitle => 'Opprett NTRIP-profil';

  @override
  String get ntripEditProfile => 'Rediger profil';

  @override
  String get ntripEditProfileTitle => 'Rediger NTRIP-profil';

  @override
  String get ntripFindClosestBaseStation => 'Finn nærmeste basestasjon';

  @override
  String get ntripGgaSendingInterval => 'GGA sendingsintervall (s)';

  @override
  String get ntripHostAddress => 'Serveraddresse';

  @override
  String get ntripHostPort => 'Serverport';

  @override
  String get ntripInputWholeSeconds =>
      'Fyll inn hele sekunder fra 1 eller tomt';

  @override
  String get ntripLoadProfile => 'Last inn profil';

  @override
  String get ntripMountPointBaseStation => 'Basestatjon';

  @override
  String get ntripNoProfileSelected => 'Ingen profil valgt';

  @override
  String get ntripRtk => 'NTRIP (RTK)';

  @override
  String get nudgeControls => 'Dultekontroll';

  @override
  String get numberOfSections => 'Antall seksjoner';

  @override
  String get numberOfWheelsDescription =>
      'Antall hjul,\nm.a.o. har kjøretøyet tvilling-\neller trippel-hjul';

  @override
  String get off => 'Av';

  @override
  String get offsetFromBaseLine => 'Forskyvning fra hovedlinje';

  @override
  String get offsetLeftRight => 'Forskyvning (-venstre / +høyre)';

  @override
  String get on => 'På';

  @override
  String get onlyUseGnssSyncedReadings =>
      'Bruk bare GNSS-synkroniserte avlesninger';

  @override
  String get opacity => 'Ugjennomsiktighet';

  @override
  String get outer => 'Ytre';

  @override
  String get password => 'Passord';

  @override
  String get path => 'Spor';

  @override
  String get pathColor => 'Sporfarge';

  @override
  String get pathRecording => 'Sporopptak';

  @override
  String get pathTracking => 'Sporfølging';

  @override
  String get pathType => 'Sportype';

  @override
  String get pause => 'Pause';

  @override
  String get perspective => 'Perspektiv';

  @override
  String get pid => 'PID';

  @override
  String get pitch => 'Høyderetning';

  @override
  String get pitchGain => 'Høyderetning-forsterknig';

  @override
  String get pivotAntennaWarning =>
      'Antennen MÅ være på kjøretøyets framkropp!';

  @override
  String pivotCenterToValue(String value) {
    return 'Dreiepunkt til $value';
  }

  @override
  String get pivotToAntenna => 'Dreiepunkt til antenne';

  @override
  String points(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Punkt',
      few: 'Punkt',
      two: 'Punkt',
      one: 'Punkt',
      zero: 'Punkt',
      other: 'Punkt',
    );
    return '$_temp0';
  }

  @override
  String get pointsAhead => 'Punkter foran';

  @override
  String get pointsBehind => 'Punkter bak';

  @override
  String polygons(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Polygoner',
      few: 'Polygoner',
      two: 'Polygoner',
      one: 'Polygon',
      zero: 'Polygoner',
      other: 'Polygoner',
    );
    return '$_temp0';
  }

  @override
  String get portNetwork => 'Port';

  @override
  String get position => 'Posisjon';

  @override
  String get rawBufferPoints => 'Rå-bufferpunkter';

  @override
  String rawSensorReading(String sensor) {
    return 'Råavlesning fra $sensor';
  }

  @override
  String get rear => 'Bak';

  @override
  String get rearAxle => 'Bakaksling';

  @override
  String get rearAxleToFrontHitchDistance =>
      'Bakaksling til frontkobling avstand';

  @override
  String get rearAxleToRearDrawbarDistance =>
      'Bakaksling til dragkobling bak avstand';

  @override
  String get rearAxleToRearHitchDistance => 'Bakaksling til bakkobling avstand';

  @override
  String get rearWheels => 'Bakhjul';

  @override
  String get receivePort => 'Mottaksport';

  @override
  String get receiverConfiguration => 'Mottakerkonfigurasjon';

  @override
  String get record => 'Ta opp';

  @override
  String get recording => 'Tar opp';

  @override
  String get recordingPosition => 'Opptaksposisjon';

  @override
  String get recordingPositionFromWorkingAreaStart =>
      'Opptaksposisjon-avstand fra start på arbeidsområde.';

  @override
  String get recordingTapToPause => 'Tar opp, trykk for å pause';

  @override
  String get remoteControl => 'Fjernkontroll';

  @override
  String remoteControlAction(String option) {
    String _temp0 = intl.Intl.selectLogic(
      option,
      {
        'other': 'Ingen funksjon',
        'toggleEquipmentSections': 'Veksle redskapseksjoner',
        'toggleAutosteering': 'Veksle autostyring',
        'toggleABSnap': 'Veksle AB-linje hopp til nærmeste linje',
        'resetNudgeDistance': 'Nullstill dulteavstand til 0',
      },
    );
    return '$_temp0';
  }

  @override
  String get remoteControlConfigurator => 'Fjernkontroll-konfigurator';

  @override
  String get remoteControlHardwareAddress =>
      'Adresse til fjernkontrollmaskinvare';

  @override
  String removeValue(String value) {
    return 'Fjern $value?';
  }

  @override
  String get removeSensitiveData => 'Fjern sensitiv data';

  @override
  String get removeSensitiveDataDescription =>
      'Fjerner NTRIP-profiler (brukernavn, passord), Copernicus ID og hjemposisjon';

  @override
  String get rename => 'Gi nytt navn';

  @override
  String get renameAndSave => 'Gi nytt navn og lagre';

  @override
  String renameValue(String value) {
    return 'Gi nytt navn til $value';
  }

  @override
  String get reset => 'Nullstill';

  @override
  String get resetFinishedLines => 'Nullstill fullførte linjer';

  @override
  String resetValue(String value) {
    return 'Nullstill $value';
  }

  @override
  String get restart => 'Restart';

  @override
  String get resume => 'Fortsett';

  @override
  String get reverseMotorDirection => 'Reverser motorretning';

  @override
  String get right => 'Høyre';

  @override
  String rmsCurrent(int value) {
    return 'RMS-strøm: $value mA';
  }

  @override
  String get roll => 'Krenging';

  @override
  String get rollGain => 'Krengeforsterkning';

  @override
  String get rotatePoints => 'Roter punker';

  @override
  String get rotation => 'Rotasjon';

  @override
  String get save => 'Lagre';

  @override
  String get saveEquipmentSetup => 'Lagre redskapsoppsett';

  @override
  String get saveSetup => 'Lagre oppsett';

  @override
  String saveValue(String value) {
    return 'Lagre $value';
  }

  @override
  String sections(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Seksjoner',
      few: 'Seksjoner',
      two: 'Seksjoner',
      one: 'Seksjon',
      zero: 'Seksjoner',
      other: 'Seksjoner',
    );
    return '$_temp0';
  }

  @override
  String get sectionWidth => 'Seksjonsbredde';

  @override
  String get sectionWorkingWidth => 'Seksjon-arbeidsbredde';

  @override
  String get selectExportFolder => 'Velg eksportmappe';

  @override
  String selectValueFile(String value) {
    return 'Velg $value-fil';
  }

  @override
  String get selectWorkSessionFile => 'Velg arbeidsøkt-fil';

  @override
  String get selectZipFileToImport => 'Velg Zip-fil for importering';

  @override
  String get sendGnssConfig => 'Send GNSS-konfigurasjon';

  @override
  String get sendHardwareConfig => 'Send maskinvarekonfigurasjon';

  @override
  String sendOverProtocol(String protocol) {
    return 'Send over $protocol';
  }

  @override
  String get sendPort => 'Sendeport';

  @override
  String get serialPort => 'Serieport';

  @override
  String get setDate => 'Sett dato';

  @override
  String get setTimeOfDay => 'Sett klokkeslett';

  @override
  String get settings => 'Innstillinger';

  @override
  String get setToEquipmentWidth => 'Sett til redskapsbredde';

  @override
  String setToValueXVehicleTurningRadius(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 2,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Sett til ${valueString}x kjøretøyets svingradius';
  }

  @override
  String get setToLiveReading => 'Sett til nåværende avlesning';

  @override
  String get setToZeroToDisableInReverse =>
      'Sett til 0 for å skru helt av i revers';

  @override
  String get setup => 'Oppsett';

  @override
  String setValue(String value) {
    return 'Sett $value';
  }

  @override
  String get show => 'Vis';

  @override
  String get showAllLines => 'Vis alle linjer';

  @override
  String get showLastRecordedPath => 'Vis siste stiopptak';

  @override
  String get showMotorTargetOverride => 'Vis overstyring av motor-målverdi';

  @override
  String showValue(String value) {
    return 'Vis $value';
  }

  @override
  String get sidewaysOffsetLeftRight =>
      'Sideveis forskyvning (-venstre / +høyre)';

  @override
  String sidewaysOffsetValue(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Sideveis forskyvning: $valueString m';
  }

  @override
  String get simCore => 'Sim-kjerne';

  @override
  String simulationFrequency(int value) {
    return 'Simulajonsfrekvens: $value Hz';
  }

  @override
  String get size => 'Størrelse';

  @override
  String get sizeIndicator => 'Størrelsesindikator';

  @override
  String get snap => 'Hopp';

  @override
  String softeningGain(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Dempingsforskterkning: $valueString';
  }

  @override
  String get spacing => 'Avstand';

  @override
  String stallGuardThreshold(int value) {
    return 'StallGuard-grense: $value';
  }

  @override
  String get stallingSensitivity => 'Steilesensitivitet';

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
        'disabled': 'StealthChop maks: Deaktivert',
        'other': 'StealthChop maks: $rpmString RPM',
      },
    );
    return '$_temp0';
  }

  @override
  String get steering => 'Styring';

  @override
  String steeringActual(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Faktisk styrevinkel: $valueString°';
  }

  @override
  String steeringDelta(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Styring Δ: $valueString°';
  }

  @override
  String steeringTarget(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Styringsmål: $valueString°';
  }

  @override
  String get steeringConfigurator => 'Styringskonfigurator';

  @override
  String get steeringHardwareAddress => 'Adresse til styringsmaskinvare';

  @override
  String get stepsIncrement => 'Steg / økning';

  @override
  String stepsCenterMax(num value) {
    return 'Sentrum-Maks: $value';
  }

  @override
  String stepsMinCenter(num value) {
    return 'Min-Sentrum: $value';
  }

  @override
  String stepsPerRotation(int value) {
    return 'Steg per rotasjon: $value';
  }

  @override
  String get stepSize => 'Stegstørrelse';

  @override
  String get stopButtonText => 'Stopp';

  @override
  String get stopTheVehicle => 'Stopp kjøretøyet';

  @override
  String get swapPitchAndRollAxes => 'Bytt høyderetning- og krengingsakser';

  @override
  String swaths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Skår',
      few: 'Skår',
      two: 'Skår',
      one: 'Skår',
      zero: 'Skår',
      other: 'Skår',
    );
    return '$_temp0';
  }

  @override
  String get target => 'Mål';

  @override
  String get test => 'Test';

  @override
  String get testDistance => 'Testavstand';

  @override
  String get theme => 'Fargetema';

  @override
  String get themeAutoMode => 'Auto modus';

  @override
  String get themeDarkMode => 'Mørk modus';

  @override
  String get themeLightMode => 'Lys modus';

  @override
  String get themeMode => 'Fargemodus';

  @override
  String get theoretical => 'Teoretisk';

  @override
  String thisDeviceValue(String value) {
    return '$value på denne enheten';
  }

  @override
  String get thresholdVelocities => 'Hastighetsgrenser';

  @override
  String get time => 'Tid';

  @override
  String get toLine => 'Til linje';

  @override
  String totalWidth(num value) {
    return 'Totalbredde: $value m';
  }

  @override
  String get tracking => 'Sporing';

  @override
  String get trackingMode => 'Sporingsmodus';

  @override
  String get trackingModePurePursuit => 'Pure pursuit';

  @override
  String get trackingModeStanley => 'Stanley';

  @override
  String trackWidth(String value) {
    return 'Sporbredde, mellom sentre av $value';
  }

  @override
  String get trajectory => 'Bane';

  @override
  String get travelledPath => 'Kjørt spor';

  @override
  String get turningCircles => 'Sving';

  @override
  String get turningRadius => 'Svingradius';

  @override
  String get turnTriggerAngle => 'Svingvinkel-trigger';

  @override
  String get type => 'Type';

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
  String get units => 'Enheter';

  @override
  String get unknownLocale => 'Ukjent språk';

  @override
  String get update => 'Oppdater';

  @override
  String updateFrequency(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Oppdateringsfrekvens: $valueString Hz';
  }

  @override
  String get upperThreshold => 'Øvre grense';

  @override
  String get useDevicePosition => 'Bruk enhetsposisjon';

  @override
  String useAsValue(String value) {
    return 'Bruk som $value';
  }

  @override
  String get usbSerial => 'USB / serie';

  @override
  String useValue(String value) {
    return 'Bruk $value';
  }

  @override
  String useImuValue(String value) {
    return 'Bruk IMU-$value';
  }

  @override
  String get username => 'Brukernavn';

  @override
  String validValue(String value) {
    return 'Gyldig $value';
  }

  @override
  String get value => 'Verdi';

  @override
  String get vehicle => 'Kjøretøy';

  @override
  String get vehicleBodyLength => 'Lengde, uten hjul';

  @override
  String get vehicleBodyWidth => 'Bredde, uten hjul';

  @override
  String get vehicleImage => 'Kjøretøybilde';

  @override
  String vehicleType(String option) {
    String _temp0 = intl.Intl.selectLogic(
      option,
      {
        'other': 'Kjøretøy',
        'Tractor': 'Traktor',
        'Harvester': 'Skurtresker',
        'ArticulatedTractor': 'Midjestyrt traktor',
      },
    );
    return '$_temp0';
  }

  @override
  String get velocity => 'Hastighet';

  @override
  String velocityGain(num value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.decimalPatternDigits(
          locale: localeName,
          decimalDigits: 1,
        );
    final String valueString = valueNumberFormat.format(value);

    return 'Hastighetsforsterkning: $valueString';
  }

  @override
  String get virtualLedBar => 'Virtuell LED-bar';

  @override
  String get was => 'WAS';

  @override
  String get wasMotorConfigurator => 'WAS & motor-konfigurator';

  @override
  String wasReading(int value) {
    return 'WAS-avlesning: $value';
  }

  @override
  String wasTarget(int value) {
    return 'WAS-mål:$value';
  }

  @override
  String get wheelbase => 'Akselavstand';

  @override
  String get wheelDiameter => 'Hjuldiameter';

  @override
  String get wheelSpacing => 'Hjulavstand';

  @override
  String get wheelWidth => 'Hjulbredde';

  @override
  String wheels(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      many: 'Hjul',
      few: 'Hjul',
      two: 'Hjul',
      one: 'Hjul',
      zero: 'Hjul',
      other: 'Hjul',
    );
    return '$_temp0';
  }

  @override
  String get width => 'Bredde';

  @override
  String get wifi => 'WiFi';

  @override
  String get workingAreaLength => 'Arbeidsområde-lengde';

  @override
  String get workingWidth => 'Arbeidsbredde';

  @override
  String get workSession => 'Arbeidsøkt';

  @override
  String get yaw => 'Dreining';

  @override
  String get yawFromStartup => 'Dreining fra oppstart';

  @override
  String get zeroBearingToGnssBearing => 'Nullstill retning til GNSS-retning';

  @override
  String get zeroBearingToNorth => 'Nullstill retning til nord';

  @override
  String get zeroImuDescription =>
      'Forsikre at kjøreyøet står på en flat, vanrett overflate, helst av betong eller asfalt.';

  @override
  String get zeroImuPitchAndRoll => 'Nullstill IMU høyderetning og krenging';

  @override
  String get zoomIn => 'Zoom inn';

  @override
  String get zoomOut => 'Zoom ut';
}
