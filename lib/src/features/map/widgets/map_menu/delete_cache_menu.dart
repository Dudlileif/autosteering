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


import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/theme/utils/menu_button_text_extension.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_io/io.dart';

/// A menu/button for for deleting map layer caches.
///
/// The menu also has the size and creation date for the map layer caches
/// on native systems.
class DeleteCacheMenu extends ConsumerWidget {
  /// A menu/button for for deleting map layer caches.
  ///
  /// The menu also has the size and creation date for the map layer caches
  /// on native systems.
  const DeleteCacheMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (Device.isWeb) {
      final textStyle = Theme.of(context).menuButtonWithChildrenText;
      return MenuItemButton(
        leadingIcon: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Icon(Icons.delete),
        ),
        onPressed: FastCachedImageConfig.clearAllCachedImages,
        child: Text(
          'Delete cache',
          style: textStyle,
        ),
      );
    }
    final directories = ref.watch(mapCacheDirectoriesProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => <String>[],
          loading: () => <String>[],
        );

    return directories.isNotEmpty
        ? MenuButtonWithChildren(
            text: 'Delete cache',
            icon: Icons.delete,
            menuChildren: directories.map(_CacheDeleter.new).toList(),
          )
        : const SizedBox.shrink();
  }
}

/// A [MenuItemButton] for deleting the folder at [path].
///
/// Also shows folder size and when it was created.
class _CacheDeleter extends ConsumerWidget {
  /// A [MenuItemButton] for deleting the folder at [path].
  ///
  /// Also shows folder size and when it was created.
  const _CacheDeleter(this.path);

  final String path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pathSplit = path.split(Platform.pathSeparator).reversed;

    return MenuItemButton(
      closeOnActivate: false,
      trailingIcon: const Icon(Icons.delete),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            switch (pathSplit.first == 'OpenStreetMap') {
              true => pathSplit.first,
              false => '${pathSplit.elementAt(1)} - ${pathSplit.first}',
            },
          ),
          Text(
            'Size: ${ref.watch(directorySizeProvider(path)).when(
                  data: (data) => data != null ? fileEntitySize(data) : null,
                  error: (error, stackTrace) => '-',
                  loading: () => '-',
                )}',
            style: const TextStyle(fontWeight: FontWeight.w300),
          ),
          Text(
            'Created: ${ref.watch(mapCacheDateProvider(path)).when(
                  data: (data) => data?.toIso8601String().substring(0, 10),
                  error: (error, stackTrace) => '-',
                  loading: () => '-',
                )}',
            style: const TextStyle(fontWeight: FontWeight.w300),
          ),
        ],
      ),
      onPressed: () => ref.watch(directoryDeleteProvider(path)),
    );
  }
}
