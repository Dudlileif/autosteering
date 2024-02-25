import 'package:collection/collection.dart';
import 'package:geobase/geobase.dart';

/// A NTRIP server sourcetable entry.
///
/// https://software.rtcm-ntrip.org/wiki/Sourcetable
/// https://gssc.esa.int/wp-content/uploads/2018/07/NtripDocumentation.pdf
sealed class NtripSourcetableEntry {
  /// A NTRIP server sourcetable entry.
  ///
  /// https://software.rtcm-ntrip.org/wiki/Sourcetable
  /// https://gssc.esa.int/wp-content/uploads/2018/07/NtripDocumentation.pdf
  const NtripSourcetableEntry({
    required this.raw,
    required this.type,
    this.identifier,
    this.misc,
  });

  /// Attempts to create an [NtripSourcetableEntry] from the [raw] string.
  ///
  /// If the [raw] string is of the wrong format, null will be returned.
  static NtripSourcetableEntry? fromString(String raw) {
    final split = raw.split(';');
    final type = split[0];

    return switch (type) {
      'CAS' => NtripMountPointCaster.fromString(raw),
      'NET' => NtripMountPointNetwork.fromString(raw),
      'STR' => NtripMountPointStream.fromString(raw),
      _ => null,
    };
  }

  /// The raw string value that this table entry was generated from.
  final String raw;

  /// The type of sourcetable entry.
  final String type;

  /// The identifier of the table entry, typically nearby city or operator.
  final String? identifier;

  /// The optional miscellaneous information.
  final List<String>? misc;
}

/// An abstract class for combining some common parameters for the mount point
/// and caster entries in the sourcetable.
abstract class NtripMountPoint extends NtripSourcetableEntry {
  /// An abstract class for combining some common parameters for the mount
  /// point and caster entries in the sourcetable.
  const NtripMountPoint({
    required super.raw,
    required super.type,
    super.identifier,
    super.misc,
    this.country,
    this.position,
    this.requiresClientPosition = false,
  });

  /// The country which this mount point is in.
  final String? country;

  /// The world position of the mount point.
  final Geographic? position;

  /// Whether the mount point requied positional data from the client.
  final bool requiresClientPosition;

  /// The distance to the [point] if the [position] is not null.
  double? distanceToPoint(Geographic point) =>
      position?.rhumb.distanceTo(point);
}

/// An NTRIP server sourcetable entry for a mount point stream at the
/// caster server.
/// https://software.rtcm-ntrip.org/wiki/STR
class NtripMountPointStream extends NtripMountPoint {
  const NtripMountPointStream._({
    required super.raw,
    required super.type,
    super.identifier,
    super.misc,
    super.country,
    super.position,
    super.requiresClientPosition,
    this.name,
    this.format,
    this.formatDetails,
    this.carrier,
    this.constellations,
    this.network,
    this.solution,
    this.generator,
    this.compressionEnctryption,
    this.authentication,
    this.fee = false,
    this.bitrate,
  });

  /// Creates an [NtripMountPointStream] from the [raw] string.
  factory NtripMountPointStream.fromString(String raw) {
    final split = raw.split(';');

    final lat = double.tryParse(split.elementAtOrNull(9) ?? '');
    final lon = double.tryParse(split.elementAtOrNull(10) ?? '');
    Geographic? position;
    if (lat != null && lon != null) {
      position = Geographic(lon: lon, lat: lat);
    }

    return NtripMountPointStream._(
      raw: raw,
      type: split.elementAtOrNull(0) ?? 'STR',
      name: split.elementAtOrNull(1),
      identifier: split.elementAtOrNull(2),
      format: split.elementAtOrNull(3),
      formatDetails: split.elementAtOrNull(4)?.split(','),
      carrier: int.tryParse(split.elementAtOrNull(5) ?? ''),
      constellations: split.elementAtOrNull(6)?.split(','),
      network: split.elementAtOrNull(7),
      country: split.elementAtOrNull(8),
      position: position,
      requiresClientPosition:
          bool.tryParse(split.elementAtOrNull(11) ?? '') ?? false,
      solution: int.tryParse(split.elementAtOrNull(12) ?? ''),
      generator: split.elementAtOrNull(13),
      compressionEnctryption: split.elementAtOrNull(14),
      authentication: split.elementAtOrNull(15),
      fee: bool.tryParse(split.elementAtOrNull(16) ?? '') ?? false,
      bitrate: int.tryParse(split.elementAtOrNull(17) ?? ''),
      misc: split.whereIndexed((index, element) => index >= 18).toList(),
    );
  }

  /// The name of the mount point.
  final String? name;

  /// The format of correction messages.
  final String? format;

  /// Details about the correction messages, typically which messages are sent
  /// and how often
  final List<String>? formatDetails;

  /// Carrier phase information
  ///
  /// 0 -> No information
  /// 1 -> L1 phase included
  /// 2 -> L1 & L2 phase included
  final int? carrier;

  /// Which satellite constellations which corrections are provided for.
  final List<String>? constellations;

  /// The network used to distribute the messages.
  final String? network;

  /// Whether the stream is generated from single reference station or from
  /// networked reference stations.
  ///
  /// 0 -> Single base
  /// 1 -> Network
  final int? solution;

  /// Hard- or software generating the message data.
  final String? generator;

  /// Compression/encryption algorithm applied.
  final String? compressionEnctryption;

  /// Access protection for this data stream.
  ///
  /// N -> None
  /// B -> Basic
  /// D -> Digest
  final String? authentication;

  /// Whether there is a fee for using this data stream.
  final bool fee;

  /// The bit rate of the data stream, bits per second.
  final int? bitrate;
}

/// An NTRIP server sourcetable entry for a direct connection to an NTRIP
/// caster.
///
/// https://software.rtcm-ntrip.org/wiki/CAS
class NtripMountPointCaster extends NtripMountPoint {
  const NtripMountPointCaster._({
    required super.raw,
    required super.type,
    super.identifier,
    super.misc,
    super.country,
    super.position,
    super.requiresClientPosition,
    this.host,
    this.port,
    this.operator,
    this.fallbackHost,
    this.fallbackPort,
  });

  /// Creates an [NtripMountPointCaster] from the [raw] string.
  factory NtripMountPointCaster.fromString(String raw) {
    final split = raw.split(';');

    final lat = double.tryParse(split.elementAtOrNull(7) ?? '');
    final lon = double.tryParse(split.elementAtOrNull(8) ?? '');
    Geographic? position;
    if (lat != null && lon != null) {
      position = Geographic(lon: lon, lat: lat);
    }

    return NtripMountPointCaster._(
      raw: raw,
      type: split.elementAtOrNull(0) ?? 'CAS',
      host: split.elementAtOrNull(1),
      port: int.tryParse(split.elementAtOrNull(2) ?? ''),
      identifier: split.elementAtOrNull(3),
      operator: split.elementAtOrNull(4),
      requiresClientPosition:
          bool.tryParse(split.elementAtOrNull(5) ?? '') ?? false,
      country: split.elementAtOrNull(8),
      position: position,
      fallbackHost: split.elementAtOrNull(9),
      fallbackPort: int.tryParse(split.elementAtOrNull(10) ?? ''),
      misc: split.whereIndexed((index, element) => index >= 11).toList(),
    );
  }

  /// The host address for the caster.
  final String? host;

  /// The TCP access port for the caster.
  final int? port;

  /// The operator of the caster.
  final String? operator;

  /// The fallback host address for the caster.
  final String? fallbackHost;

  /// The fallback TCP access port for the caster.
  final int? fallbackPort;
}

/// An NTRIP server sourcetable entry that describes the network the source
/// table comes from.
///
/// https://software.rtcm-ntrip.org/wiki/NET
class NtripMountPointNetwork extends NtripSourcetableEntry {
  const NtripMountPointNetwork._({
    required super.raw,
    required super.type,
    super.misc,
    super.identifier,
    this.operator,
    this.authentication,
    this.fee = false,
    this.networkInfoAddress,
    this.streamInfoAddress,
    this.registrationAddress,
  });

  /// Creates an [NtripMountPointNetwork] from the [raw] string.
  factory NtripMountPointNetwork.fromString(String raw) {
    final split = raw.split(';');

    return NtripMountPointNetwork._(
      raw: raw,
      type: split.elementAtOrNull(0) ?? 'NET',
      identifier: split.elementAtOrNull(1),
      operator: split.elementAtOrNull(2),
      authentication: split.elementAtOrNull(3),
      fee: bool.tryParse(split.elementAtOrNull(4) ?? '') ?? false,
      networkInfoAddress: split.elementAtOrNull(5),
      streamInfoAddress: split.elementAtOrNull(6),
      registrationAddress: split.elementAtOrNull(7),
      misc: split.whereIndexed((index, element) => index >= 8).toList(),
    );
  }

  /// The operator of this NTRIP server network.
  final String? operator;

  /// Access protection for data streams of the network.
  ///
  /// N -> None
  /// B -> Basic
  /// D -> Digest
  final String? authentication;

  /// Whether there is a fee for using data streams from this network.
  final bool fee;

  /// Web address for information about the network.
  final String? networkInfoAddress;

  /// Web address for information about the streams from the network.
  final String? streamInfoAddress;

  /// Web address / mail address for registration with the network.
  final String? registrationAddress;
}
