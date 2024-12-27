// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_io/io.dart';

part 'internet_address_providers.g.dart';

/// A provider for figuring out whether an internet [address] is valid, i.e.
/// has a reachable IP address attached to it.
@riverpod
Future<bool> validInternetAddress(
  Ref ref,
  String? address,
) async {
  if (address == null) {
    return false;
  }
  try {
    return (await InternetAddress.lookup(address)).isNotEmpty;
  } on Exception catch (_) {
    return false;
  }
}
