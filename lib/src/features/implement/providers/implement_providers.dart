// Copyright (C) 2026 Gaute Hagen
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

import 'package:autosteering/src/features/database/database.dart' hide Polygon;
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/implement/implement.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'implement_providers.g.dart';

/// A provider for getting implements from the database.
@riverpod
FutureOr<List<Equipment>> implements(
  Ref ref, {
  int limit = 10,
  int? offset,
}) async => ref
    .watch(databaseProvider)
    .implementsDao
    .list(limit: limit, offset: offset);

/// A provider for inserting [implement] into the database.
@Riverpod(keepAlive: true)
FutureOr<void> insertImplement(
  Ref ref,
  Equipment implement, {
  bool setLoaded = false,
}) async {
  final database = ref.watch(databaseProvider);
  final implementId = await database.implementsDao.insertImplement(implement);

  final dbImplement = await database.implementsDao.getImplement(implementId);
  ref
      .read(configuredImplementProvider.notifier)
      .update(
        dbImplement,
      );

  if (setLoaded) {
    ref.read(loadedEquipmentProvider.notifier).update(dbImplement);
  }
  ref.invalidateSelf();
}

/// A provider for updating [implement] in the database.
@Riverpod(keepAlive: true)
FutureOr<void> updateImplement(
  Ref ref,
  Equipment implement, {
  bool setLoaded = false,
}) async {
  final database = ref.watch(databaseProvider);
  await database.implementsDao.updateImplement(implement);

  if (setLoaded) {
    final dbImplement = await database.implementsDao.getImplement(
      implement.id!,
    );
    ref.read(loadedEquipmentProvider.notifier).update(dbImplement);
  }
  ref.invalidateSelf();
}
