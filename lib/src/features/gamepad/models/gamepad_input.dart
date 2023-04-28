import 'package:agopengps_flutter/src/features/gamepad/gamepad.dart';
import 'package:gamepads/gamepads.dart';

/// A wrapping class for [GamepadEvent] for applying deadzones and a better
/// button programming interface.
class GamepadInput {
  /// The default factory constructor for [GamepadInput].
  factory GamepadInput({
    required GamepadEvent event,
    required GamepadConfig config,
  }) {
    GamepadAnalogInput? analogInput;
    GamepadButtonInput? buttonInput;
    GamepadPovInput? povInput;
    if (event.type == KeyType.button) {
      buttonInput = GamepadButtonInput.map(event.key);
    }
    // Special case for pov events as they are also analog.
    else if (event.key.contains('pov')) {
      povInput = GamepadPovInput.map(event.value);
    } else if (event.type == KeyType.analog) {
      analogInput = GamepadAnalogInput.map(event.key);
    }
    return GamepadInput._internal(
      event,
      config,
      analogInput,
      buttonInput,
      povInput,
    );
  }

  /// The interal constructor for the class.
  const GamepadInput._internal(
    this.event,
    this.config,
    this.analogInput,
    this.buttonInput,
    this.povInput,
  );

  /// The [GamepadEvent] that this input wraps around.
  final GamepadEvent event;

  /// The configuration of the gamepad's axis/buttons.
  final GamepadConfig config;

  /// The analog input type, if there is one.
  final GamepadAnalogInput? analogInput;

  /// The button input type, if there is one.
  final GamepadButtonInput? buttonInput;

  /// The POV input type, if there is one.
  final GamepadPovInput? povInput;

  /// The raw value of the input action.
  double get value => event.value;

  /// The [KeyType] of the input action.
  KeyType get type => event.type;

  // Deadzone around 0.
  double get deadZoneMin => config.deadZoneMin(analogInput);
  // Deadzone around 1.
  double get deadZoneMax => config.deadZoneMax(analogInput);

  /// The center adjusted value after deadzone has been applied.
  /// Typically used for self-centering joysticks.
  double get joystickValueDeadZoneAdjusted {
    // Skip if not relevant.
    if (buttonInput != null || povInput != null) {
      return value;
    }

    // Normalize input to a contiuous range.
    // 0...65535 -> -1...0...1
    final normalized = (value - config.analogCenter) / config.analogCenter;

    // +/- Find the sign of the value by comparing with the center.
    final sign = normalized != 0 ? normalized / normalized.abs() : 1;

    // If the deadzones are the same, act as a button above the threshold.
    if (deadZoneMin == deadZoneMax) {
      return normalized.abs() > deadZoneMin ? 1 : 0;
    }

    // Set all values in deadzone to deadzone values.
    // -1...0...1 -> -deadZoneMax...-deadZoneMin|+deadZoneMin...deadZoneMax
    final deadZoneAdjusted = normalized.abs() < deadZoneMin
        ? sign * deadZoneMin
        : normalized.abs() > deadZoneMax
            ? sign * deadZoneMax
            : normalized;

    // Normalize to the full range again so that we start at 0 when
    // passing deadZoneMin and end at +/- 1 when passing deadZoneMax.
    // -deadZoneMax...-deadZoneMin|+deadZoneMin...deadZoneMax -> -1...0...1
    final deadZoneNormalized = sign *
        (deadZoneAdjusted.abs() - deadZoneMin) /
        (deadZoneMax - deadZoneMin);

    // Normalize the whole range to a normal 0...1 range.
    // -1...0...1 -> 0...1
    return (1 + deadZoneNormalized) / 2;
  }

  /// The adjusted value after deadzone has been applied.
  /// Typically used for linear triggers/sliders.
  double get triggerValueDeadZoneAdjusted {
    // Skip if not relevant
    if (buttonInput != null || povInput != null) {
      return value;
    }

    // Normalize input to a contiuous range.
    // 0...65535 -> 0...1
    final normalized = value / config.analogCenter;

    // If the deadzones are the same, act as a button above the threshold.
    if (deadZoneMin == deadZoneMax) {
      return normalized.abs() > deadZoneMin ? 1 : 0;
    }

    // Set all values in deadzone to deadzone values.
    // 0...1 -> deadZoneMin...deadZoneMax
    final deadZoneAdjusted = normalized < deadZoneMin
        ? deadZoneMin
        : normalized > deadZoneMax
            ? deadZoneMax
            : normalized;

    // Normalize to the full range again so that we start at 0 when
    // passing deadZoneMin and end at 1 when passing deadZoneMax.
    // deadZoneMin...deadZoneMax -> 0...1
    final deadZoneNormalized =
        (deadZoneAdjusted.abs() - deadZoneMin) / (deadZoneMax - deadZoneMin);

    return deadZoneNormalized;
  }
}

/// An enumerator for mapping button presses to their corresponding
/// input keys.
enum GamepadButtonInput {
  square('button-0'),
  cross('button-1'),
  circle('button-2'),
  triangle('button-3'),
  leftBumper('button-4'),
  rightBumper('button-5'),
  leftTrigger('button-6'),
  rightTrigger('button-7'),
  share('button-8'),
  start('button-9'),
  leftStickButton('button-10'),
  rightStickButton('button-11'),
  home('button-12'),
  touchpad('button-13'),
  unknown(null);

  const GamepadButtonInput(this.id);

  /// The id of the button.
  final String? id;

  /// Map an input [key] to the corresponding [GamepadButtonInput]
  /// button action.
  static GamepadButtonInput map(String? key) {
    switch (key) {
      case 'button-0':
        return square;
      case 'button-1':
        return cross;
      case 'button-2':
        return circle;
      case 'button-3':
        return triangle;
      case 'button-4':
        return leftBumper;
      case 'button-5':
        return rightBumper;
      case 'button-6':
        return leftTrigger;
      case 'button-7':
        return rightTrigger;
      case 'button-8':
        return share;
      case 'button-9':
        return start;
      case 'button-10':
        return leftStickButton;
      case 'button-11':
        return rightStickButton;
      case 'button-12':
        return home;
      case 'button-13':
        return touchpad;
      default:
        return unknown;
    }
  }
}

/// An enumerator for mapping analog axis to their corresponding
/// input keys.
enum GamepadAnalogInput {
  leftStickX('dwXpos'),
  leftStickY('dwYpos'),
  rightStickX('dwZpos'),
  rightStickY('dwRpos'),
  rightTrigger('dwUpos'),
  leftTrigger('dwVpos'),
  pov('pov'),
  unknown(null);

  const GamepadAnalogInput(this.id);

  /// The id of the axis.
  final String? id;

  /// Map an input [key] to the corresponding [GamepadAnalogInput] analog axis.
  static GamepadAnalogInput map(String? key) {
    switch (key) {
      case 'dwXpos':
        return leftStickX;
      case 'dwYpos':
        return leftStickY;
      case 'dwZpos':
        return rightStickX;
      case 'dwRpos':
        return rightStickY;
      case 'dwUpos':
        return rightTrigger;
      case 'dwVpos':
        return leftTrigger;
      case 'pov':
        return pov;
      default:
        return unknown;
    }
  }
}

/// An enumerator for mapping POV button presses to their corresponding
/// analog input values.
enum GamepadPovInput {
  up(0),
  upRight(4500),
  right(9000),
  downRight(13500),
  down(18000),
  downLeft(22500),
  left(27000),
  upLeft(31500),
  released(65535);

  const GamepadPovInput(this.value);

  /// The analog input value.
  final double value;

  /// POV button action to degrees.
  double? get degrees => value != 65535 ? value / 100 : null;

  /// Map an input [value] to the corresponding [GamepadPovInput] button action.
  static GamepadPovInput map(double value) {
    switch (value.round()) {
      case 0:
        return GamepadPovInput.up;
      case 4500:
        return GamepadPovInput.upRight;
      case 9000:
        return GamepadPovInput.right;
      case 13500:
        return GamepadPovInput.downRight;
      case 18000:
        return GamepadPovInput.down;
      case 22500:
        return GamepadPovInput.downLeft;
      case 27000:
        return GamepadPovInput.left;
      case 31500:
        return GamepadPovInput.upLeft;
      case 65535:
        return GamepadPovInput.released;
      default:
        return GamepadPovInput.released;
    }
  }
}
