/// An enumerator for the status/mode of the autosteering.
enum AutosteeringState {
  /// The autosteering is enabled.
  enabled,

  /// The autosteering is disabled.
  disabled,

  /// The autosteering will automatically re-enable when the vehicle passes
  /// the minimum threshold velocity.
  standby;
}
