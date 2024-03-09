/// An enumerator for different motor statuses.
enum MotorStatus {
  /// The motor is disabled.
  disabled('Motor disabled'),

  /// The motor is in freewheeling mode.
  freeWheeling('Motor freewheeling'),

  /// The motor is running.
  running('Motor running'),

  /// The motor has stopped after stalling.
  stalled('Motor stalled'),

  /// The motor has stopped, too long since last command update.
  noCommand('Motor stopped, too long since last command'),

  /// The motor is disabled, but will be enabled automatically, usually used
  /// when stationary but with autosteer engaged, which will then enable the
  /// motor when moving again.
  standby('Motor is disabled, but will be enabled automatically');

  const MotorStatus(this.text);

  /// A describing text for the status.
  final String text;
}